SELECT a.c_bpartner_id,
       a.ad_client_id,
       a.ad_org_id,
       a.isactive,
       a.created,
       a.createdby,
       a.updated,
       a.updatedby,
       a.anio,
       b.anio,
       m1,
       anterior_m1,
       m2,
       anterior_m2,
       m3,
       anterior_m3,
       m4,
       anterior_m4,
       m5,
       anterior_m5,
       m6,
       anterior_m6,
       m7,
       anterior_m7,
       m8,
       anterior_m8,
       m9,
       anterior_m9,
       m10,
       anterior_m10,
       m11,
       anterior_m11,
       m12,
       anterior_m12,
       acum
FROM (SELECT c_bpartner_id,
             ad_client_id,
             ad_org_id,
             isactive,
             created,
             createdby,
             updated,
             updatedby,
             anio,
             
      --mes,
      SUM(m1) m1,
             SUM(m2) m2,
             SUM(m3) m3,
             SUM(m4) m4,
             SUM(m5) m5,
             SUM(m6) m6,
             SUM(m7) m7,
             SUM(m8) m8,
             SUM(m9) m9,
             SUM(m10) m10,
             SUM(m11) m11,
             SUM(m12) m12,
             SUM(acum) acum
      FROM (SELECT i.c_bpartner_id,
                   c.ad_client_id,
                   c.ad_org_id,
                   c.isactive,
                   c.created,
                   c.createdby,
                   c.updated,
                   c.updatedby,
                   EXTRACT(YEAR FROM i.dateinvoiced) anio,
                   
            --EXTRACT(MONTH FROM i.dateinvoiced) mes,
            CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 1 THEN i.totallines
                     ELSE 0
                   END AS m1,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 2 THEN i.totallines
                     ELSE 0
                   END AS m2,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 3 THEN i.totallines
                     ELSE 0
                   END AS m3,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 4 THEN i.totallines
                     ELSE 0
                   END AS m4,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 5 THEN i.totallines
                     ELSE 0
                   END AS m5,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 6 THEN i.totallines
                     ELSE 0
                   END AS m6,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 7 THEN i.totallines
                     ELSE 0
                   END AS m7,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 8 THEN i.totallines
                     ELSE 0
                   END AS m8,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 9 THEN i.totallines
                     ELSE 0
                   END AS m9,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 10 THEN i.totallines
                     ELSE 0
                   END AS m10,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 11 THEN i.totallines
                     ELSE 0
                   END AS m11,
                   CASE
                     WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 12 THEN i.totallines
                     ELSE 0
                   END AS m12,
                   i.totallines acum
            FROM c_invoice i
              INNER JOIN c_doctype doc
                      ON i.c_doctype_id = doc.c_doctype_id
                     AND i.docstatus = 'CO'
                     AND i.issotrx = 'Y'
                     AND EXTRACT (YEAR FROM i.dateinvoiced) = 2013
                     AND doc.docbasetype = 'ARI'
              INNER JOIN ad_client c ON i.ad_client_id = c.ad_client_id) a
      GROUP BY c_bpartner_id,
               ad_client_id,
               ad_org_id,
               isactive,
               created,
               createdby,
               updated,
               updatedby,
               anio) A
  LEFT JOIN (SELECT c_bpartner_id,
                    ad_client_id,
                    ad_org_id,
                    isactive,
                    created,
                    createdby,
                    updated,
                    updatedby,
                    anio,
                    
             --mes,
             SUM(m1) anterior_m1,
                    SUM(m2) anterior_m2,
                    SUM(m3) anterior_m3,
                    SUM(m4) anterior_m4,
                    SUM(m5) anterior_m5,
                    SUM(m6) anterior_m6,
                    SUM(m7) anterior_m7,
                    SUM(m8) anterior_m8,
                    SUM(m9) anterior_m9,
                    SUM(m10) anterior_m10,
                    SUM(m11) anterior_m11,
                    SUM(m12) anterior_m12,
                    SUM(acum) anterior_acum
             FROM (SELECT i.c_bpartner_id,
                          c.ad_client_id,
                          c.ad_org_id,
                          c.isactive,
                          c.created,
                          c.createdby,
                          c.updated,
                          c.updatedby,
                          EXTRACT(YEAR FROM i.dateinvoiced) anio,
                          
                   --EXTRACT(MONTH FROM i.dateinvoiced) mes,
                   CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 1 THEN i.totallines
                            ELSE 0
                          END AS m1,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 2 THEN i.totallines
                            ELSE 0
                          END AS m2,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 3 THEN i.totallines
                            ELSE 0
                          END AS m3,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 4 THEN i.totallines
                            ELSE 0
                          END AS m4,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 5 THEN i.totallines
                            ELSE 0
                          END AS m5,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 6 THEN i.totallines
                            ELSE 0
                          END AS m6,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 7 THEN i.totallines
                            ELSE 0
                          END AS m7,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 8 THEN i.totallines
                            ELSE 0
                          END AS m8,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 9 THEN i.totallines
                            ELSE 0
                          END AS m9,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 10 THEN i.totallines
                            ELSE 0
                          END AS m10,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 11 THEN i.totallines
                            ELSE 0
                          END AS m11,
                          CASE
                            WHEN EXTRACT(MONTH FROM i.dateinvoiced) = 12 THEN i.totallines
                            ELSE 0
                          END AS m12,
                          i.totallines acum
                   FROM c_invoice i
                     INNER JOIN c_doctype doc
                             ON i.c_doctype_id = doc.c_doctype_id
                            AND i.docstatus = 'CO'
                            AND i.issotrx = 'Y'
                            AND EXTRACT (YEAR FROM i.dateinvoiced) = 2013
                            AND doc.docbasetype = 'ARI'
                     INNER JOIN ad_client c ON i.ad_client_id = c.ad_client_id) a
             GROUP BY c_bpartner_id,
                      ad_client_id,
                      ad_org_id,
                      isactive,
                      created,
                      createdby,
                      updated,
                      updatedby,
                      anio) b
         ON a.c_bpartner_id = b.c_bpartner_id
        AND a.anio = b.anio -1
