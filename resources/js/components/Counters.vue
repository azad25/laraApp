<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Parent Counters</h3>

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
                  <th>Name</th>
                  <th>Description</th>
                  <th>Phone</th>
                  <th>Location</th>
                  <th>Option</th>
                </tr>
                <tr v-for="counter in counters.data" :key="counter.id">
                  <td>{{ counter.counterName }}</td>
                  <td>{{ counter.description }}</td>
                  <td>{{ counter.phone }}</td>
                  <td>{{ counter.destination.destinationName }}</td>
                  <td>
                    <a href="#" @click="editModal(counter)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <span>/</span>
                    <a href="#" @click="deleteData(counter.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="counters" @pagination-change-page="getResults"></pagination>
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
            <h5 v-show="!editMode" class="modal-title" id="addShipTitle">Add Ship</h5>
            <h5 v-show="editMode" class="modal-title" id="editShipTitle">Edit Ship</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form
            @submit.prevent="editMode ? update() : create()"
            id="createForm"
          >
            <div class="modal-body">
              <div class="form-group">
                <input
                  v-model="form.counterName"
                  type="text"
                  name="counterName"
                  placeholder="Counter Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'counterName'
                                        )
                                    }"
                />
                <has-error :form="form" field="counterName"></has-error>
              </div>

              <div class="form-group">
                <input
                  v-model="form.phone"
                  type="text"
                  name="phone"
                  placeholder="Phone"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'phone'
                                        )
                                    }"
                />
                <has-error :form="form" field="phone"></has-error>
              </div>

              <div class="form-group">
                <textarea
                  id="description"
                  v-model="form.description"
                  name="description"
                  placeholder="Short description for ship(optional)"
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
                <select
                  id="destination"
                  v-model="form.destination_id"
                  name="destination_id"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('destination_id') }"
                >
                  <option v-for="item in destinations.data" v-bind:value="item.id" :key="item.id">{{item.destinationName}}</option>
                </select>
                <has-error :form="form" field="destination_id"></has-error>
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
      counters: {},
      destinations: {},
      form: new Form({
        id: "",
        counterName: "",
        description: "",
        phone: "",
        destination_id: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/counters?page=" + page).then(response => {
        this.counters = response.data.data;
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
        axios.get("api/counters").then(({ data }) => {
          this.counters = data.data;
          this.$Progress.finish();
          });
      }
    },

    getDestinations() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/destinations").then(({ data }) => {
          this.destinations = data.data;
          this.$Progress.finish();
        });
      }
    },

    create() {
      this.$Progress.start();
      this.user_id = window.user.id;
      this.form
        .post("api/counters")
        .then(() => {
          $("#addNew").modal("hide");

          Fire.$emit("Refresh");

          toast.fire({
            type: "success",
            title: "Ship created successfully"
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
        .put("api/counters/" + this.form.id)
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
              .delete("api/counters/" + id)
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
        .get("api/findCounters?q=" + query)
        .then(data => {
          this.counters = data.data;
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
