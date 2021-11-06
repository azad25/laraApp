<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Ships</h3>

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
                  <th>Created at</th>
                  <th>Option</th>
                </tr>
                <tr v-for="ship in ships.data" :key="ship.id">
                  <td>{{ ship.shipName }}</td>
                  <td>{{ ship.created_at | myDate }}</td>
                  <td>
                    <router-link v-bind:to="'/ships/'+ship.id">
                      <i class="fa fa-eye green"></i>
                    </router-link>
                    <a href="#" @click="editModal(ship)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <a href="#" @click="deleteData(ship.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
                <tr v-if="ships.length == 0">
                    <td>No data Found...</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="ships" @pagination-change-page="getResults"></pagination>
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
            v-if="branchSchedules.length != 0"
          >
            <div class="modal-body">
              <div class="form-group">
                <input
                  v-model="form.shipName"
                  type="text"
                  name="shipName"
                  placeholder="Ship Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'shipName'
                                        )
                                    }"
                />
                <has-error :form="form" field="shipName"></has-error>
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
      ships: {},
      branchSchedules: {},
      form: new Form({
        id: "",
        shipName: "",
        description: "",
        schedule_id: "",
        user_id: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/ships?page=" + page).then((response) => {
        this.ships = response.data.data;
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
      this.getBranchSchedules();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/ships").then(({ data }) => {
          this.ships = data.data;
          this.$Progress.finish();
          });
      }
    },

    getBranchSchedules() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/branchSchedules").then(({ data }) => {
          this.branchSchedules = data;
          this.$Progress.finish();
        });
      }
    },

    create() {
      this.$Progress.start();
      this.user_id = window.user.id;
      this.form
        .post("api/ships")
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
        .put("api/ships/" + this.form.id)
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
              .delete("api/ships/" + id)
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
    this.load();
    Fire.$on("Refresh", () => {
      this.load();
    });

    Fire.$on("searching", () => {
      this.$Progress.start();
      let query = this.$parent.search;
      axios
        .get("api/findShips?q=" + query)
        .then(data => {
          this.ships = data.data;
        })
        .then(() => {
          this.$Progress.finish();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    });
  }
};
</script>
