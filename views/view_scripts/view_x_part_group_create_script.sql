-- View: public.view_x_part_group

-- DROP VIEW public.view_x_part_group;

CREATE OR REPLACE VIEW public.view_x_part_group AS
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
   FROM x_part_group x_part_group;;

ALTER TABLE public.view_x_part_group
    OWNER TO postgres;