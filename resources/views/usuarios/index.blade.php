@extends('layouts.app')

@section('content')

    <!-- start page title -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                <h4 class="mb-sm-0">Mantenimiento de Usuarios</h4>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Usuarios</a></li>
                        <li class="breadcrumb-item active">Mantenimiento</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Listado de Usuarios</h5>
                </div>
                <div class="card-body">
                    <a href="{{route('usuarios.create')}}" class="btn btn-primary waves-effect waves-light ">Nuevo Registro</a>
                    <br> <br>
                    <table id="usuariosTable" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                        <thead>
                            <tr>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Correo Electronico</th>
                                <th>Telefono</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($usuarios as $usuario )
                                <tr>
                                    <td>{{$usuario->nombres}}</td>
                                    <td>{{$usuario->apellidos}}</td>
                                    <td>{{$usuario->email}}</td>
                                    <td>{{$usuario->telefono}}</td>
                                    <td>{{$usuario->role->name}}</td>
                                    <td>
                                        <a href="{{route('usuarios.edit', $usuario->id)}}" class="btn btn-warning btn-sm"><i class="ri-edit-line">Editar</i></a>

                                        <a href="{{route('usuarios.show', $usuario->id)}}" class="btn btn-info btn-sm"><i class="ri-eye-line"> Ver</i></a>

                                        <button type="button" class="btn btn-danger btn-sm" onclick="confirmarEliminacion( {{$usuario->id}})"><i class="ri-delete-bin-line">Eliminar</i></button>

                                        <form id="delete-form-{{$usuario->id}}" action="{{ route('usuarios.destroy',$usuario->id)}}" method="POST" style="display: none;">
                                            @csrf
                                            @method('DELETE')

                                        </form>
                                    </td>
                                </tr>

                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  <!-- end col -->
    </div>  <!-- end row -->


@endsection

@push('scripts')

    <script>
        $(document).ready(function() {
            $('#usuariosTable').DataTable();
        });
    </script>

@if(session('success'))
    <script>
        Swal.fire({
            position: "top-end",
            icon: 'success',
            title: 'Éxito',
            text: "{{ session('success') }}",
            showConfirmButton: false,
            timer: 2000
        });
    </script>
@endif


<script>
    function confirmarEliminacion(usuarioId){
        Swal.fire({
            title: "¿Estas seguro?",
            text: "No podra revertir esta accion",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Si, Eliminar!",
            cancelButtonText: "Cancelar"
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + usuarioId).submit();
            }
        });
    }
</script>

@endpush
