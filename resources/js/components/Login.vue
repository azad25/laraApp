<template>
  <div class="container">
    <div class="row justify-content-center">
      <form class="form-signin container m-auto col-5">
        <img class="text-center m-auto img-thumbnail" src="/img/Logo.png" />
        <h1 class="h3 mb-3 font-weight-normal text-center mt-5">Please sign in</h1>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" class="form-control" placeholder="Email address" required />
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" class="form-control" placeholder="Password" required />

        <button class="btn btn-lg btn-primary btn-block">Sign in</button>
        <a class="btn btn-lg btn-info btn-block" href="#!register">Register</a>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {}
};
</script>
