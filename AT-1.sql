-- LISTAR NOME DOS USUARIOS, INFORMAR SEXO,CASADOS, QUE RESIDEM EM CARUARU, APENAS OS ATIVOS E INFORMAR O NR DA CARTEIRA DO BENEFICIARIO.
-- UTILIZAR TABELAS USUARIO, V_CTAS_MEDICAS, PRESTADOR.
SELECT DISTINCT U.NM_SEGURADO,
                U.CD_MATRICULA,
                ME.CD_CONTRATO,
                U.SN_ATIVO,
                U.TP_ESTADO_CIVIL,
                C.DS_ENDERECO_COBRANCA,
                C.DS_BAIRRO,
                C.NM_CIDADE,
                C.NM_UF,      
                CASE
                  WHEN TO_CHAR(U.DT_CADASTRO) < '30/12/2020' THEN
                  'CADASTRO  ANTIGO'
                  ELSE
                  'CADASTRO NOVO'
               END AS INF_USUARIO,
                CASE
                  WHEN ME.VL_MENSALIDADE <= 189 THEN
                   'PLANO 1'
                  WHEN ME.VL_MENSALIDADE >= 190 OR ME.VL_MENSALIDADE <= 250 THEN
                   'PLANO 2'
                  WHEN ME.VL_MENSALIDADE >= 251 THEN
                   'PLANO 3'
                  ELSE
                   'SEM CADASTRO'
                END AS PLANO
  FROM DBAPS.USUARIO U
 INNER JOIN DBAPS.CONTRATO C
    ON U.CD_MATRICULA = C.CD_MATRICULA
 INNER JOIN DBAPS.MENS_CONTRATO ME
    ON ME.CD_CONTRATO = C.CD_CONTRATO
 WHERE U.TP_ESTADO_CIVIL = 'C'
   AND C.NM_CIDADE = 'CARUARU'
   AND U.SN_ATIVO = 'S'
 ORDER BY U.NM_SEGURADO ASC
