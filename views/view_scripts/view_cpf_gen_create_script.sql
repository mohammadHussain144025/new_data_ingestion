-- View: public.view_cpf_gen

-- DROP VIEW public.view_cpf_gen;

CREATE OR REPLACE VIEW public.view_cpf_gen AS
SELECT x_yes_no_flag_copydsm.id AS copydsm,
    x_yes_no_flag_copydsm.name AS copydsm_name,
    x_yes_no_flag_copydsm.code AS copydsm_code,
    x_yes_no_flag_preq.id AS preq,
    x_yes_no_flag_preq.name AS preq_name,
    x_yes_no_flag_preq.code AS preq_code,
    p_pricing_action_detail_paction.id AS paction,
    p_pricing_action_detail_paction.name AS paction_name,
    p_pricing_action_detail_paction.code AS paction_code,
    p_pricing_region_reg.id AS reg,
    p_pricing_region_reg.name AS reg_name,
    p_pricing_region_reg.code AS reg_code,
    cpf_gen.cuscode,
    cpf_gen.code,
    cpf_gen.name,
    cpf_gen.ccodedds,
    cpf_gen.cat,
    cpf_gen.subcat,
    cpf_gen.advnot,
    cpf_gen.ctype,
    cpf_gen.csubtype,
    cpf_gen.bgrp,
    cpf_gen.mrkuprt,
    cpf_gen.cxrefcd,
    cpf_gen.cname,
    cpf_gen.conmail,
    cpf_gen.sfilereq,
    cpf_gen.comment,
    cpf_gen.pftype,
    cpf_gen.salesmgr,
    cpf_gen.dsmmail,
    cpf_gen.yesorno,
    cpf_gen.sendcomm,
    cpf_gen.senton,
    cpf_gen.ss,
    cpf_gen.id,
    cpf_gen.updated_by,
    cpf_gen.updated_date,
    cpf_gen.validationstatus,
    cpf_gen.is_valid,
    cpf_gen.created_date,
    cpf_gen.created_by
   FROM ((((cpf_gen cpf_gen
     LEFT JOIN x_yes_no_flag x_yes_no_flag_preq ON ((cpf_gen.preq = x_yes_no_flag_preq.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_copydsm ON ((cpf_gen.copydsm = x_yes_no_flag_copydsm.id)))
     LEFT JOIN p_pricing_region p_pricing_region_reg ON ((cpf_gen.reg = p_pricing_region_reg.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paction ON ((cpf_gen.paction = p_pricing_action_detail_paction.id)));;

ALTER TABLE public.view_cpf_gen
    OWNER TO postgres;