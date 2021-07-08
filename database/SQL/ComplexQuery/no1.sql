-- Menampilkan nama, kategori, dan jenis produk

SELECT akun.nama, kategori.kategori, jenis_produk.jenis, transaksi_detail.jumlah FROM akun
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