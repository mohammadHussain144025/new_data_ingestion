-- View: public.view_trkcodmm

-- DROP VIEW public.view_trkcodmm;

CREATE OR REPLACE VIEW public.view_trkcodmm AS
SELECT id,
    name,
    mfdscd,
    code,
    mrakcode,
    mctype,
    msubtyp,
    msoldto,
    mstrdat,
    mstpdat,
    mcqty1,
    mcqty2,
    mcqty3,
    mcqty4,
    mcqty5,
    mcqty6,
    mcqty7,
    motord,
    mterm1,
    mterm2,
    mterm3,
    mterm4,
    mterm5,
    mterm6,
    mterm7,
    mmaxpl,
    mfullp,
    mrdcyn,
    mvendor,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM trkcodmm trkcodmm;;

ALTER TABLE public.view_trkcodmm
    OWNER TO postgres;