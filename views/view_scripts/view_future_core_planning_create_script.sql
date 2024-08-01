-- View: public.view_future_core_planning

-- DROP VIEW public.view_future_core_planning;

CREATE OR REPLACE VIEW public.view_future_core_planning AS
SELECT p_pricing_region_regcd.id AS regcd,
    p_pricing_region_regcd.name AS regcd_name,
    p_pricing_region_regcd.code AS regcd_code,
    future_core_planning.cpn,
    future_core_planning.coreg,
    future_core_planning.fcoreg,
    future_core_planning.code,
    future_core_planning.name,
    future_core_planning.updt,
    future_core_planning.effdt,
    future_core_planning.stat,
    future_core_planning.fcc,
    future_core_planning.curcoc,
    future_core_planning.id,
    future_core_planning.updated_by,
    future_core_planning.updated_date,
    future_core_planning.validationstatus,
    future_core_planning.is_valid,
    future_core_planning.created_date,
    future_core_planning.created_by,
    future_core_planning.comment
   FROM (future_core_planning future_core_planning
     LEFT JOIN p_pricing_region p_pricing_region_regcd ON ((future_core_planning.regcd = p_pricing_region_regcd.id)));;

ALTER TABLE public.view_future_core_planning
    OWNER TO postgres;