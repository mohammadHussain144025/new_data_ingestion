-- View: public.view_customer

-- DROP VIEW public.view_customer;

CREATE OR REPLACE VIEW public.view_customer AS
SELECT x_chain_chainc.id AS chainc,
    x_chain_chainc.name AS chainc_name,
    x_chain_chainc.code AS chainc_code,
    x_channel_chnl.id AS chnl,
    x_channel_chnl.name AS chnl_name,
    x_channel_chnl.code AS chnl_code,
    customer.cbseg,
    x_customer_group_grp.id AS grp,
    x_customer_group_grp.name AS grp_name,
    x_customer_group_grp.code AS grp_code,
    x_customer_main_group_mngrp.id AS mngrp,
    x_customer_main_group_mngrp.name AS mngrp_name,
    x_customer_main_group_mngrp.code AS mngrp_code,
    customer.subgrp_d,
    customer.mngrp_d,
    customer.shpto_d,
    customer.chaind,
    customer.chnldesc,
    customer.grp_d,
    customer.custid,
    customer.name,
    customer.code,
    customer.custid_d,
    customer.custsts,
    customer.csubtype,
    customer.ctype,
    customer.export,
    customer.fds,
    customer.pdcflag,
    customer.sales,
    customer.bgrp,
    customer.cprog,
    customer.cdisccd,
    customer.cdiscp,
    customer.curr,
    customer.subgrp,
    customer.cusgrp,
    customer.region,
    customer.catcd,
    customer.geo,
    customer.xrefcd,
    customer.housef,
    customer.mkupf,
    customer.mercf,
    customer.discf,
    customer.euccf,
    customer.eucprcl,
    customer.mmexcl,
    customer.sldtod,
    customer.shpto,
    customer.sldto,
    customer.mmbygrp,
    customer.id,
    customer.updated_by,
    customer.updated_date,
    customer.validationstatus,
    customer.is_valid,
    customer.created_date,
    customer.created_by,
    customer.comment
   FROM ((((customer customer
     LEFT JOIN x_customer_group x_customer_group_grp ON ((customer.grp = x_customer_group_grp.id)))
     LEFT JOIN x_chain x_chain_chainc ON ((customer.chainc = x_chain_chainc.id)))
     LEFT JOIN x_customer_main_group x_customer_main_group_mngrp ON ((customer.mngrp = x_customer_main_group_mngrp.id)))
     LEFT JOIN x_channel x_channel_chnl ON ((customer.chnl = x_channel_chnl.id)));;

ALTER TABLE public.view_customer
    OWNER TO postgres;