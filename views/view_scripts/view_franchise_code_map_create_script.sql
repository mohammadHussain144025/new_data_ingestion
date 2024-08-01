-- View: public.view_franchise_code_map

-- DROP VIEW public.view_franchise_code_map;

CREATE OR REPLACE VIEW public.view_franchise_code_map AS
SELECT fdscd,
    fsoldt,
    name,
    fshipt,
    frchdisp,
    code,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM franchise_code_map franchise_code_map;;

ALTER TABLE public.view_franchise_code_map
    OWNER TO postgres;