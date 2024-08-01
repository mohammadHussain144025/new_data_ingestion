-- View: public.view_prcdsc_additions

-- DROP VIEW public.view_prcdsc_additions;

CREATE OR REPLACE VIEW public.view_prcdsc_additions AS
SELECT prcdsc_additions.name,
    p_pricing_action_detail_paname.id AS paname,
    p_pricing_action_detail_paname.name AS paname_name,
    p_pricing_action_detail_paname.code AS paname_code,
    x_approval_status_prcapp.id AS prcapp,
    x_approval_status_prcapp.name AS prcapp_name,
    x_approval_status_prcapp.code AS prcapp_code,
    prcdsc_additions.prcsoldt,
    prcdsc_additions.code,
    prcdsc_additions.prcshipt,
    prcdsc_additions.prcbrnd,
    prcdsc_additions.prcprod,
    prcdsc_additions.prcchain,
    prcdsc_additions.prcdscp,
    prcdsc_additions.prcstdt,
    prcdsc_additions.prceddt,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    prcdsc_additions.effdt,
    p_pricing_region_prcregcd.id AS prcregcd,
    p_pricing_region_prcregcd.name AS prcregcd_name,
    p_pricing_region_prcregcd.code AS prcregcd_code,
    prcdsc_additions.id,
    prcdsc_additions.updated_by,
    prcdsc_additions.updated_date,
    prcdsc_additions.validationstatus,
    prcdsc_additions.is_valid,
    prcdsc_additions.created_date,
    prcdsc_additions.created_by,
    prcdsc_additions.comment
   FROM ((((prcdsc_additions prcdsc_additions
     LEFT JOIN x_validation x_validation_valid ON ((prcdsc_additions.valid = x_validation_valid.id)))
     LEFT JOIN x_approval_status x_approval_status_prcapp ON ((prcdsc_additions.prcapp = x_approval_status_prcapp.id)))
     LEFT JOIN p_pricing_region p_pricing_region_prcregcd ON ((prcdsc_additions.prcregcd = p_pricing_region_prcregcd.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paname ON ((prcdsc_additions.paname = p_pricing_action_detail_paname.id)));;

ALTER TABLE public.view_prcdsc_additions
    OWNER TO postgres;