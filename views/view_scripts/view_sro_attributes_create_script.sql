-- View: public.view_sro_attributes

-- DROP VIEW public.view_sro_attributes;

CREATE OR REPLACE VIEW public.view_sro_attributes AS
SELECT x_yes_no_flag_app.id AS app,
    x_yes_no_flag_app.name AS app_name,
    x_yes_no_flag_app.code AS app_code,
    x_yes_no_flag_axleapp.id AS axleapp,
    x_yes_no_flag_axleapp.name AS axleapp_name,
    x_yes_no_flag_axleapp.code AS axleapp_code,
    x_yes_no_flag_axlemod.id AS axlemod,
    x_yes_no_flag_axlemod.name AS axlemod_name,
    x_yes_no_flag_axlemod.code AS axlemod_code,
    x_yes_no_flag_axleser.id AS axleser,
    x_yes_no_flag_axleser.name AS axleser_name,
    x_yes_no_flag_axleser.code AS axleser_code,
    x_yes_no_flag_bpw.id AS bpw,
    x_yes_no_flag_bpw.name AS bpw_name,
    x_yes_no_flag_bpw.code AS bpw_code,
    x_yes_no_flag_beardm.id AS beardm,
    x_yes_no_flag_beardm.name AS beardm_name,
    x_yes_no_flag_beardm.code AS beardm_code,
    sro_attributes.code,
    sro_attributes.name,
    sro_attributes.incl,
    sro_attributes.decl,
    x_yes_no_flag_bodydm.id AS bodydm,
    x_yes_no_flag_bodydm.name AS bodydm_name,
    x_yes_no_flag_bodydm.code AS bodydm_code,
    x_yes_no_flag_bcd.id AS bcd,
    x_yes_no_flag_bcd.name AS bcd_name,
    x_yes_no_flag_bcd.code AS bcd_code,
    x_yes_no_flag_bhd.id AS bhd,
    x_yes_no_flag_bhd.name AS bhd_name,
    x_yes_no_flag_bhd.code AS bhd_code,
    x_yes_no_flag_bore.id AS bore,
    x_yes_no_flag_bore.name AS bore_name,
    x_yes_no_flag_bore.code AS bore_code,
    x_yes_no_flag_brakesz.id AS brakesz,
    x_yes_no_flag_brakesz.name AS brakesz_name,
    x_yes_no_flag_brakesz.code AS brakesz_code,
    x_yes_no_flag_brtype.id AS brtype,
    x_yes_no_flag_brtype.name AS brtype_name,
    x_yes_no_flag_brtype.code AS brtype_code,
    x_yes_no_flag_brand.id AS brand,
    x_yes_no_flag_brand.name AS brand_name,
    x_yes_no_flag_brand.code AS brand_code,
    x_yes_no_flag_bushtype.id AS bushtype,
    x_yes_no_flag_bushtype.name AS bushtype_name,
    x_yes_no_flag_bushtype.code AS bushtype_code,
    x_yes_no_flag_cssc.id AS cssc,
    x_yes_no_flag_cssc.name AS cssc_name,
    x_yes_no_flag_cssc.code AS cssc_code,
    x_yes_no_flag_ctype.id AS ctype,
    x_yes_no_flag_ctype.name AS ctype_name,
    x_yes_no_flag_ctype.code AS ctype_code,
    x_yes_no_flag_cte.id AS cte,
    x_yes_no_flag_cte.name AS cte_name,
    x_yes_no_flag_cte.code AS cte_code,
    x_yes_no_flag_ctelen.id AS ctelen,
    x_yes_no_flag_ctelen.name AS ctelen_name,
    x_yes_no_flag_ctelen.code AS ctelen_code,
    x_yes_no_flag_chmbrty.id AS chmbrty,
    x_yes_no_flag_chmbrty.name AS chmbrty_name,
    x_yes_no_flag_chmbrty.code AS chmbrty_code,
    x_yes_no_flag_class.id AS class,
    x_yes_no_flag_class.name AS class_name,
    x_yes_no_flag_class.code AS class_code,
    x_yes_no_flag_clutch.id AS clutch,
    x_yes_no_flag_clutch.name AS clutch_name,
    x_yes_no_flag_clutch.code AS clutch_code,
    x_yes_no_flag_collst.id AS collst,
    x_yes_no_flag_collst.name AS collst_name,
    x_yes_no_flag_collst.code AS collst_code,
    x_yes_no_flag_colllen.id AS colllen,
    x_yes_no_flag_colllen.name AS colllen_name,
    x_yes_no_flag_colllen.code AS colllen_code,
    x_yes_no_flag_compty.id AS compty,
    x_yes_no_flag_compty.name AS compty_name,
    x_yes_no_flag_compty.code AS compty_code,
    x_yes_no_flag_conntype.id AS conntype,
    x_yes_no_flag_conntype.name AS conntype_name,
    x_yes_no_flag_conntype.code AS conntype_code,
    x_yes_no_flag_convst.id AS convst,
    x_yes_no_flag_convst.name AS convst_name,
    x_yes_no_flag_convst.code AS convst_code,
    x_yes_no_flag_crosslen.id AS crosslen,
    x_yes_no_flag_crosslen.name AS crosslen_name,
    x_yes_no_flag_crosslen.code AS crosslen_code,
    x_yes_no_flag_efflen.id AS efflen,
    x_yes_no_flag_efflen.name AS efflen_name,
    x_yes_no_flag_efflen.code AS efflen_code,
    x_yes_no_flag_exlen.id AS exlen,
    x_yes_no_flag_exlen.name AS exlen_name,
    x_yes_no_flag_exlen.code AS exlen_code,
    x_yes_no_flag_flngdm.id AS flngdm,
    x_yes_no_flag_flngdm.name AS flngdm_name,
    x_yes_no_flag_flngdm.code AS flngdm_code,
    x_yes_no_flag_fmsi.id AS fmsi,
    x_yes_no_flag_fmsi.name AS fmsi_name,
    x_yes_no_flag_fmsi.code AS fmsi_code,
    x_yes_no_flag_frictmix.id AS frictmix,
    x_yes_no_flag_frictmix.name AS frictmix_name,
    x_yes_no_flag_frictmix.code AS frictmix_code,
    x_yes_no_flag_gawr.id AS gawr,
    x_yes_no_flag_gawr.name AS gawr_name,
    x_yes_no_flag_gawr.code AS gawr_code,
    x_yes_no_flag_genafter.id AS genafter,
    x_yes_no_flag_genafter.name AS genafter_name,
    x_yes_no_flag_genafter.code AS genafter_code,
    x_yes_no_flag_grade.id AS grade,
    x_yes_no_flag_grade.name AS grade_name,
    x_yes_no_flag_grade.code AS grade_code,
    x_yes_no_flag_headsty.id AS headsty,
    x_yes_no_flag_headsty.name AS headsty_name,
    x_yes_no_flag_headsty.code AS headsty_code,
    x_yes_no_flag_headty.id AS headty,
    x_yes_no_flag_headty.name AS headty_name,
    x_yes_no_flag_headty.code AS headty_code,
    x_yes_no_flag_hubsty.id AS hubsty,
    x_yes_no_flag_hubsty.name AS hubsty_name,
    x_yes_no_flag_hubsty.code AS hubsty_code,
    x_yes_no_flag_hubtype.id AS hubtype,
    x_yes_no_flag_hubtype.name AS hubtype_name,
    x_yes_no_flag_hubtype.code AS hubtype_code,
    x_yes_no_flag_hubcaps.id AS hubcaps,
    x_yes_no_flag_hubcaps.name AS hubcaps_name,
    x_yes_no_flag_hubcaps.code AS hubcaps_code,
    x_yes_no_flag_indnum.id AS indnum,
    x_yes_no_flag_indnum.name AS indnum_name,
    x_yes_no_flag_indnum.code AS indnum_code,
    x_yes_no_flag_isdm.id AS isdm,
    x_yes_no_flag_isdm.name AS isdm_name,
    x_yes_no_flag_isdm.code AS isdm_code,
    x_yes_no_flag_indm.id AS indm,
    x_yes_no_flag_indm.name AS indm_name,
    x_yes_no_flag_indm.code AS indm_code,
    x_yes_no_flag_kpdm.id AS kpdm,
    x_yes_no_flag_kpdm.name AS kpdm_name,
    x_yes_no_flag_kpdm.code AS kpdm_code,
    x_yes_no_flag_kplen.id AS kplen,
    x_yes_no_flag_kplen.name AS kplen_name,
    x_yes_no_flag_kplen.code AS kplen_code,
    x_yes_no_flag_kptype.id AS kptype,
    x_yes_no_flag_kptype.name AS kptype_name,
    x_yes_no_flag_kptype.code AS kptype_code,
    x_yes_no_flag_ltapdm.id AS ltapdm,
    x_yes_no_flag_ltapdm.name AS ltapdm_name,
    x_yes_no_flag_ltapdm.code AS ltapdm_code,
    x_yes_no_flag_lorr.id AS lorr,
    x_yes_no_flag_lorr.name AS lorr_name,
    x_yes_no_flag_lorr.code AS lorr_code,
    x_yes_no_flag_len.id AS len,
    x_yes_no_flag_len.name AS len_name,
    x_yes_no_flag_len.code AS len_code,
    x_yes_no_flag_lrank.id AS lrank,
    x_yes_no_flag_lrank.name AS lrank_name,
    x_yes_no_flag_lrank.code AS lrank_code,
    x_yes_no_flag_loorunlo.id AS loorunlo,
    x_yes_no_flag_loorunlo.name AS loorunlo_name,
    x_yes_no_flag_loorunlo.code AS loorunlo_code,
    x_yes_no_flag_model.id AS model,
    x_yes_no_flag_model.name AS model_name,
    x_yes_no_flag_model.code AS model_code,
    x_yes_no_flag_norrem.id AS norrem,
    x_yes_no_flag_norrem.name AS norrem_name,
    x_yes_no_flag_norrem.code AS norrem_code,
    x_yes_no_flag_noaxles.id AS noaxles,
    x_yes_no_flag_noaxles.name AS noaxles_name,
    x_yes_no_flag_noaxles.code AS noaxles_code,
    x_yes_no_flag_nospline.id AS nospline,
    x_yes_no_flag_nospline.name AS nospline_name,
    x_yes_no_flag_nospline.code AS nospline_code,
    x_yes_no_flag_oeman.id AS oeman,
    x_yes_no_flag_oeman.name AS oeman_name,
    x_yes_no_flag_oeman.code AS oeman_code,
    x_yes_no_flag_oem.id AS oem,
    x_yes_no_flag_oem.name AS oem_name,
    x_yes_no_flag_oem.code AS oem_code,
    x_yes_no_flag_odm.id AS odm,
    x_yes_no_flag_odm.name AS odm_name,
    x_yes_no_flag_odm.code AS odm_code,
    x_yes_no_flag_odmmm.id AS odmmm,
    x_yes_no_flag_odmmm.name AS odmmm_name,
    x_yes_no_flag_odmmm.code AS odmmm_code,
    x_yes_no_flag_oasslen.id AS oasslen,
    x_yes_no_flag_oasslen.name AS oasslen_name,
    x_yes_no_flag_oasslen.code AS oasslen_code,
    x_yes_no_flag_ptype.id AS ptype,
    x_yes_no_flag_ptype.name AS ptype_name,
    x_yes_no_flag_ptype.code AS ptype_code,
    x_yes_no_flag_position.id AS "position",
    x_yes_no_flag_position.name AS position_name,
    x_yes_no_flag_position.code AS position_code,
    x_yes_no_flag_ratio.id AS ratio,
    x_yes_no_flag_ratio.name AS ratio_name,
    x_yes_no_flag_ratio.code AS ratio_code,
    x_yes_no_flag_roddm.id AS roddm,
    x_yes_no_flag_roddm.name AS roddm_name,
    x_yes_no_flag_roddm.code AS roddm_code,
    x_yes_no_flag_sensor.id AS sensor,
    x_yes_no_flag_sensor.name AS sensor_name,
    x_yes_no_flag_sensor.code AS sensor_code,
    x_yes_no_flag_series.id AS series,
    x_yes_no_flag_series.name AS series_name,
    x_yes_no_flag_series.code AS series_code,
    x_yes_no_flag_singletr.id AS singletr,
    x_yes_no_flag_singletr.name AS singletr_name,
    x_yes_no_flag_singletr.code AS singletr_code,
    x_yes_no_flag_ssc.id AS ssc,
    x_yes_no_flag_ssc.name AS ssc_name,
    x_yes_no_flag_ssc.code AS ssc_code,
    x_yes_no_flag_stapdm.id AS stapdm,
    x_yes_no_flag_stapdm.name AS stapdm_name,
    x_yes_no_flag_stapdm.code AS stapdm_code,
    x_yes_no_flag_spintype.id AS spintype,
    x_yes_no_flag_spintype.name AS spintype_name,
    x_yes_no_flag_spintype.code AS spintype_code,
    x_yes_no_flag_spldm.id AS spldm,
    x_yes_no_flag_spldm.name AS spldm_name,
    x_yes_no_flag_spldm.code AS spldm_code,
    x_yes_no_flag_splen.id AS splen,
    x_yes_no_flag_splen.name AS splen_name,
    x_yes_no_flag_splen.code AS splen_code,
    x_yes_no_flag_sctre.id AS sctre,
    x_yes_no_flag_sctre.name AS sctre_name,
    x_yes_no_flag_sctre.code AS sctre_code,
    x_yes_no_flag_sthrddm.id AS sthrddm,
    x_yes_no_flag_sthrddm.name AS sthrddm_name,
    x_yes_no_flag_sthrddm.code AS sthrddm_code,
    x_yes_no_flag_style.id AS style,
    x_yes_no_flag_style.name AS style_name,
    x_yes_no_flag_style.code AS style_code,
    x_yes_no_flag_sysconfg.id AS sysconfg,
    x_yes_no_flag_sysconfg.name AS sysconfg_name,
    x_yes_no_flag_sysconfg.code AS sysconfg_code,
    x_yes_no_flag_taplen.id AS taplen,
    x_yes_no_flag_taplen.name AS taplen_name,
    x_yes_no_flag_taplen.code AS taplen_code,
    x_yes_no_flag_teeth.id AS teeth,
    x_yes_no_flag_teeth.name AS teeth_name,
    x_yes_no_flag_teeth.code AS teeth_code,
    x_yes_no_flag_sc4thick.id AS sc4thick,
    x_yes_no_flag_sc4thick.name AS sc4thick_name,
    x_yes_no_flag_sc4thick.code AS sc4thick_code,
    x_yes_no_flag_toolt.id AS toolt,
    x_yes_no_flag_toolt.name AS toolt_name,
    x_yes_no_flag_toolt.code AS toolt_code,
    x_yes_no_flag_torque.id AS torque,
    x_yes_no_flag_torque.name AS torque_name,
    x_yes_no_flag_torque.code AS torque_code,
    x_yes_no_flag_tubtype.id AS tubtype,
    x_yes_no_flag_tubtype.name AS tubtype_name,
    x_yes_no_flag_tubtype.code AS tubtype_code,
    x_yes_no_flag_tubodm.id AS tubodm,
    x_yes_no_flag_tubodm.name AS tubodm_name,
    x_yes_no_flag_tubodm.code AS tubodm_code,
    x_yes_no_flag_type.id AS type,
    x_yes_no_flag_type.name AS type_name,
    x_yes_no_flag_type.code AS type_code,
    x_yes_no_flag_type1.id AS type1,
    x_yes_no_flag_type1.name AS type1_name,
    x_yes_no_flag_type1.code AS type1_code,
    x_yes_no_flag_trotor.id AS trotor,
    x_yes_no_flag_trotor.name AS trotor_name,
    x_yes_no_flag_trotor.code AS trotor_code,
    x_yes_no_flag_ewalltk.id AS ewalltk,
    x_yes_no_flag_ewalltk.name AS ewalltk_name,
    x_yes_no_flag_ewalltk.code AS ewalltk_code,
    x_yes_no_flag_ykdim.id AS ykdim,
    x_yes_no_flag_ykdim.name AS ykdim_name,
    x_yes_no_flag_ykdim.code AS ykdim_code,
    x_yes_no_flag_ydimae.id AS ydimae,
    x_yes_no_flag_ydimae.name AS ydimae_name,
    x_yes_no_flag_ydimae.code AS ydimae_code,
    sro_attributes.id,
    sro_attributes.updated_by,
    sro_attributes.updated_date,
    sro_attributes.validationstatus,
    sro_attributes.is_valid,
    sro_attributes.created_date,
    sro_attributes.created_by,
    sro_attributes.comment
   FROM (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((sro_attributes sro_attributes
     LEFT JOIN x_yes_no_flag x_yes_no_flag_efflen ON ((sro_attributes.efflen = x_yes_no_flag_efflen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_oasslen ON ((sro_attributes.oasslen = x_yes_no_flag_oasslen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_genafter ON ((sro_attributes.genafter = x_yes_no_flag_genafter.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ptype ON ((sro_attributes.ptype = x_yes_no_flag_ptype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_fmsi ON ((sro_attributes.fmsi = x_yes_no_flag_fmsi.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_axleser ON ((sro_attributes.axleser = x_yes_no_flag_axleser.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_app ON ((sro_attributes.app = x_yes_no_flag_app.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_convst ON ((sro_attributes.convst = x_yes_no_flag_convst.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_cte ON ((sro_attributes.cte = x_yes_no_flag_cte.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_toolt ON ((sro_attributes.toolt = x_yes_no_flag_toolt.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_len ON ((sro_attributes.len = x_yes_no_flag_len.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_tubtype ON ((sro_attributes.tubtype = x_yes_no_flag_tubtype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_crosslen ON ((sro_attributes.crosslen = x_yes_no_flag_crosslen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_brakesz ON ((sro_attributes.brakesz = x_yes_no_flag_brakesz.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_lrank ON ((sro_attributes.lrank = x_yes_no_flag_lrank.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_hubtype ON ((sro_attributes.hubtype = x_yes_no_flag_hubtype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_lorr ON ((sro_attributes.lorr = x_yes_no_flag_lorr.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ctype ON ((sro_attributes.ctype = x_yes_no_flag_ctype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ctelen ON ((sro_attributes.ctelen = x_yes_no_flag_ctelen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_flngdm ON ((sro_attributes.flngdm = x_yes_no_flag_flngdm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_frictmix ON ((sro_attributes.frictmix = x_yes_no_flag_frictmix.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_exlen ON ((sro_attributes.exlen = x_yes_no_flag_exlen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_trotor ON ((sro_attributes.trotor = x_yes_no_flag_trotor.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_series ON ((sro_attributes.series = x_yes_no_flag_series.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_type1 ON ((sro_attributes.type1 = x_yes_no_flag_type1.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ssc ON ((sro_attributes.ssc = x_yes_no_flag_ssc.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_model ON ((sro_attributes.model = x_yes_no_flag_model.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_singletr ON ((sro_attributes.singletr = x_yes_no_flag_singletr.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sysconfg ON ((sro_attributes.sysconfg = x_yes_no_flag_sysconfg.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sctre ON ((sro_attributes.sctre = x_yes_no_flag_sctre.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_indm ON ((sro_attributes.indm = x_yes_no_flag_indm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_noaxles ON ((sro_attributes.noaxles = x_yes_no_flag_noaxles.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_odmmm ON ((sro_attributes.odmmm = x_yes_no_flag_odmmm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_splen ON ((sro_attributes.splen = x_yes_no_flag_splen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_kptype ON ((sro_attributes.kptype = x_yes_no_flag_kptype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_roddm ON ((sro_attributes.roddm = x_yes_no_flag_roddm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ewalltk ON ((sro_attributes.ewalltk = x_yes_no_flag_ewalltk.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_headty ON ((sro_attributes.headty = x_yes_no_flag_headty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_type ON ((sro_attributes.type = x_yes_no_flag_type.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bpw ON ((sro_attributes.bpw = x_yes_no_flag_bpw.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ltapdm ON ((sro_attributes.ltapdm = x_yes_no_flag_ltapdm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ydimae ON ((sro_attributes.ydimae = x_yes_no_flag_ydimae.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_nospline ON ((sro_attributes.nospline = x_yes_no_flag_nospline.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_axleapp ON ((sro_attributes.axleapp = x_yes_no_flag_axleapp.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bhd ON ((sro_attributes.bhd = x_yes_no_flag_bhd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_clutch ON ((sro_attributes.clutch = x_yes_no_flag_clutch.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_compty ON ((sro_attributes.compty = x_yes_no_flag_compty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_headsty ON ((sro_attributes.headsty = x_yes_no_flag_headsty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_colllen ON ((sro_attributes.colllen = x_yes_no_flag_colllen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_grade ON ((sro_attributes.grade = x_yes_no_flag_grade.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ratio ON ((sro_attributes.ratio = x_yes_no_flag_ratio.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_style ON ((sro_attributes.style = x_yes_no_flag_style.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_collst ON ((sro_attributes.collst = x_yes_no_flag_collst.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_oem ON ((sro_attributes.oem = x_yes_no_flag_oem.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_spintype ON ((sro_attributes.spintype = x_yes_no_flag_spintype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_taplen ON ((sro_attributes.taplen = x_yes_no_flag_taplen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_torque ON ((sro_attributes.torque = x_yes_no_flag_torque.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_conntype ON ((sro_attributes.conntype = x_yes_no_flag_conntype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_hubsty ON ((sro_attributes.hubsty = x_yes_no_flag_hubsty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_beardm ON ((sro_attributes.beardm = x_yes_no_flag_beardm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bushtype ON ((sro_attributes.bushtype = x_yes_no_flag_bushtype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_loorunlo ON ((sro_attributes.loorunlo = x_yes_no_flag_loorunlo.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_tubodm ON ((sro_attributes.tubodm = x_yes_no_flag_tubodm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_spldm ON ((sro_attributes.spldm = x_yes_no_flag_spldm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_brand ON ((sro_attributes.brand = x_yes_no_flag_brand.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_stapdm ON ((sro_attributes.stapdm = x_yes_no_flag_stapdm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_hubcaps ON ((sro_attributes.hubcaps = x_yes_no_flag_hubcaps.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_brtype ON ((sro_attributes.brtype = x_yes_no_flag_brtype.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bore ON ((sro_attributes.bore = x_yes_no_flag_bore.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_cssc ON ((sro_attributes.cssc = x_yes_no_flag_cssc.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_kplen ON ((sro_attributes.kplen = x_yes_no_flag_kplen.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_chmbrty ON ((sro_attributes.chmbrty = x_yes_no_flag_chmbrty.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_position ON ((sro_attributes."position" = x_yes_no_flag_position.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_axlemod ON ((sro_attributes.axlemod = x_yes_no_flag_axlemod.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sensor ON ((sro_attributes.sensor = x_yes_no_flag_sensor.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sc4thick ON ((sro_attributes.sc4thick = x_yes_no_flag_sc4thick.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_gawr ON ((sro_attributes.gawr = x_yes_no_flag_gawr.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_oeman ON ((sro_attributes.oeman = x_yes_no_flag_oeman.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_ykdim ON ((sro_attributes.ykdim = x_yes_no_flag_ykdim.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bcd ON ((sro_attributes.bcd = x_yes_no_flag_bcd.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_sthrddm ON ((sro_attributes.sthrddm = x_yes_no_flag_sthrddm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_norrem ON ((sro_attributes.norrem = x_yes_no_flag_norrem.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_isdm ON ((sro_attributes.isdm = x_yes_no_flag_isdm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_class ON ((sro_attributes.class = x_yes_no_flag_class.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_bodydm ON ((sro_attributes.bodydm = x_yes_no_flag_bodydm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_indnum ON ((sro_attributes.indnum = x_yes_no_flag_indnum.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_kpdm ON ((sro_attributes.kpdm = x_yes_no_flag_kpdm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_odm ON ((sro_attributes.odm = x_yes_no_flag_odm.id)))
     LEFT JOIN x_yes_no_flag x_yes_no_flag_teeth ON ((sro_attributes.teeth = x_yes_no_flag_teeth.id)));;

ALTER TABLE public.view_sro_attributes
    OWNER TO postgres;