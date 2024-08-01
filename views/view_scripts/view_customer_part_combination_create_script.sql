-- View: public.view_customer_part_combination

-- DROP VIEW public.view_customer_part_combination;

CREATE OR REPLACE VIEW public.view_customer_part_combination AS
SELECT DISTINCT p.part_num AS part_number,
    p.fran_code AS franchise_code,
    f.fdscd AS region,
    c.custid_d AS customer_description,
    c.custid AS customer,
    p.lprc AS list_price
   FROM ((part_regional p
     LEFT JOIN franchise_code_map f ON ((f.frchdisp = (p.fran_code)::bigint)))
     LEFT JOIN customer c ON (((f.fsoldt)::text = (c.custid)::text)))
  WHERE (((c.custsts)::text = 'A'::text) AND (p.lprc > (0)::numeric));;

ALTER TABLE public.view_customer_part_combination
    OWNER TO postgres;