-- View: public.view_disccode

-- DROP VIEW public.view_disccode;

CREATE OR REPLACE VIEW public.view_disccode AS
SELECT id,
    dcode,
    code,
    name,
    dperct,
    sdate,
    edate,
    reg,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM disccode disccode;;

ALTER TABLE public.view_disccode
    OWNER TO postgres;