SELECT U.NM_SEGURADO,C.DS_ENDERECO_COBRANCA,C.DS_BAIRRO,C.NR_CEP,C.NM_CIDADE,C.NM_UF,C.SN_ATIVO 
FROM DBAPS.USUARIO U
INNER JOIN DBAPS.CONTRATO C ON U.CD_CONTRATO = C.CD_CONTRATO
WHERE C.SN_ATIVO = 'S'
ORDER BY U.NM_SEGURADO ASC
