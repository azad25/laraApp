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
                      <h5 class="description-header">3,200</h5>
                      <span class="description-text">SALES</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4 border-right">
                    <div class="description-block">
                      <h5 class="description-header">13,000</h5>
                      <span class="description-text">FOLLOWERS</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4">
                    <div class="description-block">
                      <h5 class="description-header">35</h5>
                      <span class="description-text">PRODUCTS</span>
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
                  <li class="nav-item">
                    <a class="nav-link" href="#activity" data-toggle="tab">Activity</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" href="#settings" data-toggle="tab">Settings</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img
                          class="img-circle img-bordered-sm"
                          src="http://placehold.it/150x100"
                          alt="user image"
                        >
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool">
                            <i class="fa fa-times"></i>
                          </a>
                        </span>
                        <span class="description">Shared publicly - 7:30 PM today</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <p>
                        <a href="#" class="link-black text-sm mr-2">
                          <i class="fa fa-share mr-1"></i> Share
                        </a>
                        <a href="#" class="link-black text-sm">
                          <i class="fa fa-thumbs-o-up mr-1"></i> Like
                        </a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="fa fa-comments-o mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input
                        class="form-control form-control-sm"
                        type="text"
                        placeholder="Type a comment"
                      >
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post clearfix">
                      <div class="user-block">
                        <img
                          class="img-circle img-bordered-sm"
                          src="http://placehold.it/150x100"
                          alt="User Image"
                        >
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="float-right btn-tool">
                            <i class="fa fa-times"></i>
                          </a>
                        </span>
                        <span class="description">Sent you a message - 3 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <form class="form-horizontal">
                        <div class="input-group input-group-sm mb-0">
                          <input class="form-control form-control-sm" placeholder="Response">
                          <div class="input-group-append">
                            <button type="submit" class="btn btn-danger">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img
                          class="img-circle img-bordered-sm"
                          src="http://placehold.it/150x100"
                          alt="User Image"
                        >
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="float-right btn-tool">
                            <i class="fa fa-times"></i>
                          </a>
                        </span>
                        <span class="description">Posted 5 photos - 5 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <div class="row mb-3">
                        <div class="col-sm-6">
                          <img class="img-fluid" src="http://placehold.it/150x100" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-6">
                              <img
                                class="img-fluid mb-3"
                                src="http://placehold.it/150x100"
                                alt="Photo"
                              >
                              <img class="img-fluid" src="http://placehold.it/150x100" alt="Photo">
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                              <img
                                class="img-fluid mb-3"
                                src="http://placehold.it/150x100"
                                alt="Photo"
                              >
                              <img class="img-fluid" src="http://placehold.it/150x100" alt="Photo">
                            </div>
                            <!-- /.col -->
                          </div>
                          <!-- /.row -->
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <p>
                        <a href="#" class="link-black text-sm mr-2">
                          <i class="fa fa-share mr-1"></i> Share
                        </a>
                        <a href="#" class="link-black text-sm">
                          <i class="fa fa-thumbs-o-up mr-1"></i> Like
                        </a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="fa fa-comments-o mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input
                        class="form-control form-control-sm"
                        type="text"
                        placeholder="Type a comment"
                      >
                    </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="timeline">
                    <!-- The timeline -->
                    <ul class="timeline timeline-inverse">
                      <!-- timeline time label -->
                      <li class="time-label">
                        <span class="bg-danger">10 Feb. 2014</span>
                      </li>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <li>
                        <i class="fa fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time">
                            <i class="fa fa-clock-o"></i> 12:05
                          </span>

                          <h3 class="timeline-header">
                            <a href="#">Support Team</a> sent you an email
                          </h3>

                          <div class="timeline-body">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                            weebly ning heekya handango imeem plugg dopplr jibjab, movity
                            jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                            quora plaxo ideeli hulu weebly balihoo...
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read more</a>
                            <a href="#" class="btn btn-danger btn-sm">Delete</a>
                          </div>
                        </div>
                      </li>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <li>
                        <i class="fa fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time">
                            <i class="fa fa-clock-o"></i> 5 mins ago
                          </span>

                          <h3 class="timeline-header no-border">
                            <a href="#">Sarah Young</a> accepted your friend request
                          </h3>
                        </div>
                      </li>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <li>
                        <i class="fa fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time">
                            <i class="fa fa-clock-o"></i> 27 mins ago
                          </span>

                          <h3 class="timeline-header">
                            <a href="#">Jay White</a> commented on your post
                          </h3>

                          <div class="timeline-body">
                            Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                          </div>
                        </div>
                      </li>
                      <!-- END timeline item -->
                      <!-- timeline time label -->
                      <li class="time-label">
                        <span class="bg-success">3 Jan. 2014</span>
                      </li>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <li>
                        <i class="fa fa-camera bg-purple"></i>

                        <div class="timeline-item">
                          <span class="time">
                            <i class="fa fa-clock-o"></i> 2 days ago
                          </span>

                          <h3 class="timeline-header">
                            <a href="#">Mina Lee</a> uploaded new photos
                          </h3>

                          <div class="timeline-body">
                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                            <img src="http://placehold.it/150x100" alt="..." class="margin">
                          </div>
                        </div>
                      </li>
                      <!-- END timeline item -->
                      <li>
                        <i class="fa fa-clock-o bg-gray"></i>
                      </li>
                    </ul>
                  </div>
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
