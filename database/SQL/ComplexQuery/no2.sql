SELECT nama, SUM(transaksi.jumlah_biaya) AS "Jumlah Pembelian" 
FROM akun 
JOIN transaksi ON transaksi.id_akun = akun.id_akun
GROUP BY akun.nama
ORDER BY SUM(transaksi.jumlah_biaya) DESC;
