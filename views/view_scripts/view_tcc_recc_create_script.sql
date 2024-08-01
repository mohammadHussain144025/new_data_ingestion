-- View: public.view_tcc_recc

-- DROP VIEW public.view_tcc_recc;

CREATE OR REPLACE VIEW public.view_tcc_recc AS
SELECT tcc_recc.id,
    tcc_recc.name,
    tcc_recc.code,
    x_recc_user.id AS "user",
    x_recc_user.name AS user_name,
    x_recc_user.code AS user_code,
    tcc_recc.cuscode,
    tcc_recc.cusname,
    tcc_recc."desc",
    p_pricing_region_regcode.id AS regcode,
    p_pricing_region_regcode.name AS regcode_name,
    p_pricing_region_regcode.code AS regcode_code,
    tcc_recc.trkcd,
    tcc_recc.level,
    tcc_recc.rev,
    tcc_recc.comrev,
    tcc_recc.percent,
    tcc_recc.bwcomm,
    x_recc_rec.id AS rec,
    x_recc_rec.name AS rec_name,
    x_recc_rec.code AS rec_code,
    tcc_recc.comment,
    tcc_recc.pdate,
    tcc_recc.updated_by,
    tcc_recc.updated_date,
    tcc_recc.validationstatus,
    tcc_recc.is_valid,
    tcc_recc.created_date,
    tcc_recc.created_by
   FROM (((tcc_recc tcc_recc
     LEFT JOIN p_pricing_region p_pricing_region_regcode ON ((tcc_recc.regcode = p_pricing_region_regcode.id)))
     LEFT JOIN x_recc x_recc_rec ON ((tcc_recc.rec = x_recc_rec.id)))
     LEFT JOIN x_recc x_recc_user ON ((tcc_recc."user" = x_recc_user.id)));;

ALTER TABLE public.view_tcc_recc
    OWNER TO postgres;