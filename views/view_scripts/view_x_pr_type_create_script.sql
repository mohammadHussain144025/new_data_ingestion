-- View: public.view_x_pr_type

-- DROP VIEW public.view_x_pr_type;

CREATE OR REPLACE VIEW public.view_x_pr_type AS
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
   FROM x_pr_type x_pr_type;;

ALTER TABLE public.view_x_pr_type
    OWNER TO postgres;