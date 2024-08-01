-- View: public.view_x_priority

-- DROP VIEW public.view_x_priority;

CREATE OR REPLACE VIEW public.view_x_priority AS
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
   FROM x_priority x_priority;;

ALTER TABLE public.view_x_priority
    OWNER TO postgres;