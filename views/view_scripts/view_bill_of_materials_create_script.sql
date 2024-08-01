-- View: public.view_bill_of_materials

-- DROP VIEW public.view_bill_of_materials;

CREATE OR REPLACE VIEW public.view_bill_of_materials AS
SELECT code,
    name,
    assemb,
    lineno,
    compnt,
    comst,
    comqty,
    crtdat,
    revdat,
    revnum,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM bill_of_materials bill_of_materials;;

ALTER TABLE public.view_bill_of_materials
    OWNER TO postgres;