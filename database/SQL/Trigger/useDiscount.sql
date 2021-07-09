-- fungsi untuk cek apakah diskon berlaku dan mengubah harga awal jika
-- diskon berlangsung sekaligus cek apakah melebih kuota diskon
CREATE OR REPLACE FUNCTION useDiscount()
	RETURNS trigger as $useDiscount$
	DECLARE X INT;
    BEGIN
		IF NEW.id_diskon IS NULL THEN
			NEW.id_diskon = (SELECT id_Diskon 
							 FROM diskon
							 WHERE diskon.created_at <= now()
 							 AND diskon.masa_berlaku >= now() ORDER BY potongan DESC LIMIT 1);
			
			IF NEW.id_diskon IS NULL THEN
				RETURN NEW;	

			ELSIF NEW.id_diskon IS NOT NULL THEN
				SELECT kuota-1 INTO X FROM diskon WHERE id_diskon = NEW.id_diskon;
				IF X < 0 THEN
					RAISE NOTICE '(Pemakaian diskon telah mencapai batas)';
					NEW.id_diskon = NULL;
					RETURN NEW;
				
				ELSIF X >= 0 THEN
					UPDATE diskon SET kuota = x WHERE id_diskon = NEW.id_diskon;
				
				NEW.jumlah_biaya = new.jumlah_biaya - new.jumlah_biaya * (SELECT potongan
																		  FROM diskon
																		  WHERE diskon.id_diskon = id_diskon);
				END IF;		
			END IF;
		
		ELSIF NEW.id_diskon IS NOT NULL THEN
			IF NOW() >= (SELECT created_at FROM diskon WHERE id_diskon = NEW.id_diskon) AND NOW() <= (SELECT masa_berlaku FROM diskon WHERE id_diskon = NEW.id_diskon) THEN
				SELECT kuota-1 INTO X FROM diskon WHERE id_diskon = NEW.id_diskon;
				IF X < 0 THEN
					RAISE NOTICE '(Pemakaian diskon telah mencapai batas)';
					NEW.id_diskon = NULL;
					RETURN NEW;
				
				ELSIF X >= 0 THEN
					UPDATE diskon SET kuota = x WHERE id_diskon = NEW.id_diskon;
				
				
				NEW.jumlah_biaya = new.jumlah_biaya - new.jumlah_biaya * (SELECT potongan
																		  FROM diskon
																		  WHERE diskon.id_diskon = id_diskon);
				END IF;

			ELSE
				RAISE NOTICE '(Diskon yang digunakan INVALID)';
				NEW.id_diskon = NULL;
				RETURN NEW;
			END IF;
		END IF;
		RETURN NEW;	
    END;
$useDiscount$ LANGUAGE plpgsql;

CREATE TRIGGER updTrigUseDiskon BEFORE INSERT ON transaksi
FOR EACH ROW EXECUTE PROCEDURE useDiscount();