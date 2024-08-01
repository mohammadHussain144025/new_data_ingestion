-- View: public.view_x_brand

-- DROP VIEW public.view_x_brand;

CREATE OR REPLACE VIEW public.view_x_brand AS
SELECT code,
    name,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_brand x_brand;;

ALTER TABLE public.view_x_brand
    OWNER TO postgres;