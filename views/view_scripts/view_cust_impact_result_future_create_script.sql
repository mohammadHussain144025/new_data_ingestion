-- View: public.view_cust_impact_result_future

-- DROP VIEW public.view_cust_impact_result_future;

CREATE OR REPLACE VIEW public.view_cust_impact_result_future AS
WITH cte AS (
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mphf.ppart,
            mphf.prmcod,
            mphf.pprc,
            mphf.pdes,
                CASE
                    WHEN (mphf.pprc > (0)::numeric) THEN mphf.pprc
                    WHEN (mphf.pprc = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - mphf.pdes))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'House'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
          WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mpcf.ppart,
            mpcf.prmcod,
            mpcf.pprc,
            mpcf.pdes,
                CASE
                    WHEN (mpcf.pprc > (0)::numeric) THEN mpcf.pprc
                    WHEN (mpcf.pprc = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - mpcf.pdes))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'Contractual'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))
          WHERE ((mpcf.start <= mir.effdt) AND (mpcf."end" >= mir.effdt) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
                  WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))))))
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
                    WHEN (q.qprc1 = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - q.qdsc1))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'Quote'::text AS method
           FROM (mv_invoice_result mir
             JOIN quotefil q ON ((((mir.csolcd)::text = (q.qsoldt)::text) AND ((mir.cpartno)::text = (q.qpartno)::text))))
          WHERE ((q.qfrom <= mir.effdt) AND (q.qto >= mir.effdt) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
                  WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))
                  WHERE ((mpcf.start <= mir.effdt) AND (mpcf."end" >= mir.effdt))))))
        UNION ALL
         SELECT mir.csolcd,
            mir.cpartno,
            mir.rgcd,
            mir.brnd_cd_code,
            mir.dwatt_1,
            mir."Current List Price",
            mir."Future List Price",
            mptf.ppart,
            mptf.prmcod,
            mptf.pprc,
            mptf.pdes,
                CASE
                    WHEN (mptf.pprc > (0)::numeric) THEN mptf.pprc
                    WHEN (mptf.pprc = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - mptf.pdes))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'Temporary'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_tmpry_future mptf ON ((((mir.csolcd)::text = (mptf.prmcod)::text) AND ((mir.cpartno)::text = (mptf.ppart)::text))))
          WHERE ((mptf.start <= mir.effdt) AND (mptf."end" >= mir.effdt) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
                  WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))
                  WHERE ((mpcf.start <= mir.effdt) AND (mpcf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
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
            mppf.ppart,
            mppf.prmcod,
            mppf.pprc,
            mppf.pdes,
                CASE
                    WHEN (mppf.pprc > (0)::numeric) THEN mppf.pprc
                    WHEN (mppf.pprc = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - mppf.pdes))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'Permanent'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_prm_prmnt_future mppf ON ((((mir.csolcd)::text = (mppf.prmcod)::text) AND ((mir.cpartno)::text = (mppf.ppart)::text))))
          WHERE ((mppf.start <= mir.effdt) AND (mppf."end" >= mir.effdt) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
                  WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))
                  WHERE ((mpcf.start <= mir.effdt) AND (mpcf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_tmpry_future mptf ON ((((mir.csolcd)::text = (mptf.prmcod)::text) AND ((mir.cpartno)::text = (mptf.ppart)::text))))
                  WHERE ((mptf.start <= mir.effdt) AND (mptf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
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
                    WHEN ((mphj.pprc)::numeric = (0)::numeric) THEN (mir."Future List Price" * ((1)::numeric - mphj."discount percent"))
                    ELSE NULL::numeric
                END AS "Future Net Price",
            'Part'::text AS method
           FROM (mv_invoice_result mir
             JOIN mv_partdisc_hir_join mphj ON ((((mir.csolcd)::text = (mphj.psoldt)::text) AND ((mir.cpartno)::text = (mphj.part_num)::text))))
          WHERE ((mphj.pstrdt <= mir.effdt) AND (mphj.penddt >= mir.effdt) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_house_future mphf ON ((((mir.csolcd)::text = (mphf.prmcod)::text) AND ((mir.cpartno)::text = (mphf.ppart)::text))))
                  WHERE ((mphf.start <= mir.effdt) AND (mphf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_cntrct_future mpcf ON ((((mir.csolcd)::text = (mpcf.prmcod)::text) AND ((mir.cpartno)::text = (mpcf.ppart)::text))))
                  WHERE ((mpcf.start <= mir.effdt) AND (mpcf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_tmpry_future mptf ON ((((mir.csolcd)::text = (mptf.prmcod)::text) AND ((mir.cpartno)::text = (mptf.ppart)::text))))
                  WHERE ((mptf.start <= mir.effdt) AND (mptf."end" >= mir.effdt))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN quotefil q ON ((((mir_1.csolcd)::text = (q.qsoldt)::text) AND ((mir_1.cpartno)::text = (q.qpartno)::text))))
                  WHERE ((q.qfrom < CURRENT_DATE) AND (q.qto > CURRENT_DATE))))) AND (NOT (EXISTS ( SELECT 1
                   FROM (mv_invoice_result mir_1
                     JOIN mv_prm_prmnt_future mppf ON ((((mir_1.csolcd)::text = (mppf.prmcod)::text) AND ((mir_1.cpartno)::text = (mppf.ppart)::text))))
                  WHERE ((mppf.start <= mir_1.effdt) AND (mppf."end" >= mir_1.effdt))))))
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
    "Future Net Price",
    method
   FROM cte;;

ALTER TABLE public.view_cust_impact_result_future
    OWNER TO postgres;