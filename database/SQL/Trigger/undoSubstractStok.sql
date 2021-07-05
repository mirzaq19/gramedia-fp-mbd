CREATE OR REPLACE FUNCTION undoSubstractStock() RETURNS trigger AS $undoSubstractStock$
    DECLARE
        X INT;
        
    BEGIN
        SELECT COUNT(*) INTO X FROM transaksi_detail
        WHERE id_produk = old.id_produk;

        IF X > 0 THEN
            UPDATE produk
            SET stok = stok + (SELECT SUM(jumlah) FROM transaksi_detail WHERE id_produk = old.id_produk)
            WHERE id_produk = old.id_produk;
        END IF;

        IF X = 0 THEN
            UPDATE produk
            SET stok = stok + old.jumlah
            WHERE id_produk = old.id_produk;
        END IF;
        
        RETURN new;
    END
$undoSubstractStock$ LANGUAGE plpgsql;

CREATE TRIGGER undoSubstractStock AFTER DELETE ON transaksi
FOR EACH ROW EXECUTE FUNCTION undoSubstractStock();