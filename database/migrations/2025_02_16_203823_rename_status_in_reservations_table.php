<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            // Renombrar columna ENUM correctamente
            DB::statement("ALTER TABLE `reservations` CHANGE COLUMN `status` `reservation_status` ENUM('pendiente', 'confirmada', 'cancelada') NOT NULL DEFAULT 'pendiente'");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('reservations', function (Blueprint $table) {
            // Restaurar el nombre original de la columna
        DB::statement("ALTER TABLE `reservations` CHANGE COLUMN `reservation_status` `status` ENUM('pendiente', 'confirmada', 'cancelada') NOT NULL DEFAULT 'pendiente'");
        });
    }
};
