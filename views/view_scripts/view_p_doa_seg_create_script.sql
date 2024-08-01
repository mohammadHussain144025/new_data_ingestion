-- View: public.view_p_doa_seg

-- DROP VIEW public.view_p_doa_seg;

CREATE OR REPLACE VIEW public.view_p_doa_seg AS
SELECT x_segment_type_seg.id AS seg,
    x_segment_type_seg.name AS seg_name,
    x_segment_type_seg.code AS seg_code,
    x_pi_pi.id AS pi,
    x_pi_pi.name AS pi_name,
    x_pi_pi.code AS pi_code,
    p_doa_seg.code,
    p_doa_seg.name,
    p_doa_seg.lowerl,
    p_doa_seg.upperl,
    x_role_role.id AS role,
    x_role_role.name AS role_name,
    x_role_role.code AS role_code,
    p_doa_seg.base,
    x_brand_brnd.id AS brnd,
    x_brand_brnd.name AS brnd_name,
    x_brand_brnd.code AS brnd_code,
    p_pricing_region_reg.id AS reg,
    p_pricing_region_reg.name AS reg_name,
    p_pricing_region_reg.code AS reg_code,
    p_doa_seg.id,
    p_doa_seg.updated_by,
    p_doa_seg.updated_date,
    p_doa_seg.validationstatus,
    p_doa_seg.is_valid,
    p_doa_seg.created_date,
    p_doa_seg.created_by,
    p_doa_seg.comment
   FROM (((((p_doa_seg p_doa_seg
     LEFT JOIN x_brand x_brand_brnd ON ((p_doa_seg.brnd = x_brand_brnd.id)))
     LEFT JOIN x_role x_role_role ON ((p_doa_seg.role = x_role_role.id)))
     LEFT JOIN x_segment_type x_segment_type_seg ON ((p_doa_seg.seg = x_segment_type_seg.id)))
     LEFT JOIN x_pi x_pi_pi ON ((p_doa_seg.pi = x_pi_pi.id)))
     LEFT JOIN p_pricing_region p_pricing_region_reg ON ((p_doa_seg.reg = p_pricing_region_reg.id)));;

ALTER TABLE public.view_p_doa_seg
    OWNER TO postgres;