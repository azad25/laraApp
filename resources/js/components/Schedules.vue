<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Schedules</h3>

            <div class="card-tools">
              <button class="btn btn-success" @click="openModal">
                Add New
                <i class="fas fa-user-plus fa-faw"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <th>Schedule Name</th>
                  <th>Departure</th>
                  <th>Arrival</th>
                  <th>Description</th>
                  <th>Options</th>
                </tr>
                <tr v-for="schedule in schedules.data" :key="schedule.id">
                  <td>{{ schedule.schedule }}</td>
                  <td>{{ schedule.dep_des.destinationName }} {{ schedule.departure }}</td>
                  <td>{{ schedule.ar_des.destinationName }} {{ schedule.arrival }}</td>
                  <td>{{ schedule.description }}</td>

                  <td>
                    <a href="#" @click="editModal(schedule)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <span>/</span>
                    <a href="#" @click="deleteData(schedule.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="schedules" @pagination-change-page="getResults"></pagination>
          </div>
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
          <div class="pb-3 m-auto text-center" v-if="destinations.length == 0">
            <p>Please add destinations first</p>
            <button
              class="btn btn-primary"
              onclick="window.location='/destinations'"
            >Add Destinations</button>
          </div>
          <form
            @submit.prevent="editMode ? update() : create()"
            id="createForm"
            v-if="destinations.length != 0"
          >
            <div class="modal-body">
              <div class="form-group">
                <input
                  v-model="form.schedule"
                  type="text"
                  name="schedule"
                  placeholder="Schedule Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'schedule'
                                        )
                                    }"
                />
                <has-error :form="form" field="schedule"></has-error>
              </div>

              <div class="form-group">
                <textarea
                  id="description"
                  v-model="form.description"
                  name="description"
                  placeholder="Short description for schedule"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'description'
                                        )
                                    }"
                ></textarea>
                <has-error :form="form" field="description"></has-error>
              </div>
              <div class="form-group">
                <label for="">Select Departure Place</label>
                <select
                  id="fromm"
                  v-model="form.fromm"
                  name="fromm"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('fromm') }"
                >
                  <option
                    v-for="item in destinations.data"
                    v-bind:value="item.id"
                  >{{item.destinationName}}</option>
                </select>
                <has-error :form="form" field="fromm"></has-error>
              </div>
              <div class="form-group">
                <input
                  v-model="form.departure"
                  type="text"
                  name="departure"
                  placeholder="Departure time"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'departure'
                                        )
                                    }"
                />
                <has-error :form="form" field="departure"></has-error>
              </div>
              <div class="form-group">
                <label for="">Select Arrival Place</label>
                <select
                  id="too"
                  v-model="form.too"
                  name="too"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('too') }"
                >
                  <option
                    v-for="item in destinations.data"
                    v-bind:value="item.id"
                  >{{item.destinationName}}</option>
                </select>
                <has-error :form="form" field="too"></has-error>
              </div>
              <div class="form-group">
                <input
                  v-model="form.arrival"
                  type="text"
                  name="arrival"
                  placeholder="Arrival time"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'arrival'
                                        )
                                    }"
                />
                <has-error :form="form" field="arrival"></has-error>
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
      destinations: {},
      schedules: {},
      departure: {},
      arrival: {},
      form: new Form({
        id: "",
        schedule: "",
        description: "",
        departure: "",
        arrival: "",
        fromm: "",
        too: "",
        destination_id: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/schedules?page=" + page).then(response => {
        this.schedules = response.data.data;
        this.$Progress.finish();
      });
    },
    openModal() {
      this.editMode = false;
      this.form.errors.clear();
      this.form.reset();
      $("#addNew").modal("show");
    },
    editModal(data) {
      this.editMode = true;
      this.form.errors.clear();
      this.form.reset();
      $("#addNew").modal("show");
      this.form.fill(data);
    },
    load() {
      this.$Progress.start();
      this.getDestinations();
      if (this.$gate.isAdminorUser()) {
        axios
          .get("api/schedules")
          .then(({ data }) => {
            this.schedules = data.data;
            this.$Progress.finish();
            });
      }
      this.$Progress.finish();
    },

    getDestinations() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/destinations").then(({ data }) => {
          this.destinations = data.data;
        });
      }
      this.$Progress.finish();
    },

    create() {
      this.$Progress.start();
      this.user_id = window.user.id;
      this.form.destination_id = this.form.fromm;
      this.form
        .post("api/schedules")
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

    update(id) {
      this.$Progress.start();
      this.form
        .put("api/schedules/" + this.form.id)
        .then(() => {
          $("#addNew").modal("hide");
          swal.fire("Updated!", "updated", "success");
          Fire.$emit("Refresh");
          this.$Progress.finish();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    },

    deleteData(id) {
      swal
        .fire({
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!"
        })
        .then(result => {
          if (result.value) {
            this.$Progress.start();
            //send request to server
            this.form
              .delete("api/schedules/" + id)
              .then(() => {
                if (result.value) {
                  this.$Progress.finish();
                  swal.fire(
                    "Deleted!",
                    "Your file has been deleted.",
                    "success"
                  );
                  Fire.$emit("Refresh");
                }
              })
              .catch(() => {
                this.$Progress.fail();
                swal.fire("Failed!", "You are not authorized!", "warning");
              });
          }
        });
    }
  },

  beforeMount() {
    this.$parent.auth();
    this.$Progress.start();
    this.load();
    Fire.$on("Refresh", () => {
      this.load();
    });

    Fire.$on("searching", () => {
      this.$Progress.start();
      let query = this.$parent.search;
      axios
        .get("api/findSchedules?q=" + query)
        .then(data => {
          this.schedules = data.data;
        })
        .then(() => {
          this.$Progress.finish();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    });
  },
  mounted() {
    
  }
};
</script>
