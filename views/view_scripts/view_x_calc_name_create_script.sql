-- View: public.view_x_calc_name

-- DROP VIEW public.view_x_calc_name;

CREATE OR REPLACE VIEW public.view_x_calc_name AS
SELECT id,
    name,
    code,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM x_calc_name x_calc_name;;

ALTER TABLE public.view_x_calc_name
    OWNER TO postgres;