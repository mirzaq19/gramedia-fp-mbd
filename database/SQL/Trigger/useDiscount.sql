-- fungsi untuk cek apakah diskon berlaku dan mengubah harga awal jika
-- diskon berlangsung
CREATE OR REPLACE FUNCTION useDiscount()
	RETURNS trigger as $useDiscount$
	DECLARE x INT;
    BEGIN
		IF NEW.id_diskon IS NULL THEN
			UPDATE transaksi
			SET id_Diskon = (SELECT id_Diskon 
										FROM diskon
										WHERE diskon.created_at <= now()
										AND diskon.masa_berlaku >= now())            
			WHERE id_transaksi = NEW.id_transaksi;
			X:=1;
		END IF;
		
		IF X=1 THEN 
			UPDATE transaksi
			SET jumlah_biaya = jumlah_biaya - jumlah_biaya * (select potongan
															  from diskon
															  where diskon.id_diskon = id_diskon)
			WHERE id_transaksi = NEW.id_transaksi;
		END IF;
		
		RETURN NEW;	
    END;
$useDiscount$ LANGUAGE plpgsql;

CREATE TRIGGER updTrigDiskon AFTER INSERT ON transaksi FOR EACH ROW EXECUTE PROCEDURE useDiscount();
