--Trigger untuk menghitung rata-rata rating pada produk
CREATE OR REPLACE FUNCTION update_rating() RETURNS trigger AS $update_rating$
	DECLARE X INT;
    BEGIN
		IF TG_OP = 'DELETE' THEN
			SELECT COUNT(id_testimoni) INTO X FROM testimoni WHERE id_produk = OLD.id_produk;

			IF X = 0 THEN
				UPDATE produk SET rating = 0 WHERE id_produk = OLD.id_produk;
			END IF;

			IF X <> 0 THEN			
				UPDATE produk SET rating = (SELECT AVG(rating) 
											FROM testimoni 
											WHERE id_produk = OLD.id_produk)
				WHERE id_produk = OLD.id_produk;
			END IF;

			RETURN NEW;
		END IF;

		UPDATE produk SET rating = (SELECT AVG(rating) 
									FROM testimoni 
									WHERE id_produk = NEW.id_produk)
		WHERE id_produk = NEW.id_produk;

		RETURN NEW;
	END;
$update_rating$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER update_rating AFTER INSERT OR UPDATE OR DELETE ON testimoni
FOR EACH ROW EXECUTE FUNCTION update_rating();

