-- View: public.view_x_rfs

-- DROP VIEW public.view_x_rfs;

CREATE OR REPLACE VIEW public.view_x_rfs AS
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
   FROM x_rfs x_rfs;;

ALTER TABLE public.view_x_rfs
    OWNER TO postgres;