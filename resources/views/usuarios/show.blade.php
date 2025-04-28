@extends('layouts.app')

@section('content')

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">Detalle Usuario</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{ route('usuarios.index') }}">Usuarios</a></li>
                    <li class="breadcrumb-item active">Ver Usuario</li>
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
                <h4 class="card-title mb-0 flex-grow-1">Detalles del Usuario</h4>
            </div>

            <div class="card-body">
                <div class="row gy-3">
                    {{-- Nombres --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Nombres</label>
                        <div>{{ $usuario->nombres }}</div>
                    </div>

                    {{-- Apellidos --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Apellidos</label>
                        <div>{{ $usuario->apellidos }}</div>
                    </div>

                    {{-- Teléfono --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Teléfono</label>
                        <div>{{ $usuario->telefono }}</div>
                    </div>

                    {{-- Rol --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Rol</label>
                        <div>{{ $usuario->role->name }}</div>
                    </div>

                    {{-- Correo Electrónico --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Correo Electrónico</label>
                        <div>{{ $usuario->email }}</div>
                    </div>

                    {{-- Contraseña (oculta) --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Contraseña</label>
                        <div>********</div>
                    </div>

                    {{-- Foto --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Foto</label>
                        @if($usuario->foto)
                            <div>
                                <img src="{{ asset('storage/fotos' . $usuario->foto) }}" alt="Foto del Usuario" class="img-thumbnail" style="max-width: 300px;">
                            </div>
                        @else
                            <div class="text-muted">No hay foto disponible</div>
                        @endif
                    </div>

                    {{-- Botón Volver --}}
                    <div class="col-xxl-12 mt-4">
                        <a href="{{ route('usuarios.index') }}" class="btn btn-danger">
                            {{ __('Volver') }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
