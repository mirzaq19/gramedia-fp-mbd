-- Menampilkan nama, kategori, jenis produk, nama produk, dan jumlah produk

SELECT akun.nama AS nama_akun, kategori.kategori AS kategori_produk, jenis_produk.jenis AS jenis_produk, produk.nama AS nama_produk, transaksi_detail.jumlah FROM akun
    INNER JOIN transaksi 
        ON transaksi.id_akun = akun.id_akun
    INNER JOIN transaksi_detail
        ON transaksi_detail.id_transaksi = transaksi.id_transaksi
    INNER JOIN produk 
        ON produk.id_produk = transaksi_detail.id_produk
    INNER JOIN kategori 
        ON kategori.id_kategori = produk.id_kategori
    INNER JOIN jenis_produk
        ON jenis_produk.id_kategori = kategori.id_kategori;


SELECT akun.nama AS nama_akun, kategori.kategori AS kategori_produk, jenis_produk.jenis AS jenis_produk FROM 