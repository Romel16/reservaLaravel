@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">Calendario de Reservas</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Asesor</a></li>
                    <li class="breadcrumb-item active">Calendario</li>
                </ol>
            </div>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <h3>Bienvenido, {{ Auth::user()->nombres }} {{ Auth::user()->apellidos }}</h3>
            <h7>Buena suerte</h7>
        </div>
    </div>
</div>
@endsection
