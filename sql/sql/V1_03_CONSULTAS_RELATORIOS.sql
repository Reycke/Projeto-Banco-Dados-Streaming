/* ==========================================================
   1. JOIN - Clientes e Assinaturas
   ========================================================== */

SELECT
    c.nome,
    a.data_inicio,
    a.data_vencimento
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente;


/* ==========================================================
   2. JOIN - Cliente e Plano Contratado
   ========================================================== */

SELECT
    c.nome,
    p.nome_plano,
    a.data_vencimento
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano;


/* ==========================================================
   3. FILTRO - Assinaturas Vencidas
   ========================================================== */

SELECT *
FROM ASSINATURA
WHERE data_vencimento < CURDATE();


/* ==========================================================
   4. FILTRO - Clientes Ativos
   ========================================================== */

SELECT *
FROM CLIENTE
WHERE ativo = TRUE;


/* ==========================================================
   5. FUNÇÃO AGREGADA - Total de Clientes
   ========================================================== */

SELECT
    COUNT(*) AS total_clientes
FROM CLIENTE;


/* ==========================================================
   6. FUNÇÃO AGREGADA - Total de Assinaturas por Status
   ========================================================== */

SELECT
    s.descricao AS status_assinatura,
    COUNT(*) AS quantidade
FROM ASSINATURA a
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status
GROUP BY s.descricao;


/* ==========================================================
   7. FUNÇÃO AGREGADA - Total de Assinaturas por Plano
   ========================================================== */

SELECT
    p.nome_plano,
    COUNT(*) AS total_assinaturas
FROM ASSINATURA a
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano
GROUP BY p.nome_plano;


/* ==========================================================
   8. FUNÇÃO AGREGADA - Média de Conexões Ativas
   ========================================================== */

SELECT
    AVG(conexoes_ativas) AS media_conexoes
FROM ASSINATURA;


/* ==========================================================
   9. FUNÇÃO AGREGADA - Último Acesso por Cliente
   ========================================================== */

SELECT
    c.nome,
    MAX(ac.data_hora) AS ultimo_acesso
FROM CLIENTE c
INNER JOIN ACESSO_SISTEMA ac
    ON c.id_cliente = ac.id_cliente
GROUP BY c.nome;


/* ==========================================================
   10. RELATÓRIO - Histórico das Assinaturas
   ========================================================== */

SELECT
    h.id_historico,
    h.tipo_alteracao,
    h.data_alteracao,
    ad.nome AS administrador
FROM HISTORICO_ASSINATURA h
INNER JOIN ADMINISTRADOR ad
    ON h.id_admin = ad.id_admin;


/* ==========================================================
   11. RELATÓRIO - Clientes com Assinatura Ativa
   ========================================================== */

SELECT
    c.nome,
    s.descricao AS status_assinatura
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status
WHERE s.descricao = 'ATIVA';


/* ==========================================================
   12. RELATÓRIO GERENCIAL COMPLETO
   ========================================================== */

SELECT
    c.nome AS cliente,
    p.nome_plano AS plano,
    s.descricao AS status,
    a.data_inicio,
    a.data_vencimento,
    a.conexoes_ativas
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status
ORDER BY a.data_vencimento;


/* ==========================================================
   13. CLIENTES COM MAIS DE 1 CONEXÃO ATIVA
   ========================================================== */

SELECT
    c.nome,
    a.conexoes_ativas
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
WHERE a.conexoes_ativas > 1;


/* ==========================================================
   14. TOTAL DE ACESSOS REGISTRADOS
   ========================================================== */

SELECT
    COUNT(*) AS total_acessos
FROM ACESSO_SISTEMA;


/* ==========================================================
   15. QUANTIDADE DE CLIENTES POR STATUS
   ========================================================== */

SELECT
    s.descricao,
    COUNT(*) AS quantidade
FROM ASSINATURA a
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status
GROUP BY s.descricao
ORDER BY quantidade DESC;


/* ==========================================================
   16. PLANO MAIS UTILIZADO
   ========================================================== */

SELECT
    p.nome_plano,
    COUNT(*) AS total
FROM ASSINATURA a
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano
GROUP BY p.nome_plano
ORDER BY total DESC;


/* ==========================================================
   17. TOTAL DE ADMINISTRADORES ATIVOS
   ========================================================== */

SELECT
    COUNT(*) AS administradores_ativos
FROM ADMINISTRADOR
WHERE ativo = TRUE;


/* ==========================================================
   18. ASSINATURAS ORDENADAS POR VENCIMENTO
   ========================================================== */

SELECT
    id_assinatura,
    data_vencimento
FROM ASSINATURA
ORDER BY data_vencimento;


/* ==========================================================
   19. CONSULTA DE CLIENTE ESPECÍFICO
   ========================================================== */

SELECT *
FROM CLIENTE
WHERE nome LIKE '%Cliente%';


/* ==========================================================
   20. RELATÓRIO FINAL COMPLETO
   ========================================================== */

SELECT
    c.nome AS cliente,
    p.nome_plano,
    s.descricao AS status_assinatura,
    a.data_inicio,
    a.data_vencimento,
    a.conexoes_ativas,
    a.ultimo_acesso
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status
ORDER BY cliente;
