-- View: public.view_sro_rules

-- DROP VIEW public.view_sro_rules;

CREATE OR REPLACE VIEW public.view_sro_rules AS
SELECT sro_rules.code,
    sro_rules.name,
    sro_rules.ruleno,
    sro_rules.attr,
    sro_rules.mult,
    sro_rules.form,
    sro_rules.notes,
    x_yes_no_flag_pl.id AS pl,
    x_yes_no_flag_pl.name AS pl_name,
    x_yes_no_flag_pl.code AS pl_code,
    sro_attributes_srocat.id AS srocat,
    sro_attributes_srocat.name AS srocat_name,
    sro_attributes_srocat.code AS srocat_code,
    x_sro_group_name_srogrp.id AS srogrp,
    x_sro_group_name_srogrp.name AS srogrp_name,
    x_sro_group_name_srogrp.code AS srogrp_code,
    sro_rules.id,
    sro_rules.updated_by,
    sro_rules.updated_date,
    sro_rules.validationstatus,
    sro_rules.is_valid,
    sro_rules.created_date,
    sro_rules.created_by,
    sro_rules.comment
   FROM (((sro_rules sro_rules
     LEFT JOIN x_sro_group_name x_sro_group_name_srogrp ON ((sro_rules.srogrp = x_sro_group_name_srogrp.id)))
     LEFT JOIN sro_attributes sro_attributes_srocat ON ((sro_rules.srocat = sro_attributes_srocat.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_pl ON ((sro_rules.pl = x_yes_no_flag_pl.id)));;

ALTER TABLE public.view_sro_rules
    OWNER TO postgres;