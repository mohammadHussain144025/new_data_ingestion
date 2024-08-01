-- View: public.view_s_tcc_qualifiers

-- DROP VIEW public.view_s_tcc_qualifiers;

CREATE OR REPLACE VIEW public.view_s_tcc_qualifiers AS
SELECT s_tcc_qualifiers.name,
    x_tcc_attributes_attribute.id AS attribute,
    x_tcc_attributes_attribute.name AS attribute_name,
    x_tcc_attributes_attribute.code AS attribute_code,
    s_tcc_qualifiers.code,
    s_tcc_qualifiers.trackcode,
    s_tcc_qualifiers.regioncode,
    s_tcc_qualifiers.value,
    s_tcc_qualifiers.id,
    s_tcc_qualifiers.updated_by,
    s_tcc_qualifiers.updated_date,
    s_tcc_qualifiers.validationstatus,
    s_tcc_qualifiers.is_valid,
    s_tcc_qualifiers.created_date,
    s_tcc_qualifiers.created_by,
    s_tcc_qualifiers.comment
   FROM (s_tcc_qualifiers s_tcc_qualifiers
     LEFT JOIN x_tcc_attributes x_tcc_attributes_attribute ON ((s_tcc_qualifiers.attribute = x_tcc_attributes_attribute.id)));;

ALTER TABLE public.view_s_tcc_qualifiers
    OWNER TO postgres;