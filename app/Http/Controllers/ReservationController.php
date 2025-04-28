<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Reservation;
use App\Models\ReservationDetails;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Log;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

use Twilio\Rest\Client;


class ReservationController extends Controller
{
    public function index(){
        $reservations = Reservation::with(['user', 'consultant'])->paginate(10);
        return view('reservations.index', compact('reservations'));
    }
    public function indexcliente(){
        $userId = Auth::user()->id;
        $reservations = Reservation::where('user_id',$userId)->get();
        return view('cliente.index', compact('reservations'));
    }

    public function create(){
        $users = User::where('role_id', 3)->whereNull('deleted_at')->get();
        $consultants = User::where('role_id', 2)->whereNull('deleted_at')->get();

        return view('reservations.create', compact('users', 'consultants'));
    }
    public function createcliente(){
        $consultants = User::where('role_id', 2)->whereNull('deleted_at')->get();

        return view('cliente.reserva', compact('consultants'));
    }

    public function store(Request $request){
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'consultant_id' => 'required|exists:users,id',
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i|after_or_equal:09:00|before_or_equal:16:00',
            'end_time' => 'required|date_format:H:i|before_or_equal:16:00',
            'reservation_status' => 'required|in:pendiente,confirmada,cancelada',
            'payment_status' => 'required|in:pendiente,pagado,fallido',
            'total_amount' => 'required|numeric|min:0',
        ]);

        // Verificación de disponibilidad
        /* dd($request->all()); */
          // Creación de la reserva
        $reservation = Reservation::create([
            'user_id' => $request->user_id,
            'consultant_id' => $request->consultant_id,
            'reservation_date' => $request->reservation_date,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'reservation_status' => $request->reservation_status,
            'payment_status' => $request->payment_status,
            'total_amount' => $request->total_amount,
        ]);

        return redirect()->route('reservations.index')->with('success', 'Reservación creada con éxito.');
    }

    public function edit(string $id){
         // Encontrar la reserva por su ID
         $reservation = Reservation::findOrFail($id);
         $reservation->start_time = Carbon::parse($reservation->start_time)->format('H:i');
         $reservation->end_time = Carbon::parse($reservation->end_time)->format('H:i');

        $users = User::where('role_id', 3)->whereNull('deleted_at')->get();
        $consultants = User::where('role_id', 2)->whereNull('deleted_at')->get();

        return view('reservations.edit', compact('reservation', 'users','consultants'));
    }

    public function update(Request $request,string $id){
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'consultant_id' => 'required|exists:users,id',
            'reservation_date' => 'required|date',
            'start_time' => 'required|date_format:H:i|after_or_equal:09:00|before_or_equal:16:00',
            'end_time' => 'required|date_format:H:i|before_or_equal:16:00',
            'reservation_status' => 'required|in:pendiente,confirmada,cancelada',
            'payment_status' => 'required|in:pendiente,pagado,fallido',
            'total_amount' => 'required|numeric|min:0',
        ]);

        $reservation = Reservation::findOrFail($id);
        $reservation->update($request->all());

        return redirect()->route('reservations.index')->with('success', 'Reservación actualizada con éxito.');
    }

    public function destroy($id){
        $reservation = Reservation::findOrFail($id);
        if ($reservation) {
            $reservation->delete();
            return redirect()->route('reservations.index')->with('success', 'Reservación eliminada correctamente.');
        }
        return redirect()->route('reservations.index')->with('error', 'Reservación no encontrada.');
    }

    public function show($id){
        $reservation = Reservation::findOrFail($id);
        return view('reservations.show', compact('reservation'));
    }

    // Método para cancelar una reserva
    public function cancel(Request $request) {
        // Validación de los datos
        $request->validate([
            'reservation_id' => 'required|exists:reservations,id',
            'cancellation_reason' => 'required|string',
        ]);

        $reservation = Reservation::findOrFail($request->reservation_id);
        $reservation->reservation_status = 'cancelada'; // Cambia el estado a 'cancelada'
        $reservation->cancellation_reason = $request->cancellation_reason;
        $reservation->save();

        return response()->json([
            'success' => true,
            'message' => 'La reserva ha sido cancelada exitosamente',
        ]);
    }

    public function getAllReservations(Request $request){
        $reservations = Reservation::where('reservation_status', '!=', 'cancelada')->get();
        $events = [];

        foreach ($reservations as $reservation) {
            $color = '#28a745';
            $bordercolor = '#28a745';

            if($reservation->reservation_status === 'pendiente'){
                $color = '#ffc107';
                $bordercolor = '#ffc107';
            }elseif($reservation->reservation_status === 'cancelada'){
                $color = '#dc3545';
                $bordercolor = '#dc3545';
            }
            $events[] = [
                'title' => 'Reserva de '. $reservation->user->nombres .' '. $reservation->user->apellidos .' con ' . $reservation->consultant->nombres .' '. $reservation->consultant->apellidos,
                'start' => $reservation->reservation_date.'T'.$reservation->start_time,
                'end' => $reservation->reservation_date.'T'.$reservation->end_time,
                'backgroundColor' => $color,
                'borderColor' => $bordercolor,
            ];
        }

        return response()->json($events);
    }

    public function getAllReservationsLanding(){
        $reservations = Reservation::all();
        $events = [];
        foreach($reservations as $reservation){
            $color = '#28a745';
            $bordercolor = '#28a745';

            if($reservation->reservation_status === 'pendiente'){
                $color = '#ffc107';
                $bordercolor = '#ffc107';
            }elseif($reservation->reservation_status === 'cancelada'){
                $color = '#dc3545';
                $bordercolor = '#dc3545';
            }

            $events[] = [
                'title' => $reservation->consultant->nombres .' '. $reservation->consultant->apellidos,
                'start' => $reservation->reservation_date.'T'.$reservation->start_time,
                'end' => $reservation->reservation_date.'T'.$reservation->end_time,
                'backgroundColor' => $color,
                'borderColor' => $bordercolor,
            ];
        }

        return response()->json($events);
    }

    public function getReservationsAsesor(){

        $consultantId = Auth::user()->id;

        $reservations = Reservation::where('consultant_id',$consultantId)->get();

        $events = [];
        foreach($reservations as $reservation){
            $color = '#28a745';
            $bordercolor = '#28a745';

            if($reservation->reservation_status === 'pendiente'){
                $color = '#ffc107';
                $bordercolor = '#ffc107';
            }elseif($reservation->reservation_status === 'cancelada'){
                $color = '#dc3545';
                $bordercolor = '#dc3545';
            }

            $events[] = [
                'title' => 'Reserva con '. $reservation->user->nombres .' '. $reservation->user->apellidos,
                'start' => $reservation->reservation_date.'T'.$reservation->start_time,
                'end' => $reservation->reservation_date.'T'.$reservation->end_time,
                'backgroundColor' => $color,
                'borderColor' => $bordercolor,
            ];
        }

        return response()->json($events);
    }
    public function getReservationsCliente(){

        $userId = Auth::user()->id;

        $reservations = Reservation::where('user_id',$userId)->get();

        $events = [];
        foreach($reservations as $reservation){
            $color = '#28a745';
            $bordercolor = '#28a745';

            if($reservation->reservation_status === 'pendiente'){
                $color = '#ffc107';
                $bordercolor = '#ffc107';
            }elseif($reservation->reservation_status === 'cancelada'){
                $color = '#dc3545';
                $bordercolor = '#dc3545';
            }

            $events[] = [
                'title' => 'Reserva con '. $reservation->consultant->nombres .' '. $reservation->consultant->apellidos,
                'start' => $reservation->reservation_date.'T'.$reservation->start_time,
                'end' => $reservation->reservation_date.'T'.$reservation->end_time,
                'backgroundColor' => $color,
                'borderColor' => $bordercolor,
            ];
        }

        return response()->json($events);
    }

    public function completePayment(Request $request){

        // Validación de los datos
        $request->validate([
            'orderID'=> 'required',
            'details'=> 'required',
            'user_id'=> 'required|exists:users,id',
            'consultant_id'=> 'required|exists:users,id',
            'reservation_date'=> 'required|date',
            'start_time'=> 'required|date_format:H:i|after_or_equal:09:00|before_or_equal:15:00',
            'end_time'=> 'required|date_format:H:i|before_or_equal:15:00',
            'total_amount'=> 'required|numeric|min:0'
        ]);

        $details = $request->details;
        $payment_status = $details['status'];

        if ($payment_status === 'COMPLETED') {
            $reservation = Reservation::create([
                'user_id' => $request->user_id,
                'consultant_id' => $request->consultant_id,
                'reservation_date' => $request->reservation_date,
                'start_time' => $request->start_time,
                'end_time' => $request->end_time,
                'reservation_status' => 'confirmada',
                'payment_status' => 'pagado',
                'total_amount' => $request->total_amount,
            ]);

            $transaction_id = $details['id'] ?? null;
            $payer_id = $details['payer']['payer_id'] ?? null;
            $payer_email = $details['payer']['email_address'] ?? null;
            $amount = $details['purchase_units'][0]['amount']['value'] ?? null;

            ReservationDetails::create([
                'reservation_id' => $reservation->id,
                'transaction_id' => $transaction_id,
                'payer_id' => $payer_id,
                'payer_email' => $payer_email,
                'payment_status' => $payment_status,
                'amount' => $amount,
                'response_json'=> json_encode($details),
            ]);

            /* $this->sendConfirmationEmail($reservation); */

            $user = User::find($request->user_id);
            $userPhone = $user->telefono;
            if ($userPhone) {
                $this->sendWhastsAppMessage($userPhone, $this->generateWhatsAppMessage($reservation, $user));
            }

            return response()->json(['success' => true]);
        }else{
            return response()->json(['error' => 'El pago no fue completado.'], 400);
        }

    }

    public function sendConfirmationEmail($reservation){
        $user = User::find($reservation->user_id);
        $consultant = User::find($reservation->consultant_id);

        $mail = new PHPMailer(true);

        try {
            //Server settings
            $mail->SMTPDebug = 0;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'YVf3y@example.com';                     //SMTP username
            $mail->Password   = 'pail123';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('YVf3y@example.com', 'Reservas');
            $mail->addAddress($user->email);     //Add a recipient
            $mail->CharSet = 'UTF-8'; //Set email format to UTF-8
            $mail->Subject = 'Confirmación de reserva - SisReserva';

            $html = View::make('emails.confirmation', [
                'userName' => $user->nombres . ' ' . $user->apellidos,
                'consultantName' => $consultant->nombres . ' ' . $consultant->apellidos,
                'reservationDate' => $reservation->reservation_date,
                'startTime' => $reservation->start_time,
                'endTime' => $reservation->end_time,
                'totalAmount' => $reservation->total_amount,
                'reservationStatus' => $reservation->reservation_status,
                'paymentStatus' => $reservation->payment_status,
                'cancellationReason' => $reservation->cancellation_reason,
            ])->render();

            $mail->send();
        } catch (Exception $e) {
            Log::error('Error al enviar el correo: ' . $mail->ErrorInfo);
            return response()->json(['error' => 'Error al enviar el correo: ' . $mail->ErrorInfo], 500);
        }
        // Guardar la información del correo en la base de datos
        $reservation->email_sent = true;
        $reservation->save();
        // Retornar una respuesta JSON
        return response()->json(['success' => true]);
    }

    // Método para generar el mensaje de confirmación de WhatsApp
    protected function generateWhatsAppMessage($reservation, $user){
        return "Hola {$user->nombres}"." "."{$user->apellidos}, tu reserva ha sido confirmada.\n".
        "Fecha: {$reservation->reservation_date}\n".
        "Hora de Inicio: {$reservation->start_time}\n".
        "Hora de Fin: {$reservation->end_time}\n".
        "Costo Total: {$reservation->total_amount}\n".
        "Gracias por elegir nuestros servicios.\n".
        "¡Que tengas un excelente día!\n";
    }

    // Método para enviar un mensaje de WhatsApp
    protected function sendWhastsAppMessage($to,$message){
        $sid = env('TWILIO_SID');
        $token = env('TWILIO_AUTH_TOKEN');
        $twilio = new Client($sid,$token);

        $twilio->messages->create(
            "whatsapp:+{$to}",
            [
                'from' => env('TWILIO_WHATSAPP_FROM'),
                'body' => $message
            ]
        );
    }

    public function showPayments(){
        $payments = ReservationDetails::with(['reservation.user', 'reservation.consultant'])->get();
        return view('reservations.pagos', compact('payments'));
    }
    public function showPaymentsAsesor(){
        $consultantId = Auth::user()->id;
        $reservations = Reservation::with(['user', 'consultant'])->where('consultant_id', $consultantId)->where('payment_status', 'pagado')->get();
        return view('asesor.payments', compact('reservations'));
    }
    public function showPaymentsCliente(){
        $userId = Auth::id();

        $payments = ReservationDetails::whereHas('reservation', function($query) use ($userId){
            $query->where('user_id', $userId);
        })->get();
        return view('cliente.pagos', compact('payments'));
    }
    public function showPaymentDetailsCliente($id){
        $reservation = Reservation::with(['user', 'consultant'])->findOrFail($id);
        return view('cliente.payment_details', compact('reservation'));
    }

}
