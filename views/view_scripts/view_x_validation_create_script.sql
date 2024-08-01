-- View: public.view_x_validation

-- DROP VIEW public.view_x_validation;

CREATE OR REPLACE VIEW public.view_x_validation AS
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
   FROM x_validation x_validation;;

ALTER TABLE public.view_x_validation
    OWNER TO postgres;