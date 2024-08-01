-- View: public.view_p_pricing_region

-- DROP VIEW public.view_p_pricing_region;

CREATE OR REPLACE VIEW public.view_p_pricing_region AS
SELECT name,
    code,
    curr,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM p_pricing_region p_pricing_region;;

ALTER TABLE public.view_p_pricing_region
    OWNER TO postgres;