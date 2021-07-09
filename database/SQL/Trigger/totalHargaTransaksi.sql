-- Trigger untuk mendapatkan jumlah total biaya yang perlu dibayarkan oleh pengguna
CREATE OR REPLACE FUNCTION totalHargaTransaksi() RETURNS trigger AS $totalHargaTransaksi$
    DECLARE
        total_transaksi DECIMAL(10,2);
		total_berat DECIMAL(10,2);
    BEGIN

        SELECT SUM(subtotal) INTO total_transaksi
        FROM transaksi_detail
        WHERE id_transaksi = NEW.id_transaksi;
        
        SELECT (SUM(produk.berat*transaksi_detail.jumlah)::DECIMAL/1000)::DECIMAL(10,2) INTO total_berat
        FROM produk JOIN 
        transaksi_detail ON transaksi_detail.id_produk = produk.id_produk
        WHERE transaksi_detail.id_transaksi = NEW.id_transaksi;
		
        UPDATE transaksi
        SET jumlah_biaya = total_transaksi + (SELECT biaya_perkg*total_berat FROM jasa_kirim
                                             WHERE id_jasakirim = (SELECT id_jasakirim FROM transaksi WHERE id_transaksi = NEW.id_transaksi))
		WHERE id_transaksi = new.id_transaksi;
        
        RETURN new;
    END

$totalHargaTransaksi$ LANGUAGE plpgsql;

CREATE TRIGGER totalHargaTransaksi AFTER INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION totalHargaTransaksi();