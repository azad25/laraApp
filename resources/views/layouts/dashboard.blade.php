@extends('layouts.app')

@section('content')

@auth

<body class="hold-transition sidebar-mini">
    <div class="wrapper" id="app">

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
                </li>
            </ul>
            <div class="text-center font-weight-bold w-100">
                <span class="text-primary">{{ date('d M, Y') }}</span>
                <span id="clock">loading ...</span>
            </div>

            <!-- SEARCH FORM -->
            <div class="input-group input-group-sm col-3 float-right">
                <input class="form-control form-control-navbar " @keyup="searchResult" v-model="search" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-navbar" @click.prevent="searchResult">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="{{ url('/') }}" class="brand-link">
                <img src="{{ asset('img/logo.png') }}" alt="LaraStart Logo" class="brand-image" style="opacity: .8">
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="{{ asset('img/man.png') }}" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">{{ Auth::user()->name}}</a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                        <li class="nav-item">
                            <router-link to="/dashboard" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt blue"></i>
                                <p>
                                    Dashboard
                                </p>
                            </router-link>
                        </li>
                        @can('isAdmin')
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-ship"></i>
                                <p>
                                    Ships
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/ships" class="nav-link">
                                        <i class="nav-icon fa fa-ship red"></i>
                                        <p>
                                            All Ships
                                        </p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link to="/destinations" class="nav-link">
                                        <i class="nav-icon fas fa-location-arrow blue"></i>
                                        <p>
                                            Destinations
                                        </p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link to="/schedules" class="nav-link">
                                        <i class="nav-icon fas fa-clock green"></i>
                                        <p>
                                            Schedules
                                        </p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-globe-asia"></i>
                                <p>
                                    Counter Settings
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/counters" class="nav-link">
                                        <i class="nav-icon fas fa-globe-asia red"></i>
                                        <p>
                                            Parent Counters
                                        </p>
                                    </router-link>
                                </li>
                                <li class="nav-item">
                                    <router-link to="/branches" class="nav-link">
                                        <i class="nav-icon fas fa-map-marker-alt blue"></i>
                                        <p>
                                            Counter Branches
                                        </p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-folder-open"></i>
                                <p>
                                    Seats
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/categories" class="nav-link">
                                        <i class="nav-icon fas fa-folder-open green"></i>
                                        <p>
                                            Seat Cateogories
                                        </p>
                                    </router-link>
                                </li>

                                <li class="nav-item">
                                    <router-link to="/layouts" class="nav-link">
                                        <i class="nav-icon fas fa-layer-group blue"></i>
                                        <p>
                                            Seat Layouts
                                        </p>
                                    </router-link>
                                </li>

                                <li class="nav-item">
                                    <router-link to="/seats" class="nav-link">
                                        <i class="nav-icon fas fa-clipboard-list"></i>
                                        <p>
                                            All Seats
                                        </p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-book"></i>
                                <p>
                                    Ticket Area
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/tickets" class="nav-link">
                                        <i class="nav-icon fas fa-file-alt red"></i>
                                        <p>
                                            Tickets
                                        </p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-users-cog"></i>
                                <p>
                                    Staff
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/users" class="nav-link">
                                        <i class="fas fa-user nav-icon blue"></i>
                                        <p>All Users</p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>

                        @can('isAdmin')
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-cog"></i>
                                <p>
                                    Settings
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <router-link to="/developer" class="nav-link">
                                        <i class="nav-icon fas fa-cogs"></i>
                                        <p>
                                            Developer
                                        </p>
                                    </router-link>
                                </li>

                                <li class="nav-item">
                                    <router-link to="/profile" class="nav-link">
                                        <i class="nav-icon fas fa-user orange"></i>
                                        <p>
                                            Profile
                                        </p>
                                    </router-link>
                                </li>
                            </ul>
                        </li>
                        @endcan

                        @endcan
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                <i class="nav-icon fa fa-power-off red"></i>
                                <p>
                                    {{ __('Logout') }}
                                </p>
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <router-view></router-view>

                    <vue-progress-bar></vue-progress-bar>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
        <footer class="main-footer">
            <!-- To the right -->
            <div class="float-right d-none d-sm-inline">

            </div>
            <!-- Default to the left -->
            <strong>Copyright &copy; {{ date('Y') }} <a href="/">NSL</a>.</strong> All rights
            reserved.
        </footer>
    </div>
    <!-- ./wrapper -->
    <script>
        window.user = @json(auth()->user());
        var update = function() {
            document.getElementById("clock")
                .innerHTML = moment().format('h:mm:ss a');
        }
        setInterval(update, 1000);
        var time = new Date().getTime();
        $(document.body).bind("mousemove keypress", function(e) {
            time = new Date().getTime();
        });

        function refresh() {
            if (new Date().getTime() - time >= 60000)
                window.location.reload(true);
            else
                setTimeout(refresh, 20000);
        }

        //setTimeout(refresh, 20000);
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</body>

</html>
@endauth

@guest
<script>
    window.location = "/";
</script>
@endguest

@endsection