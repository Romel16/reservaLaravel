<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    //crear 1 administrador (rol_id = 1)
    public function run(): void
    {
        User::create([
            'nombres' => 'Admin',
            'apellidos' => 'Admin',
            'telefono' => '123456789',
            'email' => 'admin@example.com',
            'foto' => null,
            'password' => Hash::make('password'),
            'role_id' => 1,
        ]);

        User::factory()->count(3)->create([
            'role_id' => 2,//consultor
        ]);

        User::factory()->count(10)->create([
            'role_id' => 3,//usuario
        ]);
    }
}
