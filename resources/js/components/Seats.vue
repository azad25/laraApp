<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">All Seats</h3>

            <div class="card-tools">
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body table-responsive p-0">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <th>Name</th>
                  <th>Seat Category</th>
                  <th>Ship</th>
                  <th>Option</th>
                </tr>
                <tr v-for="seat in seats.data" :key="seat.id">
                  <td>{{ seat.seat_name }}</td>
                  <td>{{ seat.category.category_name }}</td>
                  <td>{{ seat.ship.shipName }}</td>
                  <td>
                    <a href="#" @click="editModal(seat)">
                      <i class="fa fa-edit blue"></i>
                    </a>
                    <a href="#" @click="deleteData(seat.id)">
                      <i class="fa fa-trash red"></i>
                    </a>
                  </td>
                </tr>
                <tr v-if="seats.length == 0">
                    <td>No data Found...</td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <pagination :data="seats" @pagination-change-page="getResults"></pagination>
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
                  v-model="form.seat_name"
                  type="text"
                  name="seat_name"
                  placeholder="Seat Name"
                  class="form-control"
                  :class="{
                                        'is-invalid': form.errors.has(
                                            'seat_name'
                                        )
                                    }"
                />
                <has-error :form="form" field="seat_name"></has-error>
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
      seats: {},
      form: new Form({
        id: "",
        seat_name: "",
        seat_category: "",
        ship_id: ""
      })
    };
  },

  methods: {
    getResults(page = 1) {
      this.$Progress.start();
      axios.get("api/seats?page=" + page).then(response => {
        this.seats = response.data.data;
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
        axios.get("api/seats").then(({ data }) => {
          this.seats = data.data;
          this.$Progress.finish();
          });
      }
    },

    update(id) {
      this.$Progress.start();
      this.form
        .put("api/seats/" + this.form.id)
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
              .delete("api/seats/" + id)
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
