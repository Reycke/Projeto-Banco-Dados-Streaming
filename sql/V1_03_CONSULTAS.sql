/* =====================================================================
   ETAPA 3 – CONSULTAS E RELATÓRIOS
   Objetivos:
   - Utilização de INNER JOIN, LEFT JOIN e RIGHT JOIN
   - Aplicação de filtros (WHERE)
   - Utilização de GROUP BY e HAVING
   - Uso de funções agregadas (COUNT, AVG, MAX, MIN)
   - Utilização de Subqueries
   - Identificação de dados inconsistentes
   - Geração de relatórios gerenciais
   ===================================================================== */

/* =====================================================================
   SEÇÃO 1 - CONSULTAS COM INNER JOIN
   ===================================================================== */

-- 1. Listar clientes e suas assinaturas

SELECT
    c.nome,
    a.data_inicio,
    a.data_vencimento
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente;


-- 2. Listar clientes e planos contratados

SELECT
    c.nome,
    p.nome_plano
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano;


-- 3. Listar clientes e status da assinatura

SELECT
    c.nome,
    s.descricao AS status_assinatura
FROM CLIENTE c
INNER JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente
INNER JOIN STATUS_ASSINATURA s
    ON a.id_status = s.id_status;


-- 4. Listar acessos realizados pelos clientes

SELECT
    c.nome,
    ac.data_hora,
    ac.ip_acesso
FROM CLIENTE c
INNER JOIN ACESSO_SISTEMA ac
    ON c.id_cliente = ac.id_cliente;


-- 5. Histórico de alterações e administradores responsáveis

SELECT
    h.tipo_alteracao,
    h.data_alteracao,
    ad.nome AS administrador
FROM HISTORICO_ASSINATURA h
INNER JOIN ADMINISTRADOR ad
    ON h.id_admin = ad.id_admin;


/* =====================================================================
   SEÇÃO 2 - CONSULTAS COM LEFT JOIN
   ===================================================================== */

-- 6. Clientes e suas assinaturas (incluindo clientes sem assinatura)

SELECT
    c.nome,
    a.id_assinatura
FROM CLIENTE c
LEFT JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente;


-- 7. Clientes e acessos registrados

SELECT
    c.nome,
    ac.id_acesso
FROM CLIENTE c
LEFT JOIN ACESSO_SISTEMA ac
    ON c.id_cliente = ac.id_cliente;


-- 8. Administradores e histórico de ações

SELECT
    ad.nome,
    h.id_historico
FROM ADMINISTRADOR ad
LEFT JOIN HISTORICO_ASSINATURA h
    ON ad.id_admin = h.id_admin;


/* =====================================================================
   SEÇÃO 3 - CONSULTAS COM RIGHT JOIN
   ===================================================================== */

-- 9. Assinaturas e clientes relacionados

SELECT
    c.nome,
    a.id_assinatura
FROM CLIENTE c
RIGHT JOIN ASSINATURA a
    ON c.id_cliente = a.id_cliente;


-- 10. Histórico e administradores relacionados

SELECT
    ad.nome,
    h.id_historico
FROM ADMINISTRADOR ad
RIGHT JOIN HISTORICO_ASSINATURA h
    ON ad.id_admin = h.id_admin;


/* =====================================================================
   SEÇÃO 4 - CONSULTAS COM FILTROS
   ===================================================================== */

-- 11. Clientes ativos

SELECT *
FROM CLIENTE
WHERE ativo = TRUE;


-- 12. Administradores ativos

SELECT *
FROM ADMINISTRADOR
WHERE ativo = TRUE;


-- 13. Assinaturas vencidas

SELECT *
FROM ASSINATURA
WHERE data_vencimento < CURDATE();


-- 14. Clientes cadastrados após uma data específica

SELECT *
FROM CLIENTE
WHERE data_cadastro >= '2026-01-10';


/* =====================================================================
   SEÇÃO 5 - CONSULTAS COM GROUP BY
   ===================================================================== */

-- 15. Quantidade de assinaturas por status

SELECT
    id_status,
    COUNT(*) AS quantidade
FROM ASSINATURA
GROUP BY id_status;


-- 16. Quantidade de assinaturas por plano

SELECT
    id_plano,
    COUNT(*) AS quantidade
FROM ASSINATURA
GROUP BY id_plano;


-- 17. Quantidade de clientes ativos e inativos

SELECT
    ativo,
    COUNT(*) AS quantidade
FROM CLIENTE
GROUP BY ativo;


-- 18. Quantidade de administradores por nível de acesso

SELECT
    nivel_acesso,
    COUNT(*) AS quantidade
FROM ADMINISTRADOR
GROUP BY nivel_acesso;


/* =====================================================================
   SEÇÃO 6 - CONSULTAS COM HAVING
   ===================================================================== */

