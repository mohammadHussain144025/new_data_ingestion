-- View: public.jobrunr_jobs_stats

-- DROP VIEW public.jobrunr_jobs_stats;

CREATE OR REPLACE VIEW public.jobrunr_jobs_stats AS
SELECT count(*) AS total,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'AWAITING'::text)) AS awaiting,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'SCHEDULED'::text)) AS scheduled,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'ENQUEUED'::text)) AS enqueued,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'PROCESSING'::text)) AS processing,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'FAILED'::text)) AS failed,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'SUCCEEDED'::text)) AS succeeded,
    ( SELECT ((jm.value)::character(10))::numeric(10,0) AS value
           FROM jobrunr_metadata jm
          WHERE ((jm.id)::text = 'succeeded-jobs-counter-cluster'::text)) AS alltimesucceeded,
    ( SELECT count(*) AS count
           FROM jobrunr_jobs jobs
          WHERE ((jobs.state)::text = 'DELETED'::text)) AS deleted,
    ( SELECT count(*) AS count
           FROM jobrunr_backgroundjobservers) AS nbrofbackgroundjobservers,
    ( SELECT count(*) AS count
           FROM jobrunr_recurring_jobs) AS nbrofrecurringjobs
   FROM jobrunr_jobs j;;

ALTER TABLE public.jobrunr_jobs_stats
    OWNER TO postgres;