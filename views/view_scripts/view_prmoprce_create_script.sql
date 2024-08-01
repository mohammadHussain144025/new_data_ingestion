-- View: public.view_prmoprce

-- DROP VIEW public.view_prmoprce;

CREATE OR REPLACE VIEW public.view_prmoprce AS
SELECT id,
    name,
    prmfds,
    code,
    prmcod,
    prmtrk,
    prmlev,
    prmbeg,
    prmend,
    prmadd,
    prmusr,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM prmoprce prmoprce;;

ALTER TABLE public.view_prmoprce
    OWNER TO postgres;