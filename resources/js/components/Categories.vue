<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Seat Categories</h3>

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
                  <th>Category</th>
                  <th>Category Price (Tk)</th>
                  <th>Description</th>
                  <th>Ship</th>
                  <th>Option</th>
                </tr>
                <tr v-for="category in categories.data" :key="category.id">
                  <td>{{ category.category_name }}</td>
                  <td>{{ category.category_price }}</td>
                  <td>{{ category.category_description }}</td>
                  <td>{{ category.ship.shipName }}</td>
                  <td>
                    <a href="#" @click="editModal(category)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <a href="#" @click="deleteData(category.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
                <tr v-if="categories.length == 0">
                  <td>No data Found...</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="categories" @pagination-change-page="getResults"></pagination>
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
            <h5 v-show="!editMode" class="modal-title" id="addShipTitle">Add Category</h5>
            <h5 v-show="editMode" class="modal-title" id="editShipTitle">Edit Category</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form @submit.prevent="editMode ? update() : create()" id="createForm">
            <div class="modal-body">
              <div class="form-group">
                <input
                  id="category_name"
                  v-model="form.category_name"
                  type="text"
                  name="category_name"
                  placeholder="Category Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'category_name'
                                        )
                                    }"
                />
                <has-error :form="form" field="category_name"></has-error>
              </div>
              <div class="form-group">
                <input
                  id="category_price"
                  v-model="form.category_price"
                  type="text"
                  name="category_price"
                  placeholder="Category Price"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'category_price'
                                        )
                                    }"
                />
                <has-error :form="form" field="category_price"></has-error>
              </div>

              <div class="form-group">
                <textarea
                  id="category_description"
                  v-model="form.category_description"
                  name="category_description"
                  placeholder="Short Description for ship"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'category_description'
                                        )
                                    }"
                ></textarea>
                <has-error :form="form" field="category_description"></has-error>
              </div>

              <div class="form-group">
                <label for>Select Ship:</label>
                <select
                  id="ship_id"
                  v-model="form.ship_id"
                  name="ship_id"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('ship_id') }"
                >
                  <option v-for="item in ships.data" v-bind:value="item.id">{{item.shipName}}</option>
                </select>
                <has-error :form="form" field="ship_id"></has-error>
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
      categories: {},
      ships: {},
      form: new Form({
        id: "",
        category_name: "",
        category_price: "",
        category_description: "",
        ship_id: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/seat_categories?page=" + page).then(response => {
        this.categories = response;
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
    getShips() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get(this.$API_URL + "/api/ships?limit=1000").then(({ data }) => {
          this.ships = data.data;
          this.$Progress.finish();
        });
      }
    },
    load() {
      this.$Progress.start();
      this.getShips();
      if (this.$gate.isAdminorUser()) {
        axios
          .get("api/seat_categories")
          .then(({ data }) => {
            this.categories = data.data;
            this.$Progress.finish();
            }).catch(() => {
              this.$Progress.fail();
            });
      }
    },

    create() {
      this.$Progress.start();
      this.user_id = window.user.id;
      this.form
        .post("api/seat_categories")
        .then(() => {
          $("#addNew").modal("hide");

          Fire.$emit("Refresh");

          toast.fire({
            type: "success",
            title: "Category created successfully"
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
        .put("api/seat_categories/" + this.form.id)
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
              .delete("api/seat_categories/" + id)
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
  }
};
</script>
