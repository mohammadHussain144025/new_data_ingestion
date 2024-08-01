-- View: public.view_cust_impact_result_current

-- DROP VIEW public.view_cust_impact_result_current;

CREATE OR REPLACE VIEW public.view_cust_impact_result_current AS
WITH cte AS (
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mphc.ppart,
            mphc.prmcod,
            mphc.pprc,
            mphc.pdes,
                CASE
                    WHEN (mphc.pprc > (0)::numeric) THEN mphc.pprc
                    WHEN (mphc.pprc = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - mphc.pdes))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'House'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mpcc.ppart,
            mpcc.prmcod,
            mpcc.pprc,
            mpcc.pdes,
                CASE
                    WHEN (mpcc.pprc > (0)::numeric) THEN mpcc.pprc
                    WHEN (mpcc.pprc = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - mpcc.pdes))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'Contractual'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_cntrct_current mpcc ON ((((mir.csolcd)::text = (mpcc.prmcod)::text) AND ((mir.cpartno)::text = (mpcc.ppart)::text))))
          WHERE (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text)))))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            q.qpartno,
            q.qsoldt,
            q.qprc1,
            q.qdsc1,
                CASE
                    WHEN (q.qprc1 > (0)::numeric) THEN q.qprc1
                    WHEN (q.qprc1 = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - q.qdsc1))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'Quote'::text AS method
           FROM (mv_invoice_result mir
             JOIN quotefil q ON ((((mir.csolcd)::text = (q.qsoldt)::text) AND ((mir.cpartno)::text = (q.qpartno)::text))))
          WHERE ((q.qfrom < CURRENT_DATE) AND (q.qto > CURRENT_DATE) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM ((mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_current mpcc ON ((((mir.csolcd)::text = (mpcc.prmcod)::text) AND ((mir.cpartno)::text = (mpcc.ppart)::text))))
                     JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mptc.ppart,
            mptc.prmcod,
            mptc.pprc,
            mptc.pdes,
                CASE
                    WHEN (mptc.pprc > (0)::numeric) THEN mptc.pprc
                    WHEN (mptc.pprc = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - mptc.pdes))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'Temporary'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_tmpry_current mptc ON ((((mir.csolcd)::text = (mptc.prmcod)::text) AND ((mir.cpartno)::text = (mptc.ppart)::text))))
          WHERE ((NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_current mpcc ON ((((mir.csolcd)::text = (mpcc.prmcod)::text) AND ((mir.cpartno)::text = (mpcc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN quotefil q ON ((((mir_1.csolcd)::text = (q.qsoldt)::text) AND ((mir_1.cpartno)::text = (q.qpartno)::text))))
                  WHERE ((q.qfrom < CURRENT_DATE) AND (q.qto > CURRENT_DATE))))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mppc.ppart,
            mppc.prmcod,
            mppc.pprc,
            mppc.pdes,
                CASE
                    WHEN (mppc.pprc > (0)::numeric) THEN mppc.pprc
                    WHEN (mppc.pprc = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - mppc.pdes))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'Permanent'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_prmnt_current mppc ON ((((mir.csolcd)::text = (mppc.prmcod)::text) AND ((mir.cpartno)::text = (mppc.ppart)::text))))
          WHERE ((NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_current mpcc ON ((((mir.csolcd)::text = (mpcc.prmcod)::text) AND ((mir.cpartno)::text = (mpcc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_tmpry_current mptc ON ((((mir.csolcd)::text = (mptc.prmcod)::text) AND ((mir.cpartno)::text = (mptc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN quotefil q ON ((((mir_1.csolcd)::text = (q.qsoldt)::text) AND ((mir_1.cpartno)::text = (q.qpartno)::text))))
                  WHERE ((q.qfrom < CURRENT_DATE) AND (q.qto > CURRENT_DATE))))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mphj.part_num,
            mphj.psoldt,
            mphj.pprc,
            mphj."discount percent",
                CASE
                    WHEN ((mphj.pprc)::numeric > (0)::numeric) THEN (mphj.pprc)::numeric
                    WHEN ((mphj.pprc)::numeric = (0)::numeric) THEN (mir."Current List Price" * ((1)::numeric - mphj."discount percent"))
                    ELSE NULL::numeric
                END AS "Current Net Price",
            'Part'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_partdisc_hir_join mphj ON ((((mir.csolcd)::text = (mphj.psoldt)::text) AND ((mir.cpartno)::text = (mphj.part_num)::text))))
          WHERE ((NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_current mphc ON ((((mir.csolcd)::text = (mphc.prmcod)::text) AND ((mir.cpartno)::text = (mphc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_current mpcc ON ((((mir.csolcd)::text = (mpcc.prmcod)::text) AND ((mir.cpartno)::text = (mpcc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_tmpry_current mptc ON ((((mir.csolcd)::text = (mptc.prmcod)::text) AND ((mir.cpartno)::text = (mptc.ppart)::text))))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN quotefil q ON ((((mir_1.csolcd)::text = (q.qsoldt)::text) AND ((mir_1.cpartno)::text = (q.qpartno)::text))))
                  WHERE ((q.qfrom < CURRENT_DATE) AND (q.qto > CURRENT_DATE))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_prmnt_current mppc ON ((((mir_1.csolcd)::text = (mppc.prmcod)::text) AND ((mir_1.cpartno)::text = (mppc.ppart)::text))))))))
        )
 SELECT csolcd,
    cpartno,
    rgcd,
    brnd_cd_code,
    dwatt_1,
    "Current List Price",
    "Future List Price",
    ppart,
    prmcod,
    pprc,
    pdes,
    "Current Net Price",
    method
   FROM cte;;

ALTER TABLE public.view_cust_impact_result_current
    OWNER TO postgres;