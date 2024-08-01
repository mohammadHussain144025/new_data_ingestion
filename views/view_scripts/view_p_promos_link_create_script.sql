-- View: public.view_p_promos_link

-- DROP VIEW public.view_p_promos_link;

CREATE OR REPLACE VIEW public.view_p_promos_link AS
SELECT p_promos_link.code,
    p_promos_link.name,
    p_promos_link.trkcd,
    p_promos_link.ftrkcd,
    p_pricing_region_lregcd.id AS lregcd,
    p_pricing_region_lregcd.name AS lregcd_name,
    p_pricing_region_lregcd.code AS lregcd_code,
    p_pricing_region_fregcd.id AS fregcd,
    p_pricing_region_fregcd.name AS fregcd_name,
    p_pricing_region_fregcd.code AS fregcd_code,
    p_promos_link.id,
    p_promos_link.updated_by,
    p_promos_link.updated_date,
    p_promos_link.validationstatus,
    p_promos_link.is_valid,
    p_promos_link.created_date,
    p_promos_link.created_by,
    p_promos_link.comment
   FROM ((p_promos_link p_promos_link
     LEFT JOIN p_pricing_region p_pricing_region_lregcd ON ((p_promos_link.lregcd = p_pricing_region_lregcd.id)))
     LEFT JOIN p_pricing_region p_pricing_region_fregcd ON ((p_promos_link.fregcd = p_pricing_region_fregcd.id)));;

ALTER TABLE public.view_p_promos_link
    OWNER TO postgres;