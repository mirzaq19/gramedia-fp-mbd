-- Trigger untuk melakukan update timestamp saat ada perubahan data di row
CREATE OR REPLACE FUNCTION updatedTrigger()
RETURNS TRIGGER as $updatedTrigger$
    BEGIN
        NEW.Updated_at = CURRENT_TIMESTAMP;
        RETURN NEW;
    END;
$updatedTrigger$ LANGUAGE plpgsql;

CREATE TRIGGER updTrigAkun BEFORE UPDATE ON akun FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigProduk BEFORE UPDATE ON produk FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigDiskusi BEFORE UPDATE ON diskusi FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigTestimoni BEFORE UPDATE ON testimoni FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigtransaksi BEFORE UPDATE ON transaksi FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigDiskon BEFORE UPDATE ON diskon FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigKategori BEFORE UPDATE ON kategori FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigJenis_Produk BEFORE UPDATE ON jenis_produk FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigLampiran BEFORE UPDATE ON lampiran FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();
CREATE TRIGGER updTrigJasa_Kirim BEFORE UPDATE ON jasa_kirim FOR EACH ROW EXECUTE PROCEDURE updatedTrigger();