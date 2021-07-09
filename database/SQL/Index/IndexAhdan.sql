CREATE INDEX idx_akun_alamat
    ON public.akun USING btree
    (alamat COLLATE pg_catalog."default" text_pattern_ops ASC NULLS LAST)
    TABLESPACE pg_default;

EXPLAIN ANALYZE SELECT * FROM akun where alamat like '%NY%';