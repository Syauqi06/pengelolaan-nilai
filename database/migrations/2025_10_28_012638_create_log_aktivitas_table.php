<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('log_aktivitas', function (Blueprint $table) {
            $table->id('id_log');
            // Relasi dengan tabel pengguna
            $table->foreignId('id_pengguna')
                  ->constrained('penggunas', 'id_pengguna')
                  ->onUpdate('cascade')
                  ->onDelete('restrict');

            $table->string('jenis_aktivitas', 50);
            $table->ipAddress('ip_address')->nullable();
            $table->text('user_agent')->nullable();
            $table->json('data_lama')->nullable();
            $table->json('data_baru')->nullable();
            $table->timestamp('waktu_aktivitas')->useCurrent();
            
            // Indexes untuk optimasi pencarian
            $table->index('id_pengguna');
            $table->index('jenis_aktivitas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('log_aktivitas');
    }
};
