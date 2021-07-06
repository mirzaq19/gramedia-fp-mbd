CREATE OR REPLACE FUNCTION substractStockInsert() RETURNS trigger AS $substractStockInsert$
    BEGIN

        UPDATE produk
        SET stok = stok - (SELECT jumlah FROM transaksi_detail 
                                WHERE id_transaksi = new.id_transaksi AND id_produk = new.id_produk)
        WHERE id_produk = new.id_produk;
        
        RETURN new;
    END
$substractStockInsert$ LANGUAGE plpgsql;

CREATE TRIGGER substractStockInsert AFTER INSERT ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION substractStockInsert();