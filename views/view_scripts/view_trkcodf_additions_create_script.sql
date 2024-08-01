-- View: public.view_trkcodf_additions

-- DROP VIEW public.view_trkcodf_additions;

CREATE OR REPLACE VIEW public.view_trkcodf_additions AS
SELECT trkcodf_additions.name,
    trkcodf_additions.code,
    x_approval_status_tapp.id AS tapp,
    x_approval_status_tapp.name AS tapp_name,
    x_approval_status_tapp.code AS tapp_code,
    trkcodf_additions.trakcode,
    trkcodf_additions.tctype,
    trkcodf_additions.tsubtyp,
    trkcodf_additions.tsoldto,
    trkcodf_additions.tstrdat,
    trkcodf_additions.tstpdat,
    trkcodf_additions.tcqty1,
    trkcodf_additions.tcqty2,
    trkcodf_additions.tcqty3,
    trkcodf_additions.tcqty4,
    trkcodf_additions.tcqty5,
    trkcodf_additions.tcqty6,
    trkcodf_additions.tcqty7,
    trkcodf_additions.tcamt1,
    trkcodf_additions.tcamt2,
    trkcodf_additions.tcamt3,
    trkcodf_additions.tcamt4,
    trkcodf_additions.tcamt5,
    trkcodf_additions.tcamt6,
    trkcodf_additions.tcamt7,
    trkcodf_additions.totord,
    trkcodf_additions.tterm1,
    trkcodf_additions.tterm2,
    trkcodf_additions.tterm3,
    trkcodf_additions.tterm4,
    trkcodf_additions.tterm5,
    trkcodf_additions.tterm6,
    trkcodf_additions.tterm7,
    p_pricing_action_detail_pa.id AS pa,
    p_pricing_action_detail_pa.name AS pa_name,
    p_pricing_action_detail_pa.code AS pa_code,
    p_pricing_region_tfdscd.id AS tfdscd,
    p_pricing_region_tfdscd.name AS tfdscd_name,
    p_pricing_region_tfdscd.code AS tfdscd_code,
    x_validation_valid.id AS valid,
    x_validation_valid.name AS valid_name,
    x_validation_valid.code AS valid_code,
    trkcodf_additions.effdt,
    trkcodf_additions.id,
    trkcodf_additions.updated_by,
    trkcodf_additions.updated_date,
    trkcodf_additions.validationstatus,
    trkcodf_additions.is_valid,
    trkcodf_additions.created_date,
    trkcodf_additions.created_by,
    trkcodf_additions.comment
   FROM ((((trkcodf_additions trkcodf_additions
     LEFT JOIN x_approval_status x_approval_status_tapp ON ((trkcodf_additions.tapp = x_approval_status_tapp.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_pa ON ((trkcodf_additions.pa = p_pricing_action_detail_pa.id)))
     LEFT JOIN x_validation x_validation_valid ON ((trkcodf_additions.valid = x_validation_valid.id)))
     LEFT JOIN p_pricing_region p_pricing_region_tfdscd ON ((trkcodf_additions.tfdscd = p_pricing_region_tfdscd.id)));;

ALTER TABLE public.view_trkcodf_additions
    OWNER TO postgres;