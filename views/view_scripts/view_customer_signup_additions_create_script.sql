-- View: public.view_customer_signup_additions

-- DROP VIEW public.view_customer_signup_additions;

CREATE OR REPLACE VIEW public.view_customer_signup_additions AS
SELECT customer_signup_additions.id,
    p_pricing_action_detail_paname.id AS paname,
    p_pricing_action_detail_paname.name AS paname_name,
    p_pricing_action_detail_paname.code AS paname_code,
    customer_signup_additions.code,
    customer_signup_additions.name,
    x_approval_status_approv.id AS approv,
    x_approval_status_approv.name AS approv_name,
    x_approval_status_approv.code AS approv_code,
    p_pricing_region_fds.id AS fds,
    p_pricing_region_fds.name AS fds_name,
    p_pricing_region_fds.code AS fds_code,
    customer_signup_additions.ccode,
    customer_signup_additions.trkcd,
    customer_signup_additions.level,
    customer_signup_additions.bdate,
    customer_signup_additions.edate,
    customer_signup_additions.adate,
    customer_signup_additions."user",
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    customer_signup_additions.effdt,
    customer_signup_additions.updated_by,
    customer_signup_additions.updated_date,
    customer_signup_additions.validationstatus,
    customer_signup_additions.is_valid,
    customer_signup_additions.created_date,
    customer_signup_additions.created_by,
    customer_signup_additions.comment
   FROM ((((customer_signup_additions customer_signup_additions
     LEFT JOIN x_approval_status x_approval_status_approv ON ((customer_signup_additions.approv = x_approval_status_approv.id)))
     LEFT JOIN p_pricing_region p_pricing_region_fds ON ((customer_signup_additions.fds = p_pricing_region_fds.id)))
     LEFT JOIN x_validation x_validation_valid ON ((customer_signup_additions.valid = x_validation_valid.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paname ON ((customer_signup_additions.paname = p_pricing_action_detail_paname.id)));;

ALTER TABLE public.view_customer_signup_additions
    OWNER TO postgres;