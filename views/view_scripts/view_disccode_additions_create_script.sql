-- View: public.view_disccode_additions

-- DROP VIEW public.view_disccode_additions;

CREATE OR REPLACE VIEW public.view_disccode_additions AS
SELECT disccode_additions.id,
    p_pricing_action_detail_paname.id AS paname,
    p_pricing_action_detail_paname.name AS paname_name,
    p_pricing_action_detail_paname.code AS paname_code,
    x_approval_status_approv.id AS approv,
    x_approval_status_approv.name AS approv_name,
    x_approval_status_approv.code AS approv_code,
    p_pricing_region_reg.id AS reg,
    p_pricing_region_reg.name AS reg_name,
    p_pricing_region_reg.code AS reg_code,
    disccode_additions.dcode,
    disccode_additions.code,
    disccode_additions.name,
    disccode_additions.dperct,
    disccode_additions.sdate,
    disccode_additions.edate,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    disccode_additions.effdt,
    disccode_additions.updated_by,
    disccode_additions.updated_date,
    disccode_additions.validationstatus,
    disccode_additions.is_valid,
    disccode_additions.created_date,
    disccode_additions.created_by,
    disccode_additions.comment
   FROM ((((disccode_additions disccode_additions
     LEFT JOIN x_approval_status x_approval_status_approv ON ((disccode_additions.approv = x_approval_status_approv.id)))
     LEFT JOIN x_validation x_validation_valid ON ((disccode_additions.valid = x_validation_valid.id)))
     LEFT JOIN p_pricing_region p_pricing_region_reg ON ((disccode_additions.reg = p_pricing_region_reg.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paname ON ((disccode_additions.paname = p_pricing_action_detail_paname.id)));;

ALTER TABLE public.view_disccode_additions
    OWNER TO postgres;