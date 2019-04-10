<style>
.widget-user-header {
  background-position: center center;
  background-size: cover;
}
</style>


<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12 mt-3">
        <div class="card">
          <div class="card-header">Profile</div>

          <div class="card-body">
            <div class="card card-widget widget-user">
              <!-- Add the bg color to the header using any of the bg-* classes -->
              <div
                class="widget-user-header text-white"
                style="background: url('https://images.unsplash.com/photo-1553880376-2dec478c8e3b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80') center center;"
              >
                <h3 class="widget-user-username">{{user.name}}</h3>
                <h5 class="widget-user-desc">{{user.type}}</h5>
              </div>
              <div class="widget-user-image">
                <img class="img-circle" :src="getProfilePhoto()" alt="User Avatar">
              </div>
              <div class="card-footer">
                <div class="row">
                  <div class="col-sm-4 border-right">
                    <div class="description-block">
                      <h5 class="description-header">0</h5>
                      <span class="description-text">Attribute</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4 border-right">
                    <div class="description-block">
                      <h5 class="description-header">0</h5>
                      <span class="description-text">Attribute</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4">
                    <div class="description-block">
                      <h5 class="description-header">0</h5>
                      <span class="description-text">Attribute</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
            </div>

            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <!-- <li class="nav-item">
                    <a class="nav-link" href="#samplemenu" data-toggle="tab">Sample Menu</a>
                  </li> -->
                  <li class="nav-item">
                    <a class="nav-link active" href="#settings" data-toggle="tab">Settings</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <!-- /.tab-pane -->

                  <div class="active tab-pane" id="settings">
                    <form class="form-horizontal">
                      <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                        <div class="col-sm-10">
                          <input
                            v-model="form.name"
                            name="name"
                            type="text"
                            class="form-control"
                            id="inputName"
                            placeholder="Name"
                            :class="{ 'is-invalid': form.errors.has('name') }"
                          >
                          <has-error :form="form" field="name"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                        <div class="col-sm-10">
                          <input
                            v-model="form.email"
                            name="email"
                            type="email"
                            class="form-control"
                            id="inputEmail"
                            placeholder="Email"
                            :class="{ 'is-invalid': form.errors.has('email') }"
                          >
                          <has-error :form="form" field="email"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputExperience" class="col-sm-2 control-label">Bio</label>

                        <div class="col-sm-10">
                          <textarea
                            v-model="form.bio"
                            name="bio"
                            class="form-control"
                            id="inputExperience"
                            placeholder="Enter Bio"
                          ></textarea>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputFile" class="col-sm-2 control-label">File input</label>
                        <div class="col-sm-10">
                          <div class="input-group">
                            <div class="custom-file">
                              <input
                                type="file"
                                accept="image/x-png, image/gif, image/jpeg"
                                @change="updateProfilePhoto"
                                class="custom-file-input"
                                id="exampleInputFile"
                              >
                              <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                            </div>
                            <!-- <div class="input-group-append">
                              <span class="input-group-text" id>Upload</span>
                            </div>-->
                          </div>
                          <img
                            src
                            class="d-none img-fluid my-3"
                            alt="image"
                            id="display"
                            width="200"
                          >
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputEmail" class="col-sm-6 control-label">
                          Password(leave if you don't want to change
                          your password)
                        </label>

                        <div class="col-sm-10">
                          <input
                            v-model="form.password"
                            name="password"
                            type="password"
                            class="form-control"
                            id="inputPassword"
                            placeholder="Password"
                            :class="{ 'is-invalid': form.errors.has('password') }"
                          >
                          <has-error :form="form" field="password"></has-error>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button
                            @click.prevent="updateInfo"
                            type="submit"
                            class="btn btn-success"
                          >Update</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div>
              <!-- /.card-body -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {},
      form: new Form({
        id: "",
        name: "",
        email: "",
        password: "",
        type: "",
        bio: "",
        photo: ""
      })
    };
  },
  mounted() {
    console.log("Component mounted.");
  },

  created() {
    axios
      .get("api/profile")
      .then(({ data }) => {
        this.user = data;
        this.form.fill(data);
      })
      .catch(err => {});
    console.log("created");
  },

  methods: {
    updateProfilePhoto(e) {
      let file = e.target.files[0];
      let reader = new FileReader();
      if (file["size"] < 2111775) {
        reader.onloadend = ev => {
          this.form.photo = reader.result;
          $("#display")
            .attr("src", ev.target.result)
            .removeClass("d-none");
        };
        reader.readAsDataURL(file);
      } else {
        swal.fire({
          type: "error",
          title: "oops",
          text: "Can not upload more than 2M",
          closeOnConfirm: false
        });
      }
    },
    updateInfo() {
      this.$Progress.start();
      this.form
        .put("api/profile")
        .then(() => {
          $("#display").hide();
          Fire.$emit("Refresh");
          toast.fire({
            type: "success",
            title: "User updated"
          });
          this.$Progress.finish();
        })
        .catch(() => {
          toast.fire({
            type: "error",
            title: "oop! something wrong"
          });
          this.$Progress.fail();
        });
    },
    getProfilePhoto() {
      let photo =
        this.form.photo.length > 200
          ? this.form.photo
          : "img/profile/" + this.form.photo;
      return photo;
    }
  }
};
</script>
