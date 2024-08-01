-- View: public.view_x_status

-- DROP VIEW public.view_x_status;

CREATE OR REPLACE VIEW public.view_x_status AS
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
   FROM x_status x_status;;

ALTER TABLE public.view_x_status
    OWNER TO postgres;