<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class JasaKirimSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ini_set('memory_limit', '-1');

        // Inisialisasi Faker
        $faker = Faker::create();

        // Membuat data dan disimpan ke dalam array
        for ($i = 1; $i <= 50; $i++) {
            $jasaKirimData[] = [
                'id_jasakirim'      => $i,
                'jasakirim'         => $faker->company(),
                'biaya_perkg'        => 15000,
            ];
            echo 'Creating data: ' . $i . PHP_EOL;
        }

        $chunks = array_chunk($jasaKirimData, 50);

        foreach ($chunks as $chunk) {
            DB::table('jasa_kirim')->insertOrIgnore($chunk); // agar kalau violated integrity bisa skip ke row berikutnya
            echo 'Inserting data...' . PHP_EOL;
        }
    }
}
