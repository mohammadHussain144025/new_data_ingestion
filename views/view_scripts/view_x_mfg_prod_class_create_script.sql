-- View: public.view_x_mfg_prod_class

-- DROP VIEW public.view_x_mfg_prod_class;

CREATE OR REPLACE VIEW public.view_x_mfg_prod_class AS
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
   FROM x_mfg_prod_class x_mfg_prod_class;;

ALTER TABLE public.view_x_mfg_prod_class
    OWNER TO postgres;