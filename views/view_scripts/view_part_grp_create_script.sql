-- View: public.view_part_grp

-- DROP VIEW public.view_part_grp;

CREATE OR REPLACE VIEW public.view_part_grp AS
SELECT part_grp.name,
    part_grp.code,
    x_yes_no_flag_exclude.id AS exclude,
    x_yes_no_flag_exclude.name AS exclude_name,
    x_yes_no_flag_exclude.code AS exclude_code,
    part_grp.pnum,
    x_part_group_partgrp.id AS partgrp,
    x_part_group_partgrp.name AS partgrp_name,
    x_part_group_partgrp.code AS partgrp_code,
    part_grp.id,
    part_grp.updated_by,
    part_grp.updated_date,
    part_grp.validationstatus,
    part_grp.is_valid,
    part_grp.created_date,
    part_grp.created_by,
    part_grp.comment
   FROM ((part_grp part_grp
     LEFT JOIN x_part_group x_part_group_partgrp ON ((part_grp.partgrp = x_part_group_partgrp.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_exclude ON ((part_grp.exclude = x_yes_no_flag_exclude.id)));;

ALTER TABLE public.view_part_grp
    OWNER TO postgres;