-- View: public.view_p_sub_brand

-- DROP VIEW public.view_p_sub_brand;

CREATE OR REPLACE VIEW public.view_p_sub_brand AS
SELECT p_sub_brand.code,
    x_sub_brand_name.id AS name,
    x_sub_brand_name.name AS name_name,
    x_sub_brand_name.code AS name_code,
    p_sub_brand.id,
    p_sub_brand.updated_by,
    p_sub_brand.updated_date,
    p_sub_brand.validationstatus,
    p_sub_brand.is_valid,
    p_sub_brand.created_date,
    p_sub_brand.created_by,
    p_sub_brand.comment
   FROM (p_sub_brand p_sub_brand
     LEFT JOIN x_sub_brand x_sub_brand_name ON ((p_sub_brand.name = x_sub_brand_name.id)));;

ALTER TABLE public.view_p_sub_brand
    OWNER TO postgres;