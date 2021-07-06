CREATE OR REPLACE FUNCTION substractStockUpdate() RETURNS trigger AS $substractStockUpdate$
    BEGIN

        UPDATE produk
        SET stok = stok + old.jumlah
        WHERE id_produk = old.id_produk;
        
        UPDATE produk
        SET stok = stok - (SELECT jumlah FROM transaksi_detail 
                                WHERE id_transaksi = new.id_transaksi AND id_produk = new.id_produk)
        WHERE id_produk = new.id_produk;
        
        RETURN new;
    END
$substractStockUpdate$ LANGUAGE plpgsql;

CREATE TRIGGER substractStockUpdate AFTER UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION substractStockUpdate();