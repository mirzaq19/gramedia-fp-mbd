CREATE OR REPLACE FUNCTION createdTrigger()
RETURNS TRIGGER as $createdTrigger$
    BEGIN
        NEW.created_at = CURRENT_TIMESTAMP;
        RETURN NEW;
    END;
$createdTrigger$ LANGUAGE plpgsql;

CREATE TRIGGER crtTrigAkun BEFORE UPDATE ON akun FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigProduk BEFORE UPDATE ON produk FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigDiskusi BEFORE UPDATE ON diskusi FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigTestimoni BEFORE UPDATE ON testimoni FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigtransaksi BEFORE UPDATE ON transaksi FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigDiskon BEFORE UPDATE ON diskon FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigKategori BEFORE UPDATE ON kategori FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigJenis_Produk BEFORE UPDATE ON jenis_produk FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigLampiran BEFORE UPDATE ON lampiran FOR EACH ROW EXECUTE PROCEDURE createdTrigger();
CREATE TRIGGER crtTrigJasa_Kirim BEFORE UPDATE ON jasa_kirim FOR EACH ROW EXECUTE PROCEDURE createdTrigger();