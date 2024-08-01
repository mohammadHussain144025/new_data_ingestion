-- View: public.view_x_lifecycle_stage

-- DROP VIEW public.view_x_lifecycle_stage;

CREATE OR REPLACE VIEW public.view_x_lifecycle_stage AS
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
   FROM x_lifecycle_stage x_lifecycle_stage;;

ALTER TABLE public.view_x_lifecycle_stage
    OWNER TO postgres;