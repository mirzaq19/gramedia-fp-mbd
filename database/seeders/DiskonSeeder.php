<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class DiskonSeeder extends Seeder
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
        for ($i = 1; $i <= 1000; $i++) {
            $diskonData[] = [
                'id_diskon'      => $i,
                'diskon'         => $faker->text(10),
                'kuota'          => $faker->numberBetween(0,100),
                'potongan'       => $faker->randomFloat(2,0,1),
                'masa_berlaku'   => $faker->dateTimeBetween('+2 days','+21 days'),
            ];
            echo 'Creating data: ' . $i . PHP_EOL;
        }

        // Membagi array menjadi chunk dengan ukuran 10.000/chunk
        $chunks = array_chunk($diskonData, 10000);

        // Melakukan insert data ke database per chunk
        foreach ($chunks as $chunk) {
            DB::table('diskon')->insertOrIgnore($chunk); // agar kalau violated integrity bisa skip ke row berikutnya
            echo 'Inserting data...' . PHP_EOL;
        }
    }
}
