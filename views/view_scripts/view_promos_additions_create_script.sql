-- View: public.view_promos_additions

-- DROP VIEW public.view_promos_additions;

CREATE OR REPLACE VIEW public.view_promos_additions AS
SELECT promos_additions.id,
    promos_additions.name,
    x_approval_status_edapp.id AS edapp,
    x_approval_status_edapp.name AS edapp_name,
    x_approval_status_edapp.code AS edapp_code,
    p_pricing_action_detail_peffdt.id AS peffdt,
    p_pricing_action_detail_peffdt.name AS peffdt_name,
    p_pricing_action_detail_peffdt.code AS peffdt_code,
    promos_additions.ptrack,
    promos_additions.code,
    promos_additions.pcust,
    promos_additions.pref,
    promos_additions.pstart,
    promos_additions.pstop,
    promos_additions.ppart,
    promos_additions.pqty1,
    promos_additions.pqty2,
    promos_additions.pqty3,
    promos_additions.pqty4,
    promos_additions.pqty5,
    promos_additions.pqty6,
    promos_additions.pqty7,
    promos_additions.pprc1,
    promos_additions.pprc2,
    promos_additions.pprc3,
    promos_additions.pprc4,
    promos_additions.pprc5,
    promos_additions.pprc6,
    promos_additions.pprc7,
    promos_additions.pdsc1,
    promos_additions.pdsc2,
    promos_additions.pdsc3,
    promos_additions.pdsc4,
    promos_additions.pdsc5,
    promos_additions.pdsc6,
    promos_additions.pdsc7,
    promos_additions.pdate,
    promos_additions.puser,
    promos_additions.trkqty,
    promos_additions.pprcimp,
    x_approval_status_paapp.id AS paapp,
    x_approval_status_paapp.name AS paapp_name,
    x_approval_status_paapp.code AS paapp_code,
    x_approval_status_pdap.id AS pdap,
    x_approval_status_pdap.name AS pdap_name,
    x_approval_status_pdap.code AS pdap_code,
    x_approval_status_pdl1vapp.id AS pdl1vapp,
    x_approval_status_pdl1vapp.name AS pdl1vapp_name,
    x_approval_status_pdl1vapp.code AS pdl1vapp_code,
    x_approval_status_pdl2vapp.id AS pdl2vapp,
    x_approval_status_pdl2vapp.name AS pdl2vapp_name,
    x_approval_status_pdl2vapp.code AS pdl2vapp_code,
    x_approval_status_pmleadap.id AS pmleadap,
    x_approval_status_pmleadap.name AS pmleadap_name,
    x_approval_status_pmleadap.code AS pmleadap_code,
    p_pricing_region_prfds.id AS prfds,
    p_pricing_region_prfds.name AS prfds_name,
    p_pricing_region_prfds.code AS prfds_code,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    promos_additions.effdt,
    x_approval_status_prcmapp.id AS prcmapp,
    x_approval_status_prcmapp.name AS prcmapp_name,
    x_approval_status_prcmapp.code AS prcmapp_code,
    x_approval_status_pmapp.id AS pmapp,
    x_approval_status_pmapp.name AS pmapp_name,
    x_approval_status_pmapp.code AS pmapp_code,
    promos_additions.updated_by,
    promos_additions.updated_date,
    promos_additions.validationstatus,
    promos_additions.is_valid,
    promos_additions.created_date,
    promos_additions.created_by,
    promos_additions.comment
   FROM (((((((((((promos_additions promos_additions
     LEFT JOIN p_pricing_region p_pricing_region_prfds ON ((promos_additions.prfds = p_pricing_region_prfds.id)))
     LEFT JOIN x_approval_status x_approval_status_paapp ON ((promos_additions.paapp = x_approval_status_paapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl2vapp ON ((promos_additions.pdl2vapp = x_approval_status_pdl2vapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmapp ON ((promos_additions.pmapp = x_approval_status_pmapp.id)))
     LEFT JOIN x_approval_status x_approval_status_prcmapp ON ((promos_additions.prcmapp = x_approval_status_prcmapp.id)))
     LEFT JOIN x_approval_status x_approval_status_edapp ON ((promos_additions.edapp = x_approval_status_edapp.id)))
     LEFT JOIN x_validation x_validation_valid ON ((promos_additions.valid = x_validation_valid.id)))
     LEFT JOIN x_approval_status x_approval_status_pmleadap ON ((promos_additions.pmleadap = x_approval_status_pmleadap.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl1vapp ON ((promos_additions.pdl1vapp = x_approval_status_pdl1vapp.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_peffdt ON ((promos_additions.peffdt = p_pricing_action_detail_peffdt.id)))
     LEFT JOIN x_approval_status x_approval_status_pdap ON ((promos_additions.pdap = x_approval_status_pdap.id)));;

ALTER TABLE public.view_promos_additions
    OWNER TO postgres;