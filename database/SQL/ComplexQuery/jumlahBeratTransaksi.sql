SELECT (SUM(produk.berat*transaksi_detail.jumlah)::DECIMAL/1000)::DECIMAL(10,2)*
(SELECT biaya_perkg FROM jasa_kirim WHERE id_jasakirim=1) AS "Biaya Jasa Kirim"
FROM produk JOIN 
transaksi_detail ON transaksi_detail.id_produk = produk.id_produk
WHERE transaksi_detail.id_transaksi = 1;