-- 19. Status com pelo menos uma assinatura

SELECT
    id_status,
    COUNT(*) AS quantidade
FROM ASSINATURA
GROUP BY id_status
HAVING COUNT(*) >= 1;


-- 20. Planos com pelo menos uma assinatura

SELECT
    id_plano,
    COUNT(*) AS quantidade
FROM ASSINATURA
GROUP BY id_plano
HAVING COUNT(*) >= 1;


-- 21. Identificação de CPFs duplicados

SELECT
    cpf,
    COUNT(*) AS quantidade
FROM CLIENTE
GROUP BY cpf
HAVING COUNT(*) > 1;


/* =====================================================================
   SEÇÃO 7 - FUNÇÕES AGREGADAS
   ===================================================================== */

-- 22. Total de clientes

SELECT
    COUNT(*) AS total_clientes
FROM CLIENTE;


-- 23. Total de assinaturas

SELECT
    COUNT(*) AS total_assinaturas
FROM ASSINATURA;


-- 24. Média de conexões ativas

SELECT
    AVG(conexoes_ativas) AS media_conexoes
FROM ASSINATURA;


-- 25. Maior data de vencimento

SELECT
    MAX(data_vencimento) AS maior_vencimento
FROM ASSINATURA;


-- 26. Menor data de vencimento

SELECT
    MIN(data_vencimento) AS menor_vencimento
FROM ASSINATURA;


/* =====================================================================
   SEÇÃO 8 - SUBQUERIES
   ===================================================================== */

-- 27. Clientes que possuem assinatura

SELECT *
FROM CLIENTE
WHERE id_cliente IN
(
    SELECT id_cliente
    FROM ASSINATURA
);


-- 28. Clientes sem assinatura

SELECT *
FROM CLIENTE
WHERE id_cliente NOT IN
(
    SELECT id_cliente
    FROM ASSINATURA
);


-- 29. Assinaturas acima da média de conexões

SELECT *
FROM ASSINATURA
WHERE conexoes_ativas >
(
    SELECT AVG(conexoes_ativas)
    FROM ASSINATURA
);


-- 30. Planos utilizados por assinaturas

SELECT *
FROM PLANO
WHERE id_plano IN
(
    SELECT id_plano
    FROM ASSINATURA
);


/* =====================================================================
   SEÇÃO 9 - IDENTIFICAÇÃO DE DADOS INCONSISTENTES
   ===================================================================== */

-- 31. Clientes com nome nulo

SELECT *
FROM CLIENTE
WHERE nome IS NULL;


-- 32. Clientes sem usuário de consulta

SELECT *
FROM CLIENTE
WHERE usuario_consulta IS NULL;


-- 33. Clientes sem e-mail

SELECT *
FROM CLIENTE
WHERE email IS NULL;


-- 34. CPFs duplicados

SELECT
    cpf,
    COUNT(*) AS quantidade
FROM CLIENTE
GROUP BY cpf
HAVING COUNT(*) > 1;


-- 35. Assinaturas sem cliente válido

SELECT *
FROM ASSINATURA
WHERE id_cliente NOT IN
(
    SELECT id_cliente
    FROM CLIENTE
);


/* =====================================================================
   SEÇÃO 10 - RELATÓRIOS GERENCIAIS
   ===================================================================== */

-- 36. Relatório completo de clientes, planos e status

SELECT
    c.nome AS cliente,
    p.nome_plano,
    s.descricao AS status_assinatura,
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
ORDER BY c.nome;


-- 37. Relatório de acessos por cliente

SELECT
    c.nome,
    COUNT(ac.id_acesso) AS total_acessos
FROM CLIENTE c
LEFT JOIN ACESSO_SISTEMA ac
    ON c.id_cliente = ac.id_cliente
GROUP BY c.nome;


-- 38. Último acesso registrado por cliente

SELECT
    c.nome,
    MAX(ac.data_hora) AS ultimo_acesso
FROM CLIENTE c
INNER JOIN ACESSO_SISTEMA ac
    ON c.id_cliente = ac.id_cliente
GROUP BY c.nome;


-- 39. Histórico completo de alterações

SELECT
    h.id_historico,
    h.tipo_alteracao,
    h.observacao,
    h.data_alteracao,
    ad.nome AS administrador
FROM HISTORICO_ASSINATURA h
INNER JOIN ADMINISTRADOR ad
    ON h.id_admin = ad.id_admin;


-- 40. Planos mais utilizados

SELECT
    p.nome_plano,
    COUNT(*) AS total_assinaturas
FROM ASSINATURA a
INNER JOIN PLANO p
    ON a.id_plano = p.id_plano
GROUP BY p.nome_plano
ORDER BY total_assinaturas DESC;
