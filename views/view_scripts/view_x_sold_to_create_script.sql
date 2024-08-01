-- View: public.view_x_sold_to

-- DROP VIEW public.view_x_sold_to;

CREATE OR REPLACE VIEW public.view_x_sold_to AS
SELECT code,
    name,
    rgcd,
    stocode,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM x_sold_to x_sold_to;;

ALTER TABLE public.view_x_sold_to
    OWNER TO postgres;