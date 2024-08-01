-- View: public.view_pahist

-- DROP VIEW public.view_pahist;

CREATE OR REPLACE VIEW public.view_pahist AS
SELECT pahist.name,
    pahist.code,
    p_pricing_action_detail_paction.id AS paction,
    p_pricing_action_detail_paction.name AS paction_name,
    p_pricing_action_detail_paction.code AS paction_code,
    pahist.part_num,
    p_pricing_region_rgcd.id AS rgcd,
    p_pricing_region_rgcd.name AS rgcd_name,
    p_pricing_region_rgcd.code AS rgcd_code,
    pahist.creason,
    pahist.oldlp,
    pahist.newlp,
    pahist.effdt,
    x_segment_type_segtyp.id AS segtyp,
    x_segment_type_segtyp.name AS segtyp_name,
    x_segment_type_segtyp.code AS segtyp_code,
    pahist.approver,
    x_role_approval.id AS approval,
    x_role_approval.name AS approval_name,
    x_role_approval.code AS approval_code,
    pahist.powner,
    pahist.pi,
    x_yes_no_flag_rpf.id AS rpf,
    x_yes_no_flag_rpf.name AS rpf_name,
    x_yes_no_flag_rpf.code AS rpf_code,
    x_product_code_3_digit_pcode3.id AS pcode3,
    x_product_code_3_digit_pcode3.name AS pcode3_name,
    x_product_code_3_digit_pcode3.code AS pcode3_code,
    x_product_code_1_digit_pcode1.id AS pcode1,
    x_product_code_1_digit_pcode1.name AS pcode1_name,
    x_product_code_1_digit_pcode1.code AS pcode1_code,
    pahist.sugglp,
    x_pricing_method_pmeth.id AS pmeth,
    x_pricing_method_pmeth.name AS pmeth_name,
    x_pricing_method_pmeth.code AS pmeth_code,
    pahist.id,
    pahist.is_valid,
    pahist.created_date,
    pahist.created_by,
    pahist.updated_date,
    pahist.updated_by,
    pahist.comment
   FROM ((((((((pahist pahist
     LEFT JOIN x_role x_role_approval ON ((pahist.approval = x_role_approval.id)))
     LEFT JOIN p_pricing_region p_pricing_region_rgcd ON ((pahist.rgcd = p_pricing_region_rgcd.id)))
     LEFT JOIN x_product_code_1_digit x_product_code_1_digit_pcode1 ON ((pahist.pcode1 = x_product_code_1_digit_pcode1.id)))
     LEFT JOIN x_pricing_method x_pricing_method_pmeth ON ((pahist.pmeth = x_pricing_method_pmeth.id)))
     LEFT JOIN x_segment_type x_segment_type_segtyp ON ((pahist.segtyp = x_segment_type_segtyp.id)))
     LEFT JOIN x_product_code_3_digit x_product_code_3_digit_pcode3 ON ((pahist.pcode3 = x_product_code_3_digit_pcode3.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_rpf ON ((pahist.rpf = x_yes_no_flag_rpf.id)))
     LEFT JOIN p_pricing_action_detail p_pricing_action_detail_paction ON ((pahist.paction = p_pricing_action_detail_paction.id)));;

ALTER TABLE public.view_pahist
    OWNER TO postgres;