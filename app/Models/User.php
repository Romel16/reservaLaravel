<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

use Illuminate\Database\Eloquent\SoftDeletes;//libreria para eliminar

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;
    use SoftDeletes;//para eliminar

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */

     protected $dates = ['deleted_at'];

     //Campos que se pueden llenar
    protected $fillable = [
        'nombres',
        'apellidos',
        'telefono',
        'foto',
        'email',
        'password',
        'role_id',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    //Relacion uno a muchos
    public function role(){
        return $this->belongsTo(Role::class);

        //return $this->belongsTo(Role::class, 'rol_id'); // Relación con el modelo Role basada en 'rol_id'
    }

    //Relacion muchos a muchos
    public function reservation(){
        return $this->hasMany(Reservation::class);
    }

    public function consultantReservations(){
        return $this->hasMany(Reservation::class, 'consultant_id');
    }
}
