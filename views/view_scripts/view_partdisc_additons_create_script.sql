-- View: public.view_partdisc_additons

-- DROP VIEW public.view_partdisc_additons;

CREATE OR REPLACE VIEW public.view_partdisc_additons AS
SELECT partdisc_additons.id,
    partdisc_additons.name,
    p_pricing_action_detail_peffdt.id AS peffdt,
    p_pricing_action_detail_peffdt.name AS peffdt_name,
    p_pricing_action_detail_peffdt.code AS peffdt_code,
    x_approval_status_papp.id AS papp,
    x_approval_status_papp.name AS papp_name,
    x_approval_status_papp.code AS papp_code,
    partdisc_additons.code,
    partdisc_additons.psoldt,
    partdisc_additons.ppcode,
    partdisc_additons.pdisc,
    partdisc_additons.pstrdt,
    partdisc_additons.penddt,
    p_pricing_region_pfds.id AS pfds,
    p_pricing_region_pfds.name AS pfds_name,
    p_pricing_region_pfds.code AS pfds_code,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    partdisc_additons.effdt,
    partdisc_additons.updated_by,
    partdisc_additons.updated_date,
    partdisc_additons.validationstatus,
    partdisc_additons.is_valid,
    partdisc_additons.created_date,
    partdisc_additons.created_by,
    partdisc_additons.comment
   FROM ((((partdisc_additons partdisc_additons
     LEFT JOIN p_pricing_region p_pricing_region_pfds ON ((partdisc_additons.pfds = p_pricing_region_pfds.id)))
     LEFT JOIN x_validation x_validation_valid ON ((partdisc_additons.valid = x_validation_valid.id)))
     LEFT JOIN x_approval_status x_approval_status_papp ON ((partdisc_additons.papp = x_approval_status_papp.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_peffdt ON ((partdisc_additons.peffdt = p_pricing_action_detail_peffdt.id)));;

ALTER TABLE public.view_partdisc_additons
    OWNER TO postgres;