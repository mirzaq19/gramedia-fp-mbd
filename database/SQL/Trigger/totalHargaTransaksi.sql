CREATE OR REPLACE FUNCTION totalHargaTransaksi() RETURNS trigger AS $totalHargaTransaksi$
    DECLARE
        total_transaksi DECIMAL(10,2);
		total_berat DECIMAL(10,2);

    BEGIN
        SELECT SUM(subtotal) INTO total_transaksi FROM transaksi_detail 
            WHERE id_transaksi = new.id_transaksi;

        SELECT SUM(produk.berat)*SUM(transaksi_detail.jumlah) INTO total_berat FROM transaksi_detail
            INNER JOIN produk
            ON produk.id_produk = new.produk AND transaksi_detail.id_transaksi = new.id_transaksi;
		
		UPDATE transaksi
        SET jumlah_biaya = total_transaksi + ((SELECT biaya_perkg FROM jasa_kirim
                                                WHERE id_jasakirim = (SELECT id_jasakirim FROM transaksi
																	 	WHERE id_transaksi = new.id_transaksi)) * (total_berat/2000))
		WHERE id_transaksi = new.id_transaksi;
        
        RETURN new;
    END

$totalHargaTransaksi$ LANGUAGE plpgsql;

CREATE TRIGGER totalHargaTransaksi AFTER INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION totalHargaTransaksi();