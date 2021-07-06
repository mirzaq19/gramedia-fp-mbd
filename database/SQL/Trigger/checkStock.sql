CREATE OR REPLACE FUNCTION checkStock() RETURNS trigger AS $checkStock$
    DECLARE
        X INT;
        
    BEGIN
        SELECT produk.stok INTO X FROM produk
        WHERE id_produk = new.id_produk;

        IF X - new.jumlah < 0 THEN
            raise using message = 'Maaf, stok barang kami tidak mencukupi';
        END IF;
        
        RETURN NEW;
    END
$checkStock$ LANGUAGE plpgsql;

CREATE TRIGGER checkStock BEFORE INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION checkStock();