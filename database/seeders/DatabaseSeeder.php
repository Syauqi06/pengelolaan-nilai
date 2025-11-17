<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Memanggil seeder lainnya
        $this->call([
            RoleSeeder::class,
            PenggunaSeeder::class,
            JenisNilaiSeeder::class,
        ]);

        if (file_exists(database_path('trigger.sql'))) { // Cek apakah file trigger.sql ada
            DB::unprepared(file_get_contents(database_path('trigger.sql'))); // Jalankan isi file SQL
    }
    }
}
