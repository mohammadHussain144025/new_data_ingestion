-- View: public.view_x_sub_brand

-- DROP VIEW public.view_x_sub_brand;

CREATE OR REPLACE VIEW public.view_x_sub_brand AS
SELECT id,
    code,
    name,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_sub_brand x_sub_brand;;

ALTER TABLE public.view_x_sub_brand
    OWNER TO postgres;