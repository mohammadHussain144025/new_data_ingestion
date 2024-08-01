-- View: public.view_partdisc

-- DROP VIEW public.view_partdisc;

CREATE OR REPLACE VIEW public.view_partdisc AS
SELECT id,
    name,
    pfds,
    code,
    psoldt,
    ppcode,
    pdisc,
    pstrdt,
    penddt,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM partdisc partdisc;;

ALTER TABLE public.view_partdisc
    OWNER TO postgres;