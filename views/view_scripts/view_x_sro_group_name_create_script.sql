-- View: public.view_x_sro_group_name

-- DROP VIEW public.view_x_sro_group_name;

CREATE OR REPLACE VIEW public.view_x_sro_group_name AS
SELECT name,
    code,
    id,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM x_sro_group_name x_sro_group_name;;

ALTER TABLE public.view_x_sro_group_name
    OWNER TO postgres;