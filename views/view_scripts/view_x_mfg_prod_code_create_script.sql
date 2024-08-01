-- View: public.view_x_mfg_prod_code

-- DROP VIEW public.view_x_mfg_prod_code;

CREATE OR REPLACE VIEW public.view_x_mfg_prod_code AS
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
   FROM x_mfg_prod_code x_mfg_prod_code;;

ALTER TABLE public.view_x_mfg_prod_code
    OWNER TO postgres;