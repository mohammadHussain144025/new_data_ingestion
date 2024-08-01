-- View: public.view_p_lifecycle_stage

-- DROP VIEW public.view_p_lifecycle_stage;

CREATE OR REPLACE VIEW public.view_p_lifecycle_stage AS
SELECT x_lifecycle_stage_name.id AS name,
    x_lifecycle_stage_name.name AS name_name,
    x_lifecycle_stage_name.code AS name_code,
    p_lifecycle_stage.code,
    p_lifecycle_stage.id,
    p_lifecycle_stage.updated_by,
    p_lifecycle_stage.updated_date,
    p_lifecycle_stage.validationstatus,
    p_lifecycle_stage.is_valid,
    p_lifecycle_stage.created_date,
    p_lifecycle_stage.created_by,
    p_lifecycle_stage.comment
   FROM (p_lifecycle_stage p_lifecycle_stage
     LEFT JOIN x_lifecycle_stage x_lifecycle_stage_name ON ((p_lifecycle_stage.name = x_lifecycle_stage_name.id)));;

ALTER TABLE public.view_p_lifecycle_stage
    OWNER TO postgres;