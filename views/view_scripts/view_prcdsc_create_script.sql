-- View: public.view_prcdsc

-- DROP VIEW public.view_prcdsc;

CREATE OR REPLACE VIEW public.view_prcdsc AS
SELECT id,
    name,
    prcsoldt,
    code,
    prcshipt,
    prcbrnd,
    prcprod,
    prcchain,
    prcdscp,
    prcstdt,
    prceddt,
    prcregcd,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM prcdsc prcdsc;;

ALTER TABLE public.view_prcdsc
    OWNER TO postgres;