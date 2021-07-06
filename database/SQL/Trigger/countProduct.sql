CREATE OR REPLACE FUNCTION countProduct()
RETURNS TRIGGER AS $countProduct$
    BEGIN
        UPDATE produk
        SET terjual = terjual + NEW.jumlah
        WHERE id_produk = NEW.id_produk;
        RETURN NEW;
    END;
$countProduct$ LANGUAGE plpgsql;

CREATE TRIGGER trigCountProduct AFTER INSERT ON transaksi_detail FOR EACH ROW EXECUTE PROCEDURE countProduct();