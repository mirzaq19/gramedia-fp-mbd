<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class KategoriSeeder extends Seeder
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
            $kategoriData[] = [
                'id_kategori'  => $i,
                'kategori'     => $faker->text(10),
            ];
            echo 'Creating data: ' . $i . PHP_EOL;
        }

        // Membagi array menjadi chunk dengan ukuran 10.000/chunk
        $chunks = array_chunk($kategoriData, 10000);

        // Melakukan insert data ke database per chunk
        foreach ($chunks as $chunk) {
            DB::table('kategori')->insertOrIgnore($chunk); // agar kalau violated integrity bisa skip ke row berikutnya
            echo 'Inserting data...' . PHP_EOL;
        }
    }
}
