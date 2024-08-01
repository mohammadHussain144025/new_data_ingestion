-- View: public.view_x_good_better_best

-- DROP VIEW public.view_x_good_better_best;

CREATE OR REPLACE VIEW public.view_x_good_better_best AS
SELECT id,
    name,
    code,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_good_better_best x_good_better_best;;

ALTER TABLE public.view_x_good_better_best
    OWNER TO postgres;