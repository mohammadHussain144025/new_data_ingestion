-- View: public.view_fcp_sp

-- DROP VIEW public.view_fcp_sp;

CREATE OR REPLACE VIEW public.view_fcp_sp AS
SELECT p_pricing_region_regcd.id AS regcd,
    p_pricing_region_regcd.name AS regcd_name,
    p_pricing_region_regcd.code AS regcd_code,
    fcp_sp.spn,
    fcp_sp.code,
    fcp_sp.name,
    fcp_sp.corepn,
    fcp_sp.effdt,
    fcp_sp.coreqty,
    fcp_sp.fcorepn,
    fcp_sp.fcoreqty,
    fcp_sp.id,
    fcp_sp.updated_by,
    fcp_sp.updated_date,
    fcp_sp.validationstatus,
    fcp_sp.is_valid,
    fcp_sp.created_date,
    fcp_sp.created_by,
    fcp_sp.comment
   FROM (fcp_sp fcp_sp
     LEFT JOIN p_pricing_region p_pricing_region_regcd ON ((fcp_sp.regcd = p_pricing_region_regcd.id)));;

ALTER TABLE public.view_fcp_sp
    OWNER TO postgres;