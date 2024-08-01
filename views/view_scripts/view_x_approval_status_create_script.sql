-- View: public.view_x_approval_status

-- DROP VIEW public.view_x_approval_status;

CREATE OR REPLACE VIEW public.view_x_approval_status AS
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
   FROM x_approval_status x_approval_status;;

ALTER TABLE public.view_x_approval_status
    OWNER TO postgres;