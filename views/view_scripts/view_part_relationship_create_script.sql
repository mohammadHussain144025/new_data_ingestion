-- View: public.view_part_relationship

-- DROP VIEW public.view_part_relationship;

CREATE OR REPLACE VIEW public.view_part_relationship AS
SELECT part_relationship.id,
    part_relationship.name,
    part_relationship.code,
    x_pr_rel_reltype.id AS reltype,
    x_pr_rel_reltype.name AS reltype_name,
    x_pr_rel_reltype.code AS reltype_code,
    part_relationship.ppart,
    part_relationship.spart,
    part_relationship.val,
    p_pricing_region_prcregcd.id AS prcregcd,
    p_pricing_region_prcregcd.name AS prcregcd_name,
    p_pricing_region_prcregcd.code AS prcregcd_code,
    x_pr_type_rel.id AS rel,
    x_pr_type_rel.name AS rel_name,
    x_pr_type_rel.code AS rel_code,
    x_part_group_spartgrp.id AS spartgrp,
    x_part_group_spartgrp.name AS spartgrp_name,
    x_part_group_spartgrp.code AS spartgrp_code,
    part_relationship.updated_by,
    part_relationship.updated_date,
    part_relationship.validationstatus,
    part_relationship.is_valid,
    part_relationship.created_date,
    part_relationship.created_by,
    part_relationship.comment
   FROM ((((part_relationship part_relationship
     LEFT JOIN x_pr_rel x_pr_rel_reltype ON ((part_relationship.reltype = x_pr_rel_reltype.id)))
     LEFT JOIN x_part_group x_part_group_spartgrp ON ((part_relationship.spartgrp = x_part_group_spartgrp.id)))
     LEFT JOIN p_pricing_region p_pricing_region_prcregcd ON ((part_relationship.prcregcd = p_pricing_region_prcregcd.id)))
     LEFT JOIN x_pr_type x_pr_type_rel ON ((part_relationship.rel = x_pr_type_rel.id)));;

ALTER TABLE public.view_part_relationship
    OWNER TO postgres;