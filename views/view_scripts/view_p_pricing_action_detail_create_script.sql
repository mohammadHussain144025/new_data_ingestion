-- View: public.view_p_pricing_action_detail

-- DROP VIEW public.view_p_pricing_action_detail;

CREATE OR REPLACE VIEW public.view_p_pricing_action_detail AS
SELECT x_pricing_action_type_patype.id AS patype,
    x_pricing_action_type_patype.name AS patype_name,
    x_pricing_action_type_patype.code AS patype_code,
    p_pricing_region_prcregcd.id AS prcregcd,
    p_pricing_region_prcregcd.name AS prcregcd_name,
    p_pricing_region_prcregcd.code AS prcregcd_code,
    p_pricing_action_detail.name,
    p_pricing_action_detail.code,
    p_pricing_action_detail.paowner,
    p_pricing_action_detail.tapdt,
    p_pricing_action_detail.effdt,
    p_pricing_action_detail.app,
    x_yes_no_flag_attr.id AS attr,
    x_yes_no_flag_attr.name AS attr_name,
    x_yes_no_flag_attr.code AS attr_code,
    p_pricing_action_detail.id,
    p_pricing_action_detail.updated_by,
    p_pricing_action_detail.updated_date,
    p_pricing_action_detail.validationstatus,
    p_pricing_action_detail.is_valid,
    p_pricing_action_detail.created_date,
    p_pricing_action_detail.created_by,
    p_pricing_action_detail.comment
   FROM (((p_pricing_action_detail p_pricing_action_detail
     LEFT JOIN x_pricing_action_type x_pricing_action_type_patype ON ((p_pricing_action_detail.patype = x_pricing_action_type_patype.id)))
     LEFT JOIN p_pricing_region p_pricing_region_prcregcd ON ((p_pricing_action_detail.prcregcd = p_pricing_region_prcregcd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_attr ON ((p_pricing_action_detail.attr = x_yes_no_flag_attr.id)));;

ALTER TABLE public.view_p_pricing_action_detail
    OWNER TO postgres;