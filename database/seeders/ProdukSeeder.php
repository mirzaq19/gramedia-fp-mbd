<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;
use App\Models\JenisProduk;
use App\Models\Kategori;

class ProdukSeeder extends Seeder
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

       // Generate Data
       for($i = 1; $i <= 1000; $i++) {
           $rand_jenis = JenisProduk::all()->random(1)[0];
           $produk_data[] = [
               'id_produk'         => $i, 
               'id_kategori'       => $rand_jenis['id_kategori'],
               'id_jenis'          => $rand_jenis['id_jenis'],
               'nama'              => $faker->text(20),
               'berat'             => $faker->randomElement([400, 500, 600, 700, 900, 1000]),
               'terjual'           => 0,
               'harga'             => $faker->numberBetween(50000,100000),
               'rating'            => 0,
               'stok'              => $faker->numberBetween(20,1000),
               'created_at'        => $faker->dateTimeBetween('now','now'),
               'updated_at'        => $faker->dateTimeBetween('now','now'),
           ];

           echo 'Creating data: '.$i.PHP_EOL;
       }

       // Chunking data
       $chunks = array_chunk($produk_data, 10000);

       // Insert data
       foreach($chunks as $chunk) {
           DB::table('produk')->insertOrIgnore($chunk);
           echo 'Inserting data...'.PHP_EOL;
       }
   }
}
