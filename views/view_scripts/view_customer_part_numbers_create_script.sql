-- View: public.view_customer_part_numbers

-- DROP VIEW public.view_customer_part_numbers;

CREATE OR REPLACE VIEW public.view_customer_part_numbers AS
SELECT x_customer_xref_tfcusxrf.id AS tfcusxrf,
    x_customer_xref_tfcusxrf.name AS tfcusxrf_name,
    x_customer_xref_tfcusxrf.code AS tfcusxrf_code,
    customer_part_numbers.xfmcar,
    customer_part_numbers.code,
    customer_part_numbers.name,
    customer_part_numbers.xcuscd,
    customer_part_numbers.xdesc,
    customer_part_numbers.cpalqt,
    customer_part_numbers.xrfptno,
    customer_part_numbers.cmstqt,
    customer_part_numbers.ukgspc,
    customer_part_numbers.cuntuk,
    customer_part_numbers.xdiskno,
    customer_part_numbers.repack,
    customer_part_numbers.xricno,
    customer_part_numbers.xstat,
    customer_part_numbers.xdate,
    customer_part_numbers.rgcd,
    customer_part_numbers.id,
    customer_part_numbers.updated_by,
    customer_part_numbers.updated_date,
    customer_part_numbers.validationstatus,
    customer_part_numbers.is_valid,
    customer_part_numbers.created_date,
    customer_part_numbers.created_by,
    customer_part_numbers.comment
   FROM (customer_part_numbers customer_part_numbers
     LEFT JOIN x_customer_xref x_customer_xref_tfcusxrf ON ((customer_part_numbers.tfcusxrf = x_customer_xref_tfcusxrf.id)));;

ALTER TABLE public.view_customer_part_numbers
    OWNER TO postgres;