-- View: public.view_supplier

-- DROP VIEW public.view_supplier;

CREATE OR REPLACE VIEW public.view_supplier AS
SELECT supplier.name,
    supplier.vastat,
    supplier.code,
    supplier.vacode,
    supplier.vaname,
    supplier.vaadr1,
    supplier.vaadr2,
    supplier.vcity,
    supplier.vstate,
    supplier.vzip,
    supplier.vcntct,
    supplier.vaactr,
    supplier.vphone,
    supplier.vreltp,
    supplier.vndtyp,
    x_interplant_inter.id AS inter,
    x_interplant_inter.name AS inter_name,
    x_interplant_inter.code AS inter_code,
    x_yes_no_flag_dom.id AS dom,
    x_yes_no_flag_dom.name AS dom_name,
    x_yes_no_flag_dom.code AS dom_code,
    supplier.rgcd,
    supplier.id,
    supplier.updated_by,
    supplier.updated_date,
    supplier.validationstatus,
    supplier.is_valid,
    supplier.created_date,
    supplier.created_by,
    supplier.comment
   FROM ((supplier supplier
     LEFT JOIN x_interplant x_interplant_inter ON ((supplier.inter = x_interplant_inter.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_dom ON ((supplier.dom = x_yes_no_flag_dom.id)));;

ALTER TABLE public.view_supplier
    OWNER TO postgres;