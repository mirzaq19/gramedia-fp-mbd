CREATE OR REPLACE FUNCTION substractStock() RETURNS trigger AS $substractStock$
    DECLARE
        X INT;
        
    BEGIN
        SELECT COUNT(*) INTO X FROM transaksi_detail
        WHERE id_produk = new.id_produk;

        IF X > 0 THEN
            UPDATE produk
            SET stok = stok - (SELECT SUM(jumlah) FROM transaksi_detail WHERE id_produk = new.id_produk)
            WHERE id_produk = new.id_produk;
        END IF;
        
        RETURN new;
    END
$substractStock$ LANGUAGE plpgsql;

CREATE TRIGGER substractStock AFTER INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION substractStock();