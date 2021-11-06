<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Counter Branches</h3>

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
                  <th>Phone</th>
                  <th>Address</th>
                  <th>Option</th>
                </tr>
                <tr v-for="branch in branches.data" :key="branch.id">
                  <td>{{ branch.name }}</td>
                  <td>{{ branch.phone }}</td>
                  <td>{{ branch.address }}</td>
                  <td>
                    <a href="#" @click="editModal(branch)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <span>/</span>
                    <a href="#" @click="deleteData(branch.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="branches" @pagination-change-page="getResults"></pagination>
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
            <h5 v-show="!editMode" class="modal-title" id="addShipTitle">Add Branch</h5>
            <h5 v-show="editMode" class="modal-title" id="editShipTitle">Edit Branch</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="pb-3 m-auto text-center" v-if="counters.length == 0">
            <p>Please add counters first</p>
            <button class="btn btn-primary" onclick="window.location='/counters'">Add Counter</button>
          </div>
          <form
            @submit.prevent="editMode ? update() : create()"
            id="createForm"
            v-if="counters.length != 0"
          >
            <div class="modal-body">
              <div class="form-group">
                <input
                  v-model="form.name"
                  type="text"
                  name="name"
                  placeholder="Branch Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'name'
                                        )
                                    }"
                />
                <has-error :form="form" field="name"></has-error>
              </div>
              <div class="form-group">
                <input
                  v-model="form.phone"
                  type="text"
                  name="phone"
                  placeholder="Branch phone"
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
                <input
                  v-model="form.address"
                  type="text"
                  name="address"
                  placeholder="Branch address"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'address'
                                        )
                                    }"
                />
                <has-error :form="form" field="address"></has-error>
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
                  id="parent_counter_id"
                  v-model="form.parent_counter_id"
                  name="parent_counter_id"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('parent_counter_id') }"
                >
                  <option v-for="item in counters.data" v-bind:value="item.id">{{item.counterName}}</option>
                </select>
                <has-error :form="form" field="parent_counter_id"></has-error>
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
      schedules: {},
      branches: {},
      departure: {},
      arrival: {},
      form: new Form({
        id: "",
        name: "",
        description: "",
        phone: "",
        address: "",
        parent_counter_id:"",
        user_id:""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/branches?page=" + page).then(response => {
        this.branches = response.data.data;
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
      this.getSchedules();
      this.getCounters();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/branches").then(({ data }) => {
          this.branches = data.data;
          this.$Progress.finish();
          });
      }
      this.$Progress.finish();
    },

    getSchedules() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/schedules").then(({ data }) => {
          this.schedules = data.data;
          this.$Progress.finish();
        });
      }
    },
    getCounters() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/counters").then(({ data }) => {
          this.counters = data.data;
          this.$Progress.finish();
        });
      }
    },

    create() {
      this.$Progress.start();
      this.form.user_id = window.user.id;
      this.form
        .post(this.$API_URL+"/api/branches")
        .then(() => {
          $("#addNew").modal("hide");

          Fire.$emit("Refresh");

          toast.fire({
            type: "success",
            title: "Branch created successfully"
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
        .put("api/branches/" + this.form.id)
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
              .delete("api/branches/" + id)
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
        .get("api/findBranches?q=" + query)
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
