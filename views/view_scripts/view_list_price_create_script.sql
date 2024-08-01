-- View: public.view_list_price

-- DROP VIEW public.view_list_price;

CREATE OR REPLACE VIEW public.view_list_price AS
SELECT list_price.code,
    list_price.partnum,
    list_price.pcode5,
    list_price.pcode3,
    list_price.pcode1,
    x_segment_type_segment.id AS segment,
    x_segment_type_segment.name AS segment_name,
    x_segment_type_segment.code AS segment_code,
    x_yes_no_flag_rsegflag.id AS rsegflag,
    x_yes_no_flag_rsegflag.name AS rsegflag_name,
    x_yes_no_flag_rsegflag.code AS rsegflag_code,
    x_pricing_method_pmethod.id AS pmethod,
    x_pricing_method_pmethod.name AS pmethod_name,
    x_pricing_method_pmethod.code AS pmethod_code,
    x_yes_no_flag_international.id AS international,
    x_yes_no_flag_international.name AS international_name,
    x_yes_no_flag_international.code AS international_code,
    x_interplant_interorev.id AS interorev,
    x_interplant_interorev.name AS interorev_name,
    x_interplant_interorev.code AS interorev_code,
    x_yes_no_flag_kitflag.id AS kitflag,
    x_yes_no_flag_kitflag.name AS kitflag_name,
    x_yes_no_flag_kitflag.code AS kitflag_code,
    list_price.lpriceus,
    list_price.fromdat,
    list_price.spriceus,
    list_price.uncapprc,
    list_price.lpriceca,
    list_price.lpricel,
    list_price.pricelim,
    list_price.plpus,
    list_price.plpcan,
    list_price.powner,
    list_price.reason,
    list_price.changeby,
    x_approval_status_paapp.id AS paapp,
    x_approval_status_paapp.name AS paapp_name,
    x_approval_status_paapp.code AS paapp_code,
    x_approval_status_pdl1vapp.id AS pdl1vapp,
    x_approval_status_pdl1vapp.name AS pdl1vapp_name,
    x_approval_status_pdl1vapp.code AS pdl1vapp_code,
    x_approval_status_pdl2vapp.id AS pdl2vapp,
    x_approval_status_pdl2vapp.name AS pdl2vapp_name,
    x_approval_status_pdl2vapp.code AS pdl2vapp_code,
    x_approval_status_pmleadap.id AS pmleadap,
    x_approval_status_pmleadap.name AS pmleadap_name,
    x_approval_status_pmleadap.code AS pmleadap_code,
    x_approval_status_pmapp.id AS pmapp,
    x_approval_status_pmapp.name AS pmapp_name,
    x_approval_status_pmapp.code AS pmapp_code,
    x_approval_status_pmaapp.id AS pmaapp,
    x_approval_status_pmaapp.name AS pmaapp_name,
    x_approval_status_pmaapp.code AS pmaapp_code,
    x_approval_status_edapp.id AS edapp,
    x_approval_status_edapp.name AS edapp_name,
    x_approval_status_edapp.code AS edapp_code,
    x_approval_status_pdapp.id AS pdapp,
    x_approval_status_pdapp.name AS pdapp_name,
    x_approval_status_pdapp.code AS pdapp_code,
    x_rejection_reason_rejection_reason.id AS rejection_reason,
    x_rejection_reason_rejection_reason.name AS rejection_reason_name,
    x_rejection_reason_rejection_reason.code AS rejection_reason_code,
    list_price.name,
    list_price.spricecan,
    list_price.costie,
    x_yes_no_flag_apart.id AS apart,
    x_yes_no_flag_apart.name AS apart_name,
    x_yes_no_flag_apart.code AS apart_code,
    list_price.id,
    list_price.updated_by,
    list_price.updated_date,
    list_price.validationstatus,
    list_price.is_valid,
    list_price.created_date,
    list_price.created_by,
    list_price.comment
   FROM ((((((((((((((((list_price list_price
     LEFT JOIN x_segment_type x_segment_type_segment ON ((list_price.segment = x_segment_type_segment.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_rsegflag ON ((list_price.rsegflag = x_yes_no_flag_rsegflag.id)))
     LEFT JOIN x_approval_status x_approval_status_pmapp ON ((list_price.pmapp = x_approval_status_pmapp.id)))
     LEFT JOIN x_interplant x_interplant_interorev ON ((list_price.interorev = x_interplant_interorev.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_apart ON ((list_price.apart = x_yes_no_flag_apart.id)))
     LEFT JOIN x_approval_status x_approval_status_pmleadap ON ((list_price.pmleadap = x_approval_status_pmleadap.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_international ON ((list_price.international = x_yes_no_flag_international.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_kitflag ON ((list_price.kitflag = x_yes_no_flag_kitflag.id)))
     LEFT JOIN x_pricing_method x_pricing_method_pmethod ON ((list_price.pmethod = x_pricing_method_pmethod.id)))
     LEFT JOIN x_approval_status x_approval_status_paapp ON ((list_price.paapp = x_approval_status_paapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl2vapp ON ((list_price.pdl2vapp = x_approval_status_pdl2vapp.id)))
     LEFT JOIN x_rejection_reason x_rejection_reason_rejection_reason ON ((list_price.rejection_reason = x_rejection_reason_rejection_reason.id)))
     LEFT JOIN x_approval_status x_approval_status_pmaapp ON ((list_price.pmaapp = x_approval_status_pmaapp.id)))
     LEFT JOIN x_approval_status x_approval_status_edapp ON ((list_price.edapp = x_approval_status_edapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pdl1vapp ON ((list_price.pdl1vapp = x_approval_status_pdl1vapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pdapp ON ((list_price.pdapp = x_approval_status_pdapp.id)));;

ALTER TABLE public.view_list_price
    OWNER TO postgres;