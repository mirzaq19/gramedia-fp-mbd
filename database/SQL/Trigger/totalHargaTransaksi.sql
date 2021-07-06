CREATE OR REPLACE FUNCTION totalHargaTransaksi() RETURNS trigger AS $totalHargaTransaksi$
    DECLARE
        total_transaksi DECIMAL(10,2);

    BEGIN
        SELECT SUM(subtotal) INTO total_transaksi FROM transaksi_detail 
            WHERE transaksi_detail.id_transaksi = transaksi.id_transaksi;

        transaksi.jumlah_biaya = total_transaksi;
        
        RETURN new;
    END

$totalHargaTransaksi$ LANGUAGE plpgsql;

CREATE TRIGGER totalHargaTransaksi BEFORE INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION totalHargaTransaksi();

