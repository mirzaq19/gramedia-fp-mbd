CREATE OR REPLACE FUNCTION jumlahSubtotal() RETURNS trigger AS $jumlahSubtotal$
    DECLARE
        harga_produk DECIMAL(10,2);


    BEGIN
        SELECT produk.harga INTO harga_produk FROM produk WHERE produk.id_produk = new.id_produk;

        new.subtotal = new.jumlah * harga_produk;
        
        RETURN new;
    END

$jumlahSubtotal$ LANGUAGE plpgsql;

CREATE TRIGGER jumlahSubtotal BEFORE INSERT OR UPDATE ON transaksi_detail
FOR EACH ROW EXECUTE FUNCTION jumlahSubtotal();

-- 
