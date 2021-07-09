<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;
use App\Models\Kategori;


class JenisProdukSeeder extends Seeder
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

        // Mendapatkan foreign key dari tabel kategori
        echo "Mengambil data foreign key dari tabel kategori".PHP_EOL;
        $kategori_ids = Kategori::all()->pluck('id_kategori')->toArray();

        // Generate Data
        for($i = 1; $i <= 50; $i++) {
            $deptManagerData[] = [
                'id_jenis'          => $i,
                'id_kategori'       => $kategori_ids[array_rand($kategori_ids)],
                'jenis'             => $faker->text(10), // sesuaikan apabila memerlukan random date yang lebih spesifik
                'created_at'        => $faker->dateTimeBetween('now','now'),
                'updated_at'        => $faker->dateTimeBetween('now','now'),
            ];

            echo 'Creating data: '.$i.PHP_EOL;
        }

        // Chunking data
        $chunks = array_chunk($deptManagerData, 10000);

        // Insert data
        foreach($chunks as $chunk) {
            DB::table('jenis_produk')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
