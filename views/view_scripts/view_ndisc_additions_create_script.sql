-- View: public.view_ndisc_additions

-- DROP VIEW public.view_ndisc_additions;

CREATE OR REPLACE VIEW public.view_ndisc_additions AS
SELECT p_pricing_action_detail_paname.id AS paname,
    p_pricing_action_detail_paname.name AS paname_name,
    p_pricing_action_detail_paname.code AS paname_code,
    x_approval_status_approv.id AS approv,
    x_approval_status_approv.name AS approv_name,
    x_approval_status_approv.code AS approv_code,
    p_pricing_region_reg.id AS reg,
    p_pricing_region_reg.name AS reg_name,
    p_pricing_region_reg.code AS reg_code,
    ndisc_additions.code,
    ndisc_additions.name,
    ndisc_additions.cuscode,
    ndisc_additions.dperct,
    ndisc_additions.sdate,
    ndisc_additions.edate,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    ndisc_additions.effdt,
    ndisc_additions.id,
    ndisc_additions.updated_by,
    ndisc_additions.updated_date,
    ndisc_additions.validationstatus,
    ndisc_additions.is_valid,
    ndisc_additions.created_date,
    ndisc_additions.created_by,
    ndisc_additions.comment
   FROM ((((ndisc_additions ndisc_additions
     LEFT JOIN x_approval_status x_approval_status_approv ON ((ndisc_additions.approv = x_approval_status_approv.id)))
     LEFT JOIN x_validation x_validation_valid ON ((ndisc_additions.valid = x_validation_valid.id)))
     LEFT JOIN p_pricing_region p_pricing_region_reg ON ((ndisc_additions.reg = p_pricing_region_reg.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paname ON ((ndisc_additions.paname = p_pricing_action_detail_paname.id)));;

ALTER TABLE public.view_ndisc_additions
    OWNER TO postgres;