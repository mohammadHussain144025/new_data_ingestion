-- View: public.view_alternate_parts

-- DROP VIEW public.view_alternate_parts;

CREATE OR REPLACE VIEW public.view_alternate_parts AS
SELECT code,
    name,
    root_part,
    xref_part,
    diff_flg,
    diff_str,
    brandsort,
    rgcd,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM alternate_parts alternate_parts;;

ALTER TABLE public.view_alternate_parts
    OWNER TO postgres;