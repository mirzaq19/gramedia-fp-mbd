--Complex Query: Mencari total berat pada tiap transaksi
SELECT (SUM(produk.berat*transaksi_detail.jumlah)::DECIMAL/1000)::DECIMAL(10,2) AS "Total Berat"
FROM produk JOIN 
transaksi_detail ON transaksi_detail.id_produk = produk.id_produk
WHERE transaksi_detail.id_transaksi = 1;