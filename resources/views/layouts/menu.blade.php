<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <!-- Dark Logo-->
        <a href="index.html" class="logo logo-dark">
            <span class="logo-sm">
                <img src="{{asset('assets/images/logo-sm.png')}}" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="{{asset('assets/images/logo-dark.png')}}" alt="" height="17">
            </span>
        </a>
        <!-- Light Logo-->
        <a href="index.html" class="logo logo-light">
            <span class="logo-sm">
                <img src="{{asset('assets/images/logo-sm.png')}}" alt="" height="22">
            </span>
            <span class="logo-lg">
                <img src="{{asset('assets/images/logo-light.png')}}" alt="" height="17">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">

                @if (Auth::user()->role_id == 3)

                <li class="menu-title"><span>Cliente</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('cliente.reserva')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Nueva Reserva</span>
                    </a>
                </li> <!-- end nav item-->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('cliente.reservas')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Consultar Reserva</span>
                    </a>
                </li> <!-- end nav item-->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('cliente.calendario')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Calendario</span>
                    </a>
                </li> <!-- end nav item-->

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('cliente.pagos')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Ver Pagos</span>
                    </a>
                </li> <!-- end nav item-->

                @endif

                @if (Auth::user()->role_id == 2)



                <li class="menu-title"><span>Asesor</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('asesor.calendario')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Calendario</span>
                    </a>
                </li> <!-- end nav item-->

                @endif


                @if (Auth::user()->role_id == 1)


                <li class="menu-title"><span>Administrador</span></li>
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('reservations.create')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Nueva Reserva</span>
                    </a>
                </li> <!-- end nav item-->

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('reservations.index')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Consultar Reserva</span>
                    </a>
                </li> <!-- end nav item-->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('reservations.calendario')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Calendario</span>
                    </a>
                </li> <!-- end nav item-->

                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{ route('reservations.pagos')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Ver Pagos</span>
                    </a>
                </li> <!-- end nav item-->
                <li class="nav-item">
                    <a class="nav-link menu-link" href="{{route('usuarios.index')}}" >
                        <i class="ri-dashboard-2-line"></i> <span>Mant. Usuario</span>
                    </a>
                </li> <!-- end nav item-->
                @endif

            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>
