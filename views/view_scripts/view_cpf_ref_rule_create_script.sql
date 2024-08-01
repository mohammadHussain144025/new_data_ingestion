-- View: public.view_cpf_ref_rule

-- DROP VIEW public.view_cpf_ref_rule;

CREATE OR REPLACE VIEW public.view_cpf_ref_rule AS
SELECT cpf_ref_rule.name,
    cpf_ref_rule.code,
    p_pricing_region_rgcd.id AS rgcd,
    p_pricing_region_rgcd.name AS rgcd_name,
    p_pricing_region_rgcd.code AS rgcd_code,
    cpf_ref_rule.prior,
    cpf_ref_rule.meth,
    cpf_ref_rule.rule,
    cpf_ref_rule.val,
    cpf_ref_rule.mult,
    cpf_ref_rule.trkcd,
    cpf_ref_rule.level,
    cpf_ref_rule.reftype,
    cpf_ref_rule.id,
    cpf_ref_rule.is_valid,
    cpf_ref_rule.created_date,
    cpf_ref_rule.created_by,
    cpf_ref_rule.updated_date,
    cpf_ref_rule.updated_by,
    cpf_ref_rule.comment
   FROM (cpf_ref_rule cpf_ref_rule
     LEFT JOIN p_pricing_region p_pricing_region_rgcd ON ((cpf_ref_rule.rgcd = p_pricing_region_rgcd.id)));;

ALTER TABLE public.view_cpf_ref_rule
    OWNER TO postgres;