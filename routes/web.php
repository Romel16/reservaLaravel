<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\UserControlller;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::resource('usuarios', UserControlller::class);

Route::get('/reservations/pagos', [ReservationController::class, 'showPayments'])->name('reservations.pagos');

Route::get('/reservations/calendario', function () {
    return view('reservations.calendario');
})->name('reservations.calendario');

Route::get('administrador/fullcalendar',[ReservationController::class, 'getAllReservations'])->name('administrador.fullcalendar');

Route::resource('reservations', ReservationController::class);
Route::post('reservations.cancel', [ReservationController::class, 'cancel'])->name('reservations.cancel');
//ASESOR
Route::get('/asesor/calendario', function () {
    return view('asesor.calendario');
})->name('asesor.calendario');
Route::get('asesor/fullcalendar',[ReservationController::class, 'getReservationsAsesor'])->name('asesor.fullcalendar');

//CLIENTE
Route::get('/cliente/calendario', function () {
    return view('cliente.calendario');
})->name('cliente.calendario');
Route::get('cliente/fullcalendar',[ReservationController::class, 'getReservationsCliente'])->name('cliente.fullcalendar');
Route::get('cliente/pagos',[ReservationController::class, 'showPaymentsCliente'])->name('cliente.pagos');

Route::get('/cliente/reservas', [ReservationController::class,'indexcliente'])->name('cliente.reservas');
Route::get('/cliente/reserva', [ReservationController::class,'createcliente'])->name('cliente.reserva');

Route::post('/paypal',[ReservationController::class,'completePayment']);

Route::get('welcome/fullcalendar',[ReservationController::class, 'getAllReservationsLanding'])->name('welcome.fullcalendar');



require __DIR__.'/auth.php';
