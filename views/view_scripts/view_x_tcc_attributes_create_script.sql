-- View: public.view_x_tcc_attributes

-- DROP VIEW public.view_x_tcc_attributes;

CREATE OR REPLACE VIEW public.view_x_tcc_attributes AS
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
   FROM x_tcc_attributes x_tcc_attributes;;

ALTER TABLE public.view_x_tcc_attributes
    OWNER TO postgres;