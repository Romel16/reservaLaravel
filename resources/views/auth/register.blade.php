@extends('layouts.guest')

@section('content')

    <div class="auth-page-wrapper pt-5">
        <!-- auth page bg -->
        <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
            <div class="bg-overlay"></div>

            <div class="shape">
                <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                </svg>
            </div>
        </div>

        <!-- auth page content -->
        <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center mt-sm-5 mb-4 text-white-50">
                            <div>
                                <a href="index.html" class="d-inline-block auth-logo">
                                    <img src="assets/images/logo-light.png" alt="" height="20">
                                </a>
                            </div>
                            <p class="mt-3 fs-15 fw-medium">Sistema de Reservas</p>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Crea una cuenta</h5>
                                    <p class="text-muted">Puedes crear tu cuenta gratis</p>
                                </div>
                                <div class="p-2 mt-4">
                                    <form class="needs-validation" method="POST" action="{{route('register')}}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="mb-3">
                                            <label for="nombres" class="form-label">{{ __('Nombres')}} <span class="text-danger">*</span></label>
                                            <input type="text" id="nombres" placeholder="Ingrese Nombre" value="{{old('nombres')}}" name="nombres" class="form-control pe-5 @error('nombres') is-invalid @enderror" required autofocus>
                                            @error('nombres')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                        <div class="mb-3">
                                            <label for="apellidos" class="form-label">{{ __('Apellidos')}} <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="apellidos" placeholder="Ingrese Apellido" value="{{old('apellidos')}}" name="apellidos" class="form-control pe-5 @error('apellidos') is-invalid @enderror" required >
                                            @error('apellidos')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                        <div class="mb-3">
                                            <label for="telefono" class="form-label">{{ __('Telefono')}} <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="telefono" placeholder="Ingrese Telefono" value="{{old('telefono')}}" name="telefono" class="form-control pe-5 @error('telefono') is-invalid @enderror" required >
                                            @error('telefono')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">{{ __('Correo Electronico')}} <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="email" placeholder="Ingrese correo Electronico" value="{{old('email')}}" name="email" class="form-control pe-5 @error('email') is-invalid @enderror" required >
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                        <div class="mb-3">
                                            <label for="foto" class="form-label">{{ __('Foto (Opcional)')}} </label>
                                            <input type="file" class="form-control" id="foto" name="foto" value="{{old('foto')}}" class="form-control pe-5 @error('foto') is-invalid @enderror"  >
                                            @error('foto')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>

                                        {{-- CONTRASEÑA --}}
                                        <div class="mb-3">
                                            <label class="form-label" for="password">{{ __('Contraseña')}}<span class="text-danger">*</span></label>
                                                <input type="password" class="form-control pe-5" placeholder="Ingrese la contraseña" id="password" name="password" class="form-control pe-5 @error('password') is-invalid @enderror" required autofocus>
                                                @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label" for="password-confirm">{{ __('Confirmar Contraseña')}}<span class="text-danger">*</span></label>
                                                <input type="password" class="form-control pe-5" placeholder="Confirmar la contraseña" id="password-confirm" name="password_confirmation" class="form-control pe-5 @error('password') is-invalid @enderror" required autofocus>

                                        </div>

                                        <div class="mb-4">
                                            <p class="mb-0 fs-12 text-muted fst-italic">Al registrar acepto <a href="#" class="text-primary text-decoration-underline fst-normal fw-medium">Terminos de uso</a></p>
                                        </div>

                                        <div class="mt-4">
                                            <button class="btn btn-success w-100" type="submit">Registrate</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->
                        <div class="mt-3 text-center">
                            <p class="mb-0">¿Ya tiene una cuenta? <a href="{{route('login')}}" class="fw-semibold text-primary text-decoration-underline"> Inicia sesion </a> </p>
                        </div>

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end auth page content -->


    </div>
    <!-- end auth-page-wrapper -->

@endsection

