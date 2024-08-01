-- View: public.view_s_track_code_compliance

-- DROP VIEW public.view_s_track_code_compliance;

CREATE OR REPLACE VIEW public.view_s_track_code_compliance AS
SELECT id,
    code,
    name,
    trakcode,
    regioncode,
    level1,
    level2,
    level3,
    level4,
    level5,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM s_track_code_compliance s_track_code_compliance;;

ALTER TABLE public.view_s_track_code_compliance
    OWNER TO postgres;