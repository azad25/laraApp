require("./bootstrap");

window.Vue = require("vue");

import VueRouter from "vue-router";
import moment from "moment";
import VueProgressBar from "vue-progressbar";
import swal from "sweetalert2";
import { Form, HasError, AlertError } from "vform";
import Gate from "./Gate";

Vue.prototype.$gate = new Gate(window.user);
Vue.prototype.$API_URL = "http://localhost:8000";
window.swal = swal;

const toast = swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000
});

window.toast = toast;
window.Form = Form;
window.moment = moment;

Vue.component(HasError.name, HasError);
Vue.component(AlertError.name, AlertError);
Vue.component(
    "passport-clients",
    require("./components/passport/Clients.vue").default
);

Vue.component(
    "passport-authorized-clients",
    require("./components/passport/AuthorizedClients.vue").default
);

Vue.component(
    "passport-personal-access-tokens",
    require("./components/passport/PersonalAccessTokens.vue").default
);

Vue.component("not-found", require("./components/NotFound.vue").default);

Vue.component("pagination", require("laravel-vue-pagination"));

Vue.use(VueRouter);
const options = {
    color: "#2ecc71",
    failedColor: "#e74c3c",
    thickness: "5px",
    transition: {
        speed: "0.2s",
        opacity: "0.6s",
        termination: 300
    },
    autoRevert: true,
    location: "top",
    inverse: false
};

Vue.use(VueProgressBar, options);

let routes = [
    {
        path: "/login",
        component: require("./components/Login.vue").default
    },
    {
        path: "/dashboard",
        component: require("./components/Dashboard.vue").default
    },
    {
        path: "/ships",
        component: require("./components/Ships.vue").default
    },
    {
        path: '/ships/:ship', 
        component: require("./components/ShowShip.vue").default
    },
    {
        path: "/destinations",
        component: require("./components/Destinations.vue").default
    },
    {
        path: "/schedules",
        component: require("./components/Schedules.vue").default
    },
    {
        path: "/counters",
        component: require("./components/Counters.vue").default
    },
    {
        path: "/branches",
        component: require("./components/Branches.vue").default
    },
    {
        path: "/seats",
        component: require("./components/Seats.vue").default
    },
    {
        path: "/categories",
        component: require("./components/Categories.vue").default
    },
    {
        path: "/layouts",
        component: require("./components/Layouts.vue").default
    },
    {
        path: "/tickets",
        component: require("./components/Tickets.vue").default
    },
    {
        path: "/reports",
        component: require("./components/Reports.vue").default
    },
    {
        path: "/roles",
        component: require("./components/Roles.vue").default
    },

    {
        path: "/profile",
        component: require("./components/Profile.vue").default
    },
    { path: "/users", component: require("./components/Users.vue").default },
    {
        path: "/developer",
        component: require("./components/Developer.vue").default
    },
    { path: "*", component: require("./components/NotFound.vue").default },
    { path: "/404", component: require("./components/NotFound.vue").default }
];

const router = new VueRouter({
    mode: "history",
    routes // short for `routes: routes`
});

var gate = Vue.prototype.$gate;

Vue.filter("upText", function(text) {
    return text.charAt(0).toUpperCase() + text.slice(1);
});

Vue.filter("myDate", function(created) {
    return moment(created).format("MMMM Do YYYY");
});

window.Fire = new Vue();

const app = new Vue({
    el: "#app",
    router,
    created: function() {
        this.api_url ="http://localhost:8000"
    },
    data: {
        search: "",
        auth: (() => {
            if (!gate.isAdmin()) {
                router.push("/404");
              }
        })
    },
    methods: {
        searchResult: _.debounce(() => {
            Fire.$emit("searching");
        }, 1000)
    }
});
