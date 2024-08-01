-- View: public.view_local_pricing

-- DROP VIEW public.view_local_pricing;

CREATE OR REPLACE VIEW public.view_local_pricing AS
SELECT local_pricing.part,
    local_pricing.pcode5,
    x_product_code_3_digit_prodcd3.id AS prodcd3,
    x_product_code_3_digit_prodcd3.name AS prodcd3_name,
    x_product_code_3_digit_prodcd3.code AS prodcd3_code,
    x_product_code_1_digit_prodcd1.id AS prodcd1,
    x_product_code_1_digit_prodcd1.name AS prodcd1_name,
    x_product_code_1_digit_prodcd1.code AS prodcd1_code,
    p_pricing_region_regcd.id AS regcd,
    p_pricing_region_regcd.name AS regcd_name,
    p_pricing_region_regcd.code AS regcd_code,
    x_yes_no_flag_sysflag.id AS sysflag,
    x_yes_no_flag_sysflag.name AS sysflag_name,
    x_yes_no_flag_sysflag.code AS sysflag_code,
    x_yes_no_flag_userflag.id AS userflag,
    x_yes_no_flag_userflag.name AS userflag_name,
    x_yes_no_flag_userflag.code AS userflag_code,
    local_pricing.cstdcost,
    local_pricing.corecst,
    local_pricing.dutycst,
    local_pricing.frgtcst,
    local_pricing.mfglabcst,
    local_pricing.mfgbcst,
    local_pricing.pckcst,
    local_pricing.cystdmtl,
    local_pricing.pcost,
    local_pricing.pstdcst,
    local_pricing.pcc,
    local_pricing.pdc,
    local_pricing.pfrc,
    local_pricing.plc,
    local_pricing.pbc,
    local_pricing.ppc,
    local_pricing.pmc,
    p_pricing_action_detail_pamethod.id AS pamethod,
    p_pricing_action_detail_pamethod.name AS pamethod_name,
    p_pricing_action_detail_pamethod.code AS pamethod_code,
    local_pricing.powner,
    x_segment_type_seg.id AS seg,
    x_segment_type_seg.name AS seg_name,
    x_segment_type_seg.code AS seg_code,
    x_yes_no_flag_regpric.id AS regpric,
    x_yes_no_flag_regpric.name AS regpric_name,
    x_yes_no_flag_regpric.code AS regpric_code,
    x_pricing_method_curprcm.id AS curprcm,
    x_pricing_method_curprcm.name AS curprcm_name,
    x_pricing_method_curprcm.code AS curprcm_code,
    local_pricing.curlist,
    local_pricing.code,
    local_pricing.sugclp,
    x_pricing_method_prcmeth.id AS prcmeth,
    x_pricing_method_prcmeth.name AS prcmeth_name,
    x_pricing_method_prcmeth.code AS prcmeth_code,
    local_pricing.uncap,
    local_pricing.sugflp,
    local_pricing.futlist,
    local_pricing.pi,
    local_pricing.effdt,
    local_pricing.appon,
    local_pricing.propr,
    local_pricing.prosm,
    p_pricing_region_paowner.id AS paowner,
    p_pricing_region_paowner.name AS paowner_name,
    p_pricing_region_paowner.code AS paowner_code,
    local_pricing.name,
    x_approval_status_paapp.id AS paapp,
    x_approval_status_paapp.name AS paapp_name,
    x_approval_status_paapp.code AS paapp_code,
    x_approval_status_pmapp.id AS pmapp,
    x_approval_status_pmapp.name AS pmapp_name,
    x_approval_status_pmapp.code AS pmapp_code,
    x_approval_status_pmlapp.id AS pmlapp,
    x_approval_status_pmlapp.name AS pmlapp_name,
    x_approval_status_pmlapp.code AS pmlapp_code,
    x_approval_status_prcmapp.id AS prcmapp,
    x_approval_status_prcmapp.name AS prcmapp_name,
    x_approval_status_prcmapp.code AS prcmapp_code,
    x_approval_status_pdapp.id AS pdapp,
    x_approval_status_pdapp.name AS pdapp_name,
    x_approval_status_pdapp.code AS pdapp_code,
    x_approval_status_pmdl1app.id AS pmdl1app,
    x_approval_status_pmdl1app.name AS pmdl1app_name,
    x_approval_status_pmdl1app.code AS pmdl1app_code,
    x_approval_status_pmdl2app.id AS pmdl2app,
    x_approval_status_pmdl2app.name AS pmdl2app_name,
    x_approval_status_pmdl2app.code AS pmdl2app_code,
    x_approval_status_edapp.id AS edapp,
    x_approval_status_edapp.name AS edapp_name,
    x_approval_status_edapp.code AS edapp_code,
    local_pricing.coreprc,
    local_pricing.whburcst,
    local_pricing.warbcst,
    local_pricing.dmarg,
    x_interplant_ninter.id AS ninter,
    x_interplant_ninter.name AS ninter_name,
    x_interplant_ninter.code AS ninter_code,
    x_yes_no_flag_ndomes.id AS ndomes,
    x_yes_no_flag_ndomes.name AS ndomes_name,
    x_yes_no_flag_ndomes.code AS ndomes_code,
    x_yes_no_flag_nkit.id AS nkit,
    x_yes_no_flag_nkit.name AS nkit_name,
    x_yes_no_flag_nkit.code AS nkit_code,
    local_pricing.curmarg,
    local_pricing.id,
    local_pricing.updated_by,
    local_pricing.updated_date,
    local_pricing.validationstatus,
    local_pricing.is_valid,
    local_pricing.created_date,
    local_pricing.created_by,
    local_pricing.comment
   FROM ((((((((((((((((((((((local_pricing local_pricing
     LEFT JOIN x_interplant x_interplant_ninter ON ((local_pricing.ninter = x_interplant_ninter.id)))
     LEFT JOIN x_pricing_method x_pricing_method_curprcm ON ((local_pricing.curprcm = x_pricing_method_curprcm.id)))
     LEFT JOIN x_approval_status x_approval_status_pmapp ON ((local_pricing.pmapp = x_approval_status_pmapp.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_nkit ON ((local_pricing.nkit = x_yes_no_flag_nkit.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_prodcd3 ON ((local_pricing.prodcd3 = x_product_code_3_digit_prodcd3.id)))
     LEFT JOIN x_segment_type x_segment_type_seg ON ((local_pricing.seg = x_segment_type_seg.id)))
     LEFT JOIN x_pricing_method x_pricing_method_prcmeth ON ((local_pricing.prcmeth = x_pricing_method_prcmeth.id)))
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_prodcd1 ON ((local_pricing.prodcd1 = x_product_code_1_digit_prodcd1.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sysflag ON ((local_pricing.sysflag = x_yes_no_flag_sysflag.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ndomes ON ((local_pricing.ndomes = x_yes_no_flag_ndomes.id)))
     LEFT JOIN x_approval_status x_approval_status_paapp ON ((local_pricing.paapp = x_approval_status_paapp.id)))
     LEFT JOIN p_pricing_region p_pricing_region_regcd ON ((local_pricing.regcd = p_pricing_region_regcd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_userflag ON ((local_pricing.userflag = x_yes_no_flag_userflag.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_regpric ON ((local_pricing.regpric = x_yes_no_flag_regpric.id)))
     LEFT JOIN p_pricing_region p_pricing_region_paowner ON ((local_pricing.paowner = p_pricing_region_paowner.id)))
     LEFT JOIN x_approval_status x_approval_status_prcmapp ON ((local_pricing.prcmapp = x_approval_status_prcmapp.id)))
     LEFT JOIN x_approval_status x_approval_status_edapp ON ((local_pricing.edapp = x_approval_status_edapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmlapp ON ((local_pricing.pmlapp = x_approval_status_pmlapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmdl1app ON ((local_pricing.pmdl1app = x_approval_status_pmdl1app.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_pamethod ON ((local_pricing.pamethod = p_pricing_action_detail_pamethod.id)))
     LEFT JOIN x_approval_status x_approval_status_pdapp ON ((local_pricing.pdapp = x_approval_status_pdapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmdl2app ON ((local_pricing.pmdl2app = x_approval_status_pmdl2app.id)));;

ALTER TABLE public.view_local_pricing
    OWNER TO postgres;