-- View: public.view_invoice

-- DROP VIEW public.view_invoice;

CREATE OR REPLACE VIEW public.view_invoice AS
SELECT id,
    name,
    code,
    a1,
    b1,
    is_valid,
    created_date,
    created_by,
    updated_date,
    updated_by,
    comment
   FROM invoice invoice;;

ALTER TABLE public.view_invoice
    OWNER TO postgres;