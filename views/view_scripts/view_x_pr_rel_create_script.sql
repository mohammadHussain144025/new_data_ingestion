-- View: public.view_x_pr_rel

-- DROP VIEW public.view_x_pr_rel;

CREATE OR REPLACE VIEW public.view_x_pr_rel AS
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
   FROM x_pr_rel x_pr_rel;;

ALTER TABLE public.view_x_pr_rel
    OWNER TO postgres;