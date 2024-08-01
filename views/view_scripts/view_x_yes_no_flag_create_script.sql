-- View: public.view_x_yes_no_flag

-- DROP VIEW public.view_x_yes_no_flag;

CREATE OR REPLACE VIEW public.view_x_yes_no_flag AS
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
   FROM x_yes_no_flag x_yes_no_flag;;

ALTER TABLE public.view_x_yes_no_flag
    OWNER TO postgres;