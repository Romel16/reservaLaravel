@extends('layouts.app')

@section('content')


    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">Editar Usuario</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Usuarios</a></li>
                        <li class="breadcrumb-item active">Editar Registro</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1">Editar Usuario</h4>
                </div>

                <div class="card-body">
                    <form class="row gy-3" method="POST" action="{{ route('usuarios.update', $usuario->id) }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="nombres" class="form-label">{{ __('Nombres') }}</label>
                            <input type="text" class="form-control @error('nombres') is-invalid @enderror"
                                   id="nombres" name="nombres" value="{{ old('nombres', $usuario->nombres) }}" required autofocus>
                            @error('nombres')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="apellidos" class="form-label">{{ __('Apellidos') }}</label>
                            <input type="text" class="form-control @error('apellidos') is-invalid @enderror"
                                   id="apellidos" name="apellidos" value="{{ old('apellidos', $usuario->apellidos) }}" required>
                            @error('apellidos')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="telefono" class="form-label">{{ __('Teléfono') }}</label>
                            <input type="text" class="form-control @error('telefono') is-invalid @enderror"
                                   id="telefono" name="telefono" value="{{ old('telefono', $usuario->telefono) }}" required>
                            @error('telefono')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="role_id" class="form-label">{{ __('Rol') }}</label>
                            <select class="form-select @error('role_id') is-invalid @enderror" id="role_id" name="role_id" required>
                                @foreach ($roles as $role)
                                    <option value="{{ $role->id}}" {{ $usuario->role_id == $role->id ? 'selected' : ''}}>{{ $role->name }}</option>
                                @endforeach
                            </select>
                            @error('role_id')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="email" class="form-label">{{ __('Correo Electrónico') }}</label>
                            <input type="email" class="form-control @error('email') is-invalid @enderror"
                                   id="email" name="email" value="{{ old('email', $usuario->email) }}" required>
                            @error('email')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="password" class="form-label">{{ __('Contraseña') }}</label>
                            <input type="text" class="form-control" id="password" name="password" value="password" readonly>
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3">
                            <label for="foto" class="form-label">{{ __('Foto (Opcional)') }}</label>
                            <input type="file" class="form-control @error('foto') is-invalid @enderror"
                                   id="foto" name="foto">
                            @error('foto')
                                <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>

                        <div class="col-xxl-3 col-md-6 mb-3" >
                            <div>
                                <br>
                                <a href="{{ route('usuarios.index') }}" class="btn btn-danger">{{_('Cancelar')}}</a>

                                <button type="submit" class="btn btn-primary">{{ __('Guardar Cambios') }}</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


@endsection
