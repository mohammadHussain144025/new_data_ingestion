-- View: public.view_quotefil_additions

-- DROP VIEW public.view_quotefil_additions;

CREATE OR REPLACE VIEW public.view_quotefil_additions AS
SELECT quotefil_additions.name,
    quotefil_additions.qsoldt,
    quotefil_additions.code,
    quotefil_additions.qpart,
    quotefil_additions.qcust,
    quotefil_additions.quote,
    quotefil_additions.qfrom,
    quotefil_additions.qto,
    quotefil_additions.qmail,
    quotefil_additions.qrefer,
    quotefil_additions.qattn,
    quotefil_additions.qmin1,
    quotefil_additions.qmin2,
    quotefil_additions.qmin3,
    quotefil_additions.qmin4,
    quotefil_additions.qmin5,
    quotefil_additions.qmax1,
    quotefil_additions.qmax2,
    quotefil_additions.qmax3,
    quotefil_additions.qmax4,
    quotefil_additions.qmax5,
    quotefil_additions.qprc1,
    quotefil_additions.qprc2,
    quotefil_additions.qprc3,
    quotefil_additions.qprc4,
    quotefil_additions.qprc5,
    quotefil_additions.qdsc1,
    quotefil_additions.qdsc2,
    quotefil_additions.qdsc3,
    quotefil_additions.qdsc4,
    quotefil_additions.qdsc5,
    quotefil_additions.qlist,
    quotefil_additions.qspecl,
    quotefil_additions.qprint,
    quotefil_additions.qcmt1,
    quotefil_additions.qcmt2,
    quotefil_additions.qcomqty,
    quotefil_additions.qeffdt,
    quotefil_additions.qprcimp,
    quotefil_additions.qapp,
    p_pricing_region_qfds.id AS qfds,
    p_pricing_region_qfds.name AS qfds_name,
    p_pricing_region_qfds.code AS qfds_code,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    x_approval_status_paapp.id AS paapp,
    x_approval_status_paapp.name AS paapp_name,
    x_approval_status_paapp.code AS paapp_code,
    x_approval_status_pdl1vapp.id AS pdl1vapp,
    x_approval_status_pdl1vapp.name AS pdl1vapp_name,
    x_approval_status_pdl1vapp.code AS pdl1vapp_code,
    x_approval_status_pdl2vapp.id AS pdl2vapp,
    x_approval_status_pdl2vapp.name AS pdl2vapp_name,
    x_approval_status_pdl2vapp.code AS pdl2vapp_code,
    x_approval_status_pmleadap.id AS pmleadap,
    x_approval_status_pmleadap.name AS pmleadap_name,
    x_approval_status_pmleadap.code AS pmleadap_code,
    x_approval_status_pmapp.id AS pmapp,
    x_approval_status_pmapp.name AS pmapp_name,
    x_approval_status_pmapp.code AS pmapp_code,
    x_yes_no_flag_pmaapp.id AS pmaapp,
    x_yes_no_flag_pmaapp.name AS pmaapp_name,
    x_yes_no_flag_pmaapp.code AS pmaapp_code,
    x_approval_status_edapp.id AS edapp,
    x_approval_status_edapp.name AS edapp_name,
    x_approval_status_edapp.code AS edapp_code,
    p_pricing_action_detail_paname.id AS paname,
    p_pricing_action_detail_paname.name AS paname_name,
    p_pricing_action_detail_paname.code AS paname_code,
    x_approval_status_pdapp.id AS pdapp,
    x_approval_status_pdapp.name AS pdapp_name,
    x_approval_status_pdapp.code AS pdapp_code,
    quotefil_additions.id,
    quotefil_additions.updated_by,
    quotefil_additions.updated_date,
    quotefil_additions.validationstatus,
    quotefil_additions.is_valid,
    quotefil_additions.created_date,
    quotefil_additions.created_by,
    quotefil_additions.comment
   FROM (((((((((((quotefil_additions quotefil_additions
     LEFT JOIN x_approval_status x_approval_status_paapp ON ((quotefil_additions.paapp = x_approval_status_paapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl2vapp ON ((quotefil_additions.pdl2vapp = x_approval_status_pdl2vapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmapp ON ((quotefil_additions.pmapp = x_approval_status_pmapp.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_pmaapp ON ((quotefil_additions.pmaapp = x_yes_no_flag_pmaapp.id)))
     LEFT JOIN p_pricing_region p_pricing_region_qfds ON ((quotefil_additions.qfds = p_pricing_region_qfds.id)))
     LEFT JOIN x_validation x_validation_valid ON ((quotefil_additions.valid = x_validation_valid.id)))
     LEFT JOIN x_approval_status x_approval_status_edapp ON ((quotefil_additions.edapp = x_approval_status_edapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmleadap ON ((quotefil_additions.pmleadap = x_approval_status_pmleadap.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl1vapp ON ((quotefil_additions.pdl1vapp = x_approval_status_pdl1vapp.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paname ON ((quotefil_additions.paname = p_pricing_action_detail_paname.id)))
     LEFT JOIN x_approval_status x_approval_status_pdapp ON ((quotefil_additions.pdapp = x_approval_status_pdapp.id)));;

ALTER TABLE public.view_quotefil_additions
    OWNER TO postgres;