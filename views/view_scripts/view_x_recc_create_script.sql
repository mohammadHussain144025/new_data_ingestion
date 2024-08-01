-- View: public.view_x_recc

-- DROP VIEW public.view_x_recc;

CREATE OR REPLACE VIEW public.view_x_recc AS
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
   FROM x_recc x_recc;;

ALTER TABLE public.view_x_recc
    OWNER TO postgres;