-- Trigger untuk mengurangi kuota pemakaian diskon
CREATE OR REPLACE FUNCTION count_discount() RETURNS trigger AS $count_discount$
	DECLARE X INT;
    BEGIN
		SELECT kuota-1 INTO X FROM diskon WHERE id_diskon = NEW.id_diskon;
		
		IF X < 0 THEN
			RAISE EXCEPTION '70005 (Pemakaian diskon telah mencapai batas)';
		END IF;
		
		IF X >= 0 THEN
			UPDATE diskon SET kuota = kuota-1 WHERE id_diskon = NEW.id_diskon;
		END IF;
		
		RETURN NEW;
	END;
$count_discount$ LANGUAGE plpgsql;