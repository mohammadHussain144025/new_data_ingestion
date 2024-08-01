-- View: public.view_s_what_if

-- DROP VIEW public.view_s_what_if;

CREATE OR REPLACE VIEW public.view_s_what_if AS
SELECT s_what_if.id,
    x_brand_brnd_cd.id AS brnd_cd,
    x_brand_brnd_cd.name AS brnd_cd_name,
    x_brand_brnd_cd.code AS brnd_cd_code,
    x_dw_1_digit_dwdesc_1.id AS dwdesc_1,
    x_dw_1_digit_dwdesc_1.name AS dwdesc_1_name,
    x_dw_1_digit_dwdesc_1.code AS dwdesc_1_code,
    x_customer_main_group_mngrpd.id AS mngrpd,
    x_customer_main_group_mngrpd.name AS mngrpd_name,
    x_customer_main_group_mngrpd.code AS mngrpd_code,
    s_what_if.code,
    s_what_if.name,
    s_what_if.part_num,
    s_what_if.currchnlp,
    s_what_if.markp,
    s_what_if.thres,
    org_chart_prodman.id AS prodman,
    org_chart_prodman.name AS prodman_name,
    org_chart_prodman.code AS prodman_code,
    s_what_if.updated_by,
    s_what_if.updated_date,
    s_what_if.validationstatus,
    s_what_if.is_valid,
    s_what_if.created_date,
    s_what_if.created_by,
    s_what_if.comment
   FROM ((((s_what_if s_what_if
     LEFT JOIN x_dw_1_digit x_dw_1_digit_dwdesc_1 ON ((s_what_if.dwdesc_1 = x_dw_1_digit_dwdesc_1.id)))
     LEFT JOIN org_chart org_chart_prodman ON ((s_what_if.prodman = org_chart_prodman.id)))
     LEFT JOIN x_customer_main_group x_customer_main_group_mngrpd ON ((s_what_if.mngrpd = x_customer_main_group_mngrpd.id)))
     LEFT JOIN x_brand x_brand_brnd_cd ON ((s_what_if.brnd_cd = x_brand_brnd_cd.id)));;

ALTER TABLE public.view_s_what_if
    OWNER TO postgres;