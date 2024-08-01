-- View: public.view_quote_rec

-- DROP VIEW public.view_quote_rec;

CREATE OR REPLACE VIEW public.view_quote_rec AS
SELECT quote_rec.id,
    quote_rec.name,
    quote_rec.code,
    quote_rec.qno,
    quote_rec.partnum,
    quote_rec.cusname,
    quote_rec.pcode5,
    quote_rec.pcode3,
    quote_rec.pstatus,
    quote_rec.soldto,
    quote_rec.cusstatus,
    quote_rec.cusgrp,
    quote_rec.stdt,
    quote_rec.minqty1,
    quote_rec.minqty2,
    quote_rec.minqty3,
    quote_rec.minqty4,
    quote_rec.minqty5,
    quote_rec.maxq1,
    quote_rec.maxq2,
    quote_rec.maxq3,
    quote_rec.maxq4,
    quote_rec.maxq5,
    quote_rec.prcq1,
    quote_rec.prcq2,
    quote_rec.prcq3,
    quote_rec.prcq4,
    quote_rec.prcq5,
    quote_rec.lp,
    quote_rec.comqty,
    quote_rec.rev,
    quote_rec.revps,
    quote_rec.percent,
    quote_rec.percvol,
    quote_rec.miss,
    quote_rec.projcst,
    quote_rec.margin,
    x_recc_rec.id AS rec,
    x_recc_rec.name AS rec_name,
    x_recc_rec.code AS rec_code,
    x_recc_userrec.id AS userrec,
    x_recc_userrec.name AS userrec_name,
    x_recc_userrec.code AS userrec_code,
    quote_rec.note,
    p_pricing_region_regcode.id AS regcode,
    p_pricing_region_regcode.name AS regcode_name,
    p_pricing_region_regcode.code AS regcode_code,
    quote_rec.updated_by,
    quote_rec.updated_date,
    quote_rec.validationstatus,
    quote_rec.is_valid,
    quote_rec.created_date,
    quote_rec.created_by,
    quote_rec.comment
   FROM (((quote_rec quote_rec
     LEFT JOIN p_pricing_region p_pricing_region_regcode ON ((quote_rec.regcode = p_pricing_region_regcode.id)))
     LEFT JOIN x_recc x_recc_userrec ON ((quote_rec.userrec = x_recc_userrec.id)))
     LEFT JOIN x_recc x_recc_rec ON ((quote_rec.rec = x_recc_rec.id)));;

ALTER TABLE public.view_quote_rec
    OWNER TO postgres;