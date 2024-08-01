-- View: public.view_pricing_changes_planning

-- DROP VIEW public.view_pricing_changes_planning;

CREATE OR REPLACE VIEW public.view_pricing_changes_planning AS
SELECT pricing_changes_planning.part,
    pricing_changes_planning.pcode5,
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
    pricing_changes_planning.cstdcost,
    pricing_changes_planning.corecst,
    pricing_changes_planning.dutycst,
    pricing_changes_planning.frgtcst,
    pricing_changes_planning.mfglabcst,
    pricing_changes_planning.mfgbcst,
    pricing_changes_planning.pckcst,
    pricing_changes_planning.cystdmtl,
    pricing_changes_planning.pcost,
    pricing_changes_planning.pstdcst,
    pricing_changes_planning.pcc,
    pricing_changes_planning.pdc,
    pricing_changes_planning.pfrc,
    pricing_changes_planning.plc,
    pricing_changes_planning.pbc,
    pricing_changes_planning.ppc,
    pricing_changes_planning.pmc,
    p_pricing_action_detail_pamethod.id AS pamethod,
    p_pricing_action_detail_pamethod.name AS pamethod_name,
    p_pricing_action_detail_pamethod.code AS pamethod_code,
    pricing_changes_planning.powner,
    x_segment_type_seg.id AS seg,
    x_segment_type_seg.name AS seg_name,
    x_segment_type_seg.code AS seg_code,
    x_yes_no_flag_regpric.id AS regpric,
    x_yes_no_flag_regpric.name AS regpric_name,
    x_yes_no_flag_regpric.code AS regpric_code,
    x_pricing_method_curprcm.id AS curprcm,
    x_pricing_method_curprcm.name AS curprcm_name,
    x_pricing_method_curprcm.code AS curprcm_code,
    pricing_changes_planning.code,
    pricing_changes_planning.sugclp,
    x_pricing_method_prcmeth.id AS prcmeth,
    x_pricing_method_prcmeth.name AS prcmeth_name,
    x_pricing_method_prcmeth.code AS prcmeth_code,
    pricing_changes_planning.uncap,
    pricing_changes_planning.sugflp,
    pricing_changes_planning.futlist,
    pricing_changes_planning.pi,
    pricing_changes_planning.effdt,
    pricing_changes_planning.appon,
    pricing_changes_planning.propr,
    pricing_changes_planning.prosm,
    p_pricing_region_paowner.id AS paowner,
    p_pricing_region_paowner.name AS paowner_name,
    p_pricing_region_paowner.code AS paowner_code,
    pricing_changes_planning.name,
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
    x_interplant_ninter.id AS ninter,
    x_interplant_ninter.name AS ninter_name,
    x_interplant_ninter.code AS ninter_code,
    x_yes_no_flag_ndomes.id AS ndomes,
    x_yes_no_flag_ndomes.name AS ndomes_name,
    x_yes_no_flag_ndomes.code AS ndomes_code,
    x_yes_no_flag_nkit.id AS nkit,
    x_yes_no_flag_nkit.name AS nkit_name,
    x_yes_no_flag_nkit.code AS nkit_code,
    pricing_changes_planning.curlist,
    pricing_changes_planning.coreprc,
    pricing_changes_planning.warbcst,
    pricing_changes_planning.whburcst,
    pricing_changes_planning.dmarg,
    pricing_changes_planning.curmarg,
    pricing_changes_planning.id,
    pricing_changes_planning.updated_by,
    pricing_changes_planning.updated_date,
    pricing_changes_planning.validationstatus,
    pricing_changes_planning.is_valid,
    pricing_changes_planning.created_date,
    pricing_changes_planning.created_by,
    pricing_changes_planning.comment
   FROM ((((((((((((((((((((((pricing_changes_planning pricing_changes_planning
     LEFT JOIN x_interplant x_interplant_ninter ON ((pricing_changes_planning.ninter = x_interplant_ninter.id)))
     LEFT JOIN x_pricing_method x_pricing_method_curprcm ON ((pricing_changes_planning.curprcm = x_pricing_method_curprcm.id)))
     LEFT JOIN x_approval_status x_approval_status_pmapp ON ((pricing_changes_planning.pmapp = x_approval_status_pmapp.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_nkit ON ((pricing_changes_planning.nkit = x_yes_no_flag_nkit.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_prodcd3 ON ((pricing_changes_planning.prodcd3 = x_product_code_3_digit_prodcd3.id)))
     LEFT JOIN x_segment_type x_segment_type_seg ON ((pricing_changes_planning.seg = x_segment_type_seg.id)))
     LEFT JOIN x_pricing_method x_pricing_method_prcmeth ON ((pricing_changes_planning.prcmeth = x_pricing_method_prcmeth.id)))
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_prodcd1 ON ((pricing_changes_planning.prodcd1 = x_product_code_1_digit_prodcd1.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sysflag ON ((pricing_changes_planning.sysflag = x_yes_no_flag_sysflag.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ndomes ON ((pricing_changes_planning.ndomes = x_yes_no_flag_ndomes.id)))
     LEFT JOIN x_approval_status x_approval_status_paapp ON ((pricing_changes_planning.paapp = x_approval_status_paapp.id)))
     LEFT JOIN p_pricing_region p_pricing_region_regcd ON ((pricing_changes_planning.regcd = p_pricing_region_regcd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_userflag ON ((pricing_changes_planning.userflag = x_yes_no_flag_userflag.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_regpric ON ((pricing_changes_planning.regpric = x_yes_no_flag_regpric.id)))
     LEFT JOIN p_pricing_region p_pricing_region_paowner ON ((pricing_changes_planning.paowner = p_pricing_region_paowner.id)))
     LEFT JOIN x_approval_status x_approval_status_prcmapp ON ((pricing_changes_planning.prcmapp = x_approval_status_prcmapp.id)))
     LEFT JOIN x_approval_status x_approval_status_edapp ON ((pricing_changes_planning.edapp = x_approval_status_edapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmlapp ON ((pricing_changes_planning.pmlapp = x_approval_status_pmlapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmdl1app ON ((pricing_changes_planning.pmdl1app = x_approval_status_pmdl1app.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_pamethod ON ((pricing_changes_planning.pamethod = p_pricing_action_detail_pamethod.id)))
     LEFT JOIN x_approval_status x_approval_status_pdapp ON ((pricing_changes_planning.pdapp = x_approval_status_pdapp.id)))
     LEFT JOIN x_approval_status x_approval_status_pmdl2app ON ((pricing_changes_planning.pmdl2app = x_approval_status_pmdl2app.id)));;

ALTER TABLE public.view_pricing_changes_planning
    OWNER TO postgres;