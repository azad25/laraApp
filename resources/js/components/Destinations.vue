<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Destinations</h3>

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
                  <th>Option</th>
                </tr>
                <tr v-for="destination in destinations.data" :key="destination.id">
                  <td>{{ destination.destinationName }}</td>
                  <td>{{ destination.description }}</td>
                  <td>
                    <a href="#" @click="editModal(destination)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <span>/</span>
                    <a href="#" @click="deleteData(destination.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="destinations" @pagination-change-page="getResults"></pagination>
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
            <h5 v-show="!editMode" class="modal-title" id="addShipTitle">Add Destination</h5>
            <h5 v-show="editMode" class="modal-title" id="editShipTitle">Edit Destination</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form @submit.prevent="editMode ? update() : create()" id="createForm">
            <div class="modal-body">
              <div class="form-group">
                <input
                  v-model="form.destinationName"
                  type="text"
                  name="destinationName"
                  placeholder="Destination Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'destinationName'
                                        )
                                    }"
                />
                <has-error :form="form" field="destinationName"></has-error>
              </div>

              <div class="form-group">
                <textarea
                  id="description"
                  v-model="form.description"
                  name="description"
                  placeholder="Short description for destination"
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
      destinations: {},
      form: new Form({
        id: "",
        destinationName: "",
        description: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/destinations?page=" + page).then(response => {
        this.destinations = response.data.data;
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
      if (this.$gate.isAdminorUser()) {
        axios
          .get("api/destinations")
          .then(({ data }) => {
            this.destinations = data.data;
            this.$Progress.finish();
          });
      }
      this.$Progress.fail();
    },

    create() {
      this.$Progress.start();
      this.form
        .post("api/destinations")
        .then(() => {
          $("#addNew").modal("hide");

          Fire.$emit("Refresh");

          toast.fire({
            type: "success",
            title: "Ship created successfully"
          });
          this.$Progress.fail();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    },

    update(id) {
      this.$Progress.start();
      this.form
        .put("api/destinations/" + this.form.id)
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
              .delete("api/destinations/" + id)
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
    Fire.$on("Refresh", () => this.load());

    Fire.$on("searching", () => {
      this.$Progress.start();
      let query = this.$parent.search;
      axios
        .get("api/findDestinations?q=" + query)
        .then(data => {
          this.destinations = data.data;
        })
        .then(() => {
          this.$Progress.fail();
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
