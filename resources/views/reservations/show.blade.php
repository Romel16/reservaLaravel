@extends('layouts.app')

@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">Detalle de Reserva</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Reserva</a></li>
                    <li class="breadcrumb-item active">Detalle</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Información de la Reserva</h4>
            </div>
            <div class="card-body">
                <div class="row gy-3">
                    {{-- Usuario --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Usuario</label>
                        <div>{{ $reservation->user->nombres }} {{ $reservation->user->apellidos }}</div>
                    </div>

                    {{-- Consultor --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Consultor</label>
                        <div>{{ $reservation->consultant->nombres }} {{ $reservation->consultant->apellidos }}</div>
                    </div>

                    {{-- Fecha de Reserva --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Fecha de Reserva</label>
                        <div>{{ \Carbon\Carbon::parse($reservation->reservation_date)->format('d/m/Y') }}</div>
                    </div>

                    {{-- Hora de Inicio --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Hora de Inicio</label>
                        <div>{{ $reservation->start_time }}</div>
                    </div>

                    {{-- Hora Fin --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Hora Fin</label>
                        <div>{{ $reservation->end_time }}</div>
                    </div>

                    {{-- Estado de la Reserva --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Estado de la Reserva</label>
                        <div class="text-capitalize">{{ $reservation->reservation_status }}</div>
                    </div>

                    {{-- Total a pagar --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Total a pagar (USD)</label>
                        <div>${{ number_format($reservation->total_amount, 2) }}</div>
                    </div>

                    {{-- Estado del Pago --}}
                    <div class="col-xxl-3 col-md-6">
                        <label class="form-label fw-bold">Estado del Pago</label>
                        <div class="text-capitalize">{{ $reservation->payment_status }}</div>
                    </div>

                    {{-- Eliminado --}}
                    @if($reservation->deleted_at)
                        <div class="col-xxl-3 col-md-6">
                            <label class="form-label fw-bold text-danger">Eliminada</label>
                            <div class="text-danger">{{ $reservation->deleted_at->format('d/m/Y H:i') }}</div>
                        </div>
                    @endif

                    {{-- BOTÓN VOLVER --}}
                    <div class="col-xxl-12 col-md-6 mt-3">
                        <a href="{{ route('reservations.index') }}" class="btn btn-danger">
                            {{ __('Volver') }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
