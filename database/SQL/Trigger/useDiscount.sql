-- fungsi untuk cek apakah diskon berlaku dan mengubah harga awal jika
-- diskon berlangsung
CREATE OR REPLACE FUNCTION useDiscount()
	RETURNS trigger as $useDiscount$
	DECLARE x INT;
    BEGIN
		IF NEW.id_diskon IS NULL THEN
			NEW.id_diskon = (SELECT id_Diskon 
							 FROM diskon
							 WHERE diskon.created_at <= now()
 							 AND diskon.masa_berlaku >= now());
			X:=1;
		END IF;
		
		IF X=1 THEN 
		NEW.jumlah_biaya = new.jumlah_biaya - new.jumlah_biaya * (select potongan
															  from diskon
															  where diskon.id_diskon = id_diskon);
		END IF;
		RETURN NEW;	
    END;
$useDiscount$ LANGUAGE plpgsql;

CREATE TRIGGER updTrigUseDiskon BEFORE INSERT ON transaksi FOR EACH ROW EXECUTE PROCEDURE useDiscount();
