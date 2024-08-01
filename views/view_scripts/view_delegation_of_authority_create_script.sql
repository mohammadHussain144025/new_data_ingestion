-- View: public.view_delegation_of_authority

-- DROP VIEW public.view_delegation_of_authority;

CREATE OR REPLACE VIEW public.view_delegation_of_authority AS
SELECT delegation_of_authority.id,
    delegation_of_authority.name,
    x_pi_doatype.id AS doatype,
    x_pi_doatype.name AS doatype_name,
    x_pi_doatype.code AS doatype_code,
    p_pricing_region_reg.id AS reg,
    p_pricing_region_reg.name AS reg_name,
    p_pricing_region_reg.code AS reg_code,
    delegation_of_authority.code,
    x_segment_type_segtype.id AS segtype,
    x_segment_type_segtype.name AS segtype_name,
    x_segment_type_segtype.code AS segtype_code,
    delegation_of_authority.low_l,
    delegation_of_authority.up_l,
    x_role_role.id AS role,
    x_role_role.name AS role_name,
    x_role_role.code AS role_code,
    x_pricing_action_type_ptype.id AS ptype,
    x_pricing_action_type_ptype.name AS ptype_name,
    x_pricing_action_type_ptype.code AS ptype_code,
    delegation_of_authority.updated_by,
    delegation_of_authority.updated_date,
    delegation_of_authority.validationstatus,
    delegation_of_authority.is_valid,
    delegation_of_authority.created_date,
    delegation_of_authority.created_by,
    delegation_of_authority.comment
   FROM (((((delegation_of_authority delegation_of_authority
     LEFT JOIN x_role x_role_role ON ((delegation_of_authority.role = x_role_role.id)))
     LEFT JOIN x_segment_type x_segment_type_segtype ON ((delegation_of_authority.segtype = x_segment_type_segtype.id)))
     LEFT JOIN p_pricing_region p_pricing_region_reg ON ((delegation_of_authority.reg = p_pricing_region_reg.id)))
     LEFT JOIN x_pi x_pi_doatype ON ((delegation_of_authority.doatype = x_pi_doatype.id)))
     LEFT JOIN x_pricing_action_type x_pricing_action_type_ptype ON ((delegation_of_authority.ptype = x_pricing_action_type_ptype.id)));;

ALTER TABLE public.view_delegation_of_authority
    OWNER TO postgres;