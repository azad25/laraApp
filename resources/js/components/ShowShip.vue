<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Ship: {{ship.shipName}}</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <strong>Details:</strong>
            <br />
            <p>{{ship.description}}</p>
            <strong>Schedules:</strong>
            <br />
            <div v-if="shipSchedules.length != 0">
              <ul>
                <li v-for="item in shipSchedules" :key="item.id">
                  <p>
                    <strong>Branch:</strong>
                    <span>{{item.branch.name}}</span>
                    <br />
                    <strong>From:</strong>
                    <span>Departure @ {{item.schedule[0].departure}} at {{item.schedule[0].dep_des.destinationName}}</span>
                    <br />
                    <strong>To:</strong>
                    <span>Arrival @ {{item.schedule[0].arrival}} at {{item.schedule[0].ar_des.destinationName}}</span>
                    <br />
                  </p>
                </li>
              </ul>
            </div>
            <div>
              <button class="btn btn-outline-danger" @click="openModal">Add Schedules</button>
              <router-link class="btn btn-outline-primary" to="/ships">
                      <i class="fa fa-eye green"></i> All Ships
              </router-link>
            </div>
          </div>
          <!-- /.card-body -->
          <div class="card-footer"></div>
        </div>
        <!-- /.card -->
      </div>
    </div>

    <div v-if="!$gate.isAdminorUser()">
      <not-found></not-found>
    </div>
    <!-- Modal -->
    <div
      class="modal fade"
      id="addNew"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 v-show="!editMode" class="modal-title" id="addShipTitle">Add Schedule</h5>
            <h5 v-show="editMode" class="modal-title" id="editShipTitle">Edit Schedule</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="pb-3 m-auto text-center" v-if="schedules.length == 0">
            <p>Please add schedules first</p>
            <button
              class="btn btn-primary"
              onclick="window.location='/schedules'"
            >Add Schedules</button>
          </div>
          <form
            @submit.prevent="editMode ? update() : create()"
            id="createForm"
            v-if="schedules.length != 0"
          >
            <div class="modal-body">
              <div class="form-group">
                <label for>Select Schedule</label>
                <select
                  id="branch_schedule"
                  v-model="form.schedule_id"
                  name="schedule_id"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('schedule_id') }"
                >
                  <option
                    v-for="item in schedules.data"
                    v-bind:value="item.id"
                  >{{item.dep_des.destinationName}}-{{item.departure}} to {{item.ar_des.destinationName}}-{{item.arrival}}</option>
                </select>
                <has-error :form="form" field="schedule_id"></has-error>
              </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <button v-show="!editMode" type="submit" class="btn btn-success">Create</button>
              <button v-show="editMode" type="submit" class="btn btn-primary">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      editMode: false,
      ship: {},
      schedules: {},
      branchSchedules: {},
      shipSchedules: {},
      form: new Form({
        id: "",
        schedule_id: "",
        ship_id: "",
        branch_id: ""
      })
    };
  },

  methods: {
    openModal() {
      this.editMode = false;
      this.form.errors.clear();
      this.form.reset();
      $("#addNew").modal("show");
    },
    create() {
      this.$Progress.start();
      this.form.ship_id = this.ship.id;
      this.form.branch_id = window.user.branch_id;
      this.form
        .post(this.$API_URL + "/api/branchSchedules")
        .then(() => {
          $("#addNew").modal("hide");

          Fire.$emit("Refresh");

          toast.fire({
            type: "success",
            title: "Schedule created successfully"
          });
          this.$Progress.finish();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    },
    load(id) {
      this.$Progress.start();
      this.getBranchSchedules();
      this.getShipSchedules(id);
      this.getSchedules();
      if (this.$gate.isAdminorUser()) {
        axios
          .get(this.$API_URL + "/api/ships/" + id)
          .then(({ data }) => {
            this.ship = data.payload;
            this.$Progress.finish();
            });
      }
    },
    getSchedules() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios
          .get(this.$API_URL + "/api/schedules?limit=1000")
          .then(({ data }) => {
            this.schedules = data.data;
            this.$Progress.finish();
          });
      }
    },
    getBranchSchedules() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get(this.$API_URL + "/api/branchSchedules").then(({ data }) => {
          this.branchSchedules = data;
          this.$Progress.finish();
        });
      }
    },
    getShipSchedules(id) {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios
          .get(this.$API_URL + "/api/branchSchedules/getShip/" + id)
          .then(({ data }) => {
            this.shipSchedules = data.payload;
            this.$Progress.finish();
          });
      }
    }
  },

  beforeMount() {
    this.$parent.auth();
    this.$Progress.start();
    const shipId = this.$route.params.ship;

    this.load(shipId);
    Fire.$on("Refresh", () => {
      this.load(shipId);
    });
  },
  mounted() {
    
  }
};
</script>
