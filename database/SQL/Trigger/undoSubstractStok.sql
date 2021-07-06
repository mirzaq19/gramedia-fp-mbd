CREATE OR REPLACE FUNCTION undoSubstractStock() RETURNS trigger AS $undoSubstractStock$   
    BEGIN

        UPDATE produk
        SET stok = stok + old.jumlah
        WHERE id_produk = old.id_produk;

        RETURN new;
    END
$undoSubstractStock$ LANGUAGE plpgsql;

CREATE TRIGGER undoSubstractStock AFTER DELETE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION undoSubstractStock();