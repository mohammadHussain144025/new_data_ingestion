-- View: public.view_x_pi

-- DROP VIEW public.view_x_pi;

CREATE OR REPLACE VIEW public.view_x_pi AS
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
   FROM x_pi x_pi;;

ALTER TABLE public.view_x_pi
    OWNER TO postgres;