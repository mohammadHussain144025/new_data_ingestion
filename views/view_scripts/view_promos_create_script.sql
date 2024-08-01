-- View: public.view_promos

-- DROP VIEW public.view_promos;

CREATE OR REPLACE VIEW public.view_promos AS
SELECT ptrack,
    name,
    code,
    pcust,
    pref,
    pstart,
    pstop,
    ppart,
    pqty1,
    pqty2,
    pqty3,
    pqty4,
    pqty5,
    pqty6,
    pqty7,
    pprc1,
    pprc2,
    pprc3,
    pprc4,
    pprc5,
    pprc6,
    pprc7,
    pdsc1,
    pdsc2,
    pdsc3,
    pdsc4,
    pdsc5,
    pdsc6,
    pdsc7,
    pdate,
    puser,
    prfds,
    trkqty,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM promos promos;;

ALTER TABLE public.view_promos
    OWNER TO postgres;