    @extends('layouts.guest')

    @section('content')
    <!-- auth page content -->
    <div class="auth-page-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center mt-sm-5 mb-4 text-white-50">
                        <div>
                            {{-- Imagen del Logo --}}
                            <a href="index.html" class="d-inline-block auth-logo">
                                <img src="assets/images/logo-light.png" alt="" height="20">
                            </a>
                        </div>
                        <p class="mt-3 fs-15 fw-medium">Sistemas de Reservas</p>
                    </div>
                </div>
            </div>
            <!-- end row -->

            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card mt-4">

                        <div class="card-body p-4">
                            <div class="text-center mt-2">
                                <h5 class="text-primary">Bienvenido</h5>
                                <p class="text-muted">Inicia sesion en el sistema de Reserva.</p>
                            </div>
                            <div class="p-2 mt-4">
                                <form method="POST" action="{{route('login')}}">
                                    @csrf
                                    <div class="mb-3">
                                        <label for="email" class="form-label">{{ __('Correo Electronico')}}</label>
                                        <input type="email" class="form-control" id="email" placeholder="Ingrese correo Electronico" name="email" class="form-control pe-5 @error('email') is-invalid @enderror" required autofocus>
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="mb-3">
                                        {{-- <div class="float-end">
                                            <a href="auth-pass-reset-basic.html" class="text-muted">Forgot password?</a>
                                        </div> --}}
                                        <label class="form-label" for="password">{{ __('Contraseña')}}</label>
                                        <div class="position-relative auth-pass-inputgroup mb-3">
                                            <input type="password" class="form-control pe-5" placeholder="Ingrese la contraseña" id="password" name="password" class="form-control pe-5 @error('password') is-invalid @enderror" required autofocus>
                                            @error('password')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                            <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted" type="button" id="togglePassword"><i class="ri-eye-fill align-middle"></i></button>
                                        </div>
                                    </div>
                                    
                                    <div class="mt-4">
                                        <button class="btn btn-success w-100" type="submit">{{ __('Inciar Sesion') }}</button>
                                    </div>


                                </form>
                            </div>
                        </div>
                        <!-- end card body -->
                    </div>
                    <!-- end card -->

                    <div class="mt-4 text-center">
                        <p class="mb-0">¿No tienes una cuenta? <a href="{{route('register')}}" class="fw-semibold text-primary text-decoration-underline"> Registrate </a> </p>
                    </div>

                </div>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>

@push(('scripts'))
    <script>
        document.getElementById('togglePassword').addEventListener('click', function() {
            let password = document.getElementById('password');
            if (password.getAttribute('type') == 'password') {
                password.setAttribute('type', 'text');
            } else {
                password.setAttribute('type', 'password');
            }
        });
    </script>

@endpush

@endsection


