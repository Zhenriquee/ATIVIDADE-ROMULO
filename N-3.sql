SELECT DT_COMPETENCIA, COUNT (DT_COMPETENCIA) AS "CONSULTAS"
FROM DBAPS.V_CTAS_MEDICAS
GROUP BY DT_COMPETENCIA
ORDER BY DT_COMPETENCIA DESC
