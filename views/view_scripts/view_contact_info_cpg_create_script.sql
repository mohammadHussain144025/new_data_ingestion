-- View: public.view_contact_info_cpg

-- DROP VIEW public.view_contact_info_cpg;

CREATE OR REPLACE VIEW public.view_contact_info_cpg AS
SELECT code,
    name,
    ccode,
    cn,
    email,
    ccmnt,
    sendpricefile,
    id,
    updated_by,
    updated_date,
    validationstatus,
    is_valid,
    created_date,
    created_by,
    comment
   FROM contact_info_cpg contact_info_cpg;;

ALTER TABLE public.view_contact_info_cpg
    OWNER TO postgres;