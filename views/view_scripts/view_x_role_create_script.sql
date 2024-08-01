-- View: public.view_x_role

-- DROP VIEW public.view_x_role;

CREATE OR REPLACE VIEW public.view_x_role AS
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
   FROM x_role x_role;;

ALTER TABLE public.view_x_role
    OWNER TO postgres;