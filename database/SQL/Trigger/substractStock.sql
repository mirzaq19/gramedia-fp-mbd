CREATE OR REPLACE FUNCTION substractStock() RETURNS trigger AS $substractStock$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            UPDATE produk
            SET stok = stok - (SELECT jumlah FROM transaksi_detail 
                                    WHERE id_transaksi = new.id_transaksi AND id_produk = new.id_produk)
            WHERE id_produk = new.id_produk;
        
        ELSIF (TG_OP = 'UPDATE') THEN
            UPDATE produk
            SET stok = stok + old.jumlah
            WHERE id_produk = old.id_produk;
            
            UPDATE produk
            SET stok = stok - (SELECT jumlah FROM transaksi_detail 
                                    WHERE id_transaksi = new.id_transaksi AND id_produk = new.id_produk)
            WHERE id_produk = new.id_produk;

        ELSIF (TG_OP = 'DELETE') THEN
            UPDATE produk
            SET stok = stok + old.jumlah
            WHERE id_produk = old.id_produk;
        
        END IF;
        
        RETURN new;
    END
$substractStock$ LANGUAGE plpgsql;

CREATE TRIGGER substractStock AFTER INSERT OR UPDATE OR DELETE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION substractStock();