-- View: public.view_x_rejection_reason

-- DROP VIEW public.view_x_rejection_reason;

CREATE OR REPLACE VIEW public.view_x_rejection_reason AS
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
   FROM x_rejection_reason x_rejection_reason;;

ALTER TABLE public.view_x_rejection_reason
    OWNER TO postgres;