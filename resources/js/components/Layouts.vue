<template>
  <div class="container">
    <div class="row mt-5" v-if="$gate.isAdminorUser()">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Create Seat Layout</h3>

            <div class="card-tools"></div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <form @submit.prevent="editMode ? update() : create()" id="createForm">
              <div class="row">
                <div class="form-group col-6">
                  <label for>Select Ship</label>
                  <select
                    id="ship_id"
                    v-model="form.ship_id"
                    name="ship_id"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('ship_id') }"
                    v-on:change="getCategories"
                  >
                    <option
                      v-for="item in ships.data"
                      v-bind:value="item.id"
                      :key="item.id"
                    >{{item.shipName}}</option>
                  </select>
                  <has-error :form="form" field="ship_id"></has-error>
                </div>
                <div class="form-group col-6">
                  <label for>Select Seat Category</label>
                  <select
                    id="category_id"
                    v-model="form.category_id"
                    name="category_id"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('category_id') }"
                  >
                    <option
                      v-for="item in categories.data"
                      v-bind:value="item.id"
                      :key="item.id"
                    >{{item.category_name}}</option>
                  </select>
                  <has-error :form="form" field="category_id"></has-error>
                </div>
                <div class="form-group col-4">
                  <label for>Prefix</label>
                  <input
                    v-model="form.prefix"
                    type="text"
                    name="prefix"
                    placeholder="Prefix"
                    class="form-control"
                    :class="{
                                        'is-invalid': form.errors.has(
                                            'prefix'
                                        )
                                    }"
                  />
                  <has-error :form="form" field="prefix"></has-error>
                </div>
                <div class="form-group col-4">
                  <label for>Row</label>
                  <input
                    v-model="form.row"
                    type="number"
                    name="row"
                    class="form-control"
                    :class="{
                                        'is-invalid': form.errors.has(
                                            'row'
                                        )
                                    }"
                  />
                  <has-error :form="form" field="row"></has-error>
                </div>
                <div class="form-group col-4">
                  <label for>Column</label>
                  <input
                    v-model="form.col"
                    type="number"
                    name="col"
                    class="form-control"
                    :class="{
                                        'is-invalid': form.errors.has(
                                            'col'
                                        )
                                    }"
                  />
                  <has-error :form="form" field="col"></has-error>
                </div>
              </div>
              <button v-show="!editMode" type="submit" class="btn btn-success float-right">Create</button>
            </form>
          </div>
          <!-- /.card-body -->
          <div class="card-footer"></div>
        </div>

        <div class="card" v-show="showMode">
          <div class="card-header">
            <h3 class="card-title">Layout</h3>

            <div class="card-tools"></div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="layout">
              <div class="seat-layout">

              </div>
              <button v-show="!editMode" @click="create_seats" class="btn btn-success float-right ml-2">Save</button>
              <button v-show="!editMode" @click="reset" class="btn btn-danger float-right">Reset</button>
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      editMode: false,
      showMode: false,
      seat_data:{},
      categories: {},
      ships: {},
      form: new Form({
        id: "",
        prefix: "",
        row: "",
        col: "",
        ship_id: "",
        category_id: ""
      })
    };
  },

  methods: {
    load() {
      this.$Progress.start();
      this.getShips();
      this.$Progress.finish();
    },

    getShips() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/ships").then(({ data }) => {
          this.ships = data.data;
          this.$Progress.finish();
        });
      }
    },

    getCategories() {
      this.$Progress.start();
      if (this.$gate.isAdminorUser()) {
        axios.get("api/seat_categories?ship_id="+this.form.ship_id).then(({ data }) => {
          this.categories = data.data;
          this.$Progress.finish();
        });
      }
    },
    reset(){
      this.showMode = false;
      this.form.reset();
    },
    create_seats(){
      axios.post("api/seats",this.seat_data).then((res) => {
          Fire.$emit("Refresh");
          toast.fire({
            type: "success",
            title: "Seats created successfully"
          });
          this.reset();
          this.$Progress.finish();
        })
        .catch(() => {
          this.$Progress.fail();
        });
    },
    create() {
      let send_data = {
        ship_id: this.form.ship_id,
        seat_category: this.form.category_id,
        seat_name: []
      }
      var last_id = 1;
      $(".seat-layout").html("");
      this.showMode = false;
      this.$Progress.start();
      if (this.form.col > 0) {
        for (var i = 1; i <= this.form.col; i++) {
          $(".seat-layout").append("<div class='row'></div>");
        }
        this.showMode = true;
      }
      if (this.form.row > 0) {
        if (this.form.col == 0) {
          $(".seat-layout").html("<div class='row'></div>");
        }
        for (var index = 1; index <= this.form.row; index++) {
          $(".seat-layout .row").append(
            "<div class='seat seat-1'><button class='btn btn-outline-primary' data-toggle='tooltip' data-placement='top' title=''><i class='fas fa-couch green'></i></button><p class='title'></p></div>"
          );
        }
        var s_count = $(".seat").length;
        for (var index = 1; index <= s_count; index++) {
          let title = this.form.prefix + "-" + index;
          $(".seat button")
            .eq(index - 1)
            .attr("title", title);
          send_data.seat_name.push(title);
        }
        this.showMode = true;
        this.seat_data = JSON.parse(JSON.stringify(send_data));
      }
      this.$Progress.finish();
    }
  },

  beforeMount() {
    this.$Progress.start();
    this.$parent.auth();
    this.load();
    Fire.$on("Refresh", () => {
      this.load();
    });
    this.$Progress.finish();
  }
};
</script>
