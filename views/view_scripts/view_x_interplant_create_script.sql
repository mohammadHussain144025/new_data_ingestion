-- View: public.view_x_interplant

-- DROP VIEW public.view_x_interplant;

CREATE OR REPLACE VIEW public.view_x_interplant AS
SELECT id,
    name,
    code,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM x_interplant x_interplant;;

ALTER TABLE public.view_x_interplant
    OWNER TO postgres;