-- View: public.view_x_ship_to

-- DROP VIEW public.view_x_ship_to;

CREATE OR REPLACE VIEW public.view_x_ship_to AS
SELECT code,
    name,
    rgcd,
    shtcode,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_ship_to x_ship_to;;

ALTER TABLE public.view_x_ship_to
    OWNER TO postgres;