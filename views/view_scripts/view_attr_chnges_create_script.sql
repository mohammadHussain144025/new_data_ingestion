-- View: public.view_attr_chnges

-- DROP VIEW public.view_attr_chnges;

CREATE OR REPLACE VIEW public.view_attr_chnges AS
SELECT part_num,
    code,
    name,
    prod_cd5,
    fran_code,
    add_dt,
    to_date,
    prod_cd3,
    prod_cd1,
    brnd_cd,
    rgcd,
    obrnd,
    ofran,
    oprod_cd5,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM attr_chnges attr_chnges;;

ALTER TABLE public.view_attr_chnges
    OWNER TO postgres;