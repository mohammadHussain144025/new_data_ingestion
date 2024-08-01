-- View: public.view_p_good_better_best

-- DROP VIEW public.view_p_good_better_best;

CREATE OR REPLACE VIEW public.view_p_good_better_best AS
SELECT x_good_better_best_name.id AS name,
    x_good_better_best_name.name AS name_name,
    x_good_better_best_name.code AS name_code,
    p_good_better_best.code,
    p_good_better_best.id,
    p_good_better_best.updated_by,
    p_good_better_best.updated_date,
    p_good_better_best.validationstatus,
    p_good_better_best.is_valid,
    p_good_better_best.created_date,
    p_good_better_best.created_by,
    p_good_better_best.comment
   FROM (p_good_better_best p_good_better_best
     LEFT JOIN x_good_better_best x_good_better_best_name ON ((p_good_better_best.name = x_good_better_best_name.id)));;

ALTER TABLE public.view_p_good_better_best
    OWNER TO postgres;