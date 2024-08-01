-- View: public.view_trkcodmm_additions

-- DROP VIEW public.view_trkcodmm_additions;

CREATE OR REPLACE VIEW public.view_trkcodmm_additions AS
SELECT trkcodmm_additions.id,
    trkcodmm_additions.name,
    trkcodmm_additions.code,
    trkcodmm_additions.mrakcode,
    trkcodmm_additions.mctype,
    trkcodmm_additions.msubtyp,
    trkcodmm_additions.msoldto,
    trkcodmm_additions.mstrdat,
    trkcodmm_additions.mstpdat,
    trkcodmm_additions.mcqty1,
    trkcodmm_additions.mcqty2,
    trkcodmm_additions.mcqty3,
    trkcodmm_additions.mcqty4,
    trkcodmm_additions.mcqty5,
    trkcodmm_additions.mcqty6,
    trkcodmm_additions.mcqty7,
    trkcodmm_additions.motord,
    trkcodmm_additions.mterm1,
    trkcodmm_additions.mterm2,
    trkcodmm_additions.mterm3,
    trkcodmm_additions.mterm4,
    trkcodmm_additions.mterm5,
    trkcodmm_additions.mterm6,
    trkcodmm_additions.mterm7,
    trkcodmm_additions.mmaxpl,
    trkcodmm_additions.mfullp,
    trkcodmm_additions.mrdcyn,
    trkcodmm_additions.mvendor,
    x_approval_status_mmapp.id AS mmapp,
    x_approval_status_mmapp.name AS mmapp_name,
    x_approval_status_mmapp.code AS mmapp_code,
    p_pricing_action_detail_mmeffdt.id AS mmeffdt,
    p_pricing_action_detail_mmeffdt.name AS mmeffdt_name,
    p_pricing_action_detail_mmeffdt.code AS mmeffdt_code,
    p_pricing_region_mfdscd.id AS mfdscd,
    p_pricing_region_mfdscd.name AS mfdscd_name,
    p_pricing_region_mfdscd.code AS mfdscd_code,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    trkcodmm_additions.effdt,
    trkcodmm_additions.updated_by,
    trkcodmm_additions.updated_date,
    trkcodmm_additions.validationstatus,
    trkcodmm_additions.is_valid,
    trkcodmm_additions.created_date,
    trkcodmm_additions.created_by,
    trkcodmm_additions.comment
   FROM ((((trkcodmm_additions trkcodmm_additions
     LEFT JOIN p_pricing_region p_pricing_region_mfdscd ON ((trkcodmm_additions.mfdscd = p_pricing_region_mfdscd.id)))
     LEFT JOIN x_validation x_validation_valid ON ((trkcodmm_additions.valid = x_validation_valid.id)))
     LEFT JOIN x_approval_status x_approval_status_mmapp ON ((trkcodmm_additions.mmapp = x_approval_status_mmapp.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_mmeffdt ON ((trkcodmm_additions.mmeffdt = p_pricing_action_detail_mmeffdt.id)));;

ALTER TABLE public.view_trkcodmm_additions
    OWNER TO postgres;