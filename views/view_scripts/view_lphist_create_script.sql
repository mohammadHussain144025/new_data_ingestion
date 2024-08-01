-- View: public.view_lphist

-- DROP VIEW public.view_lphist;

CREATE OR REPLACE VIEW public.view_lphist AS
SELECT lphist.name,
    lphist.code,
    lphist.part_num,
    p_pricing_region_regcd.id AS regcd,
    p_pricing_region_regcd.name AS regcd_name,
    p_pricing_region_regcd.code AS regcd_code,
    lphist.pcode5,
    lphist.pcode3,
    lphist.lprice,
    lphist.fdate,
    lphist.tdate,
    p_pricing_action_detail_paction.id AS paction,
    p_pricing_action_detail_paction.name AS paction_name,
    p_pricing_action_detail_paction.code AS paction_code,
    lphist.id,
    lphist.is_valid,
    lphist.created_date,
    lphist.created_by,
    lphist.updated_date,
    lphist.updated_by,
    lphist.comment
   FROM ((lphist lphist
     LEFT JOIN p_pricing_region p_pricing_region_regcd ON ((lphist.regcd = p_pricing_region_regcd.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paction ON ((lphist.paction = p_pricing_action_detail_paction.id)));;

ALTER TABLE public.view_lphist
    OWNER TO postgres;