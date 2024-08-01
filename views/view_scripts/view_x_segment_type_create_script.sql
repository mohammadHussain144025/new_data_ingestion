-- View: public.view_x_segment_type

-- DROP VIEW public.view_x_segment_type;

CREATE OR REPLACE VIEW public.view_x_segment_type AS
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
   FROM x_segment_type x_segment_type;;

ALTER TABLE public.view_x_segment_type
    OWNER TO postgres;