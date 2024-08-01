-- View: public.view_trkcodf

-- DROP VIEW public.view_trkcodf;

CREATE OR REPLACE VIEW public.view_trkcodf AS
SELECT id,
    name,
    tfdscd,
    code,
    trakcode,
    tctype,
    tsubtyp,
    tsoldto,
    tstrdat,
    tstpdat,
    tcqty1,
    tcqty2,
    tcqty3,
    tcqty4,
    tcqty5,
    tcqty6,
    tcqty7,
    tcamt1,
    tcamt2,
    tcamt3,
    tcamt4,
    tcamt5,
    tcamt6,
    tcamt7,
    totord,
    tterm1,
    tterm2,
    tterm3,
    tterm4,
    tterm5,
    tterm7,
    tterm6,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM trkcodf trkcodf;;

ALTER TABLE public.view_trkcodf
    OWNER TO postgres;