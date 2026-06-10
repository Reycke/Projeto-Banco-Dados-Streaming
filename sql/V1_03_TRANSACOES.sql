/* =====================================================================
ETAPA 4 – TRANSAÇÕES E OPERAÇÕES AVANÇADAS
Objetivos:
Controle de transações
COMMIT
ROLLBACK
SAVEPOINT
Simulação de cenários reais de negócio
Consistência dos dados
===================================================================== */
/* =====================================================================
CENÁRIO 1 - RENOVAÇÃO DE ASSINATURA
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET data_vencimento = '2026-12-31',
id_status = 1
WHERE id_assinatura = 1;

INSERT INTO HISTORICO_ASSINATURA
(data_alteracao, tipo_alteracao, observacao, id_assinatura, id_admin)
VALUES
(NOW(),'RENOVACAO','Renovação da assinatura',1,1);

COMMIT;

/* =====================================================================
CENÁRIO 2 - CANCELAMENTO DE ASSINATURA
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_status = 5
WHERE id_assinatura = 2;

INSERT INTO HISTORICO_ASSINATURA
(data_alteracao, tipo_alteracao, observacao, id_assinatura, id_admin)
VALUES
(NOW(),'CANCELAMENTO','Assinatura cancelada',2,1);

COMMIT;

/* =====================================================================
CENÁRIO 3 - BLOQUEIO DE ASSINATURAS VENCIDAS
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_status = 6
WHERE data_vencimento < CURDATE();

COMMIT;

/* =====================================================================
CENÁRIO 4 - ALTERAÇÃO DE PLANO
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_plano = 5
WHERE id_assinatura = 5;

INSERT INTO HISTORICO_ASSINATURA
(data_alteracao, tipo_alteracao, observacao, id_assinatura, id_admin)
VALUES
(NOW(),'ALTERACAO_PLANO','Plano alterado',5,1);

COMMIT;

/* =====================================================================
CENÁRIO 5 - REGISTRO DE ACESSO
===================================================================== */

START TRANSACTION;

INSERT INTO ACESSO_SISTEMA
(data_hora, ip_acesso, dispositivo, navegador, id_cliente)
VALUES
(NOW(),'192.168.1.100','Smart TV','Aplicativo',1);

COMMIT;

/* =====================================================================
CENÁRIO 6 - REATIVAÇÃO DE ASSINATURA
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_status = 1
WHERE id_assinatura = 8;

INSERT INTO HISTORICO_ASSINATURA
(data_alteracao, tipo_alteracao, observacao, id_assinatura, id_admin)
VALUES
(NOW(),'REATIVACAO','Assinatura reativada',8,1);

COMMIT;

/* =====================================================================
CENÁRIO 7 - CADASTRO DE CLIENTE E ASSINATURA
===================================================================== */

START TRANSACTION;

INSERT INTO CLIENTE
(nome, cpf, telefone, email, usuario_consulta, data_cadastro, ativo)
VALUES
('Cliente Novo',
'99999999998',
'64999998888',
'novo@email.com',
'cliente_novo',
CURDATE(),
TRUE);

INSERT INTO ASSINATURA
(data_inicio, data_vencimento, conexoes_ativas, ultimo_acesso,
id_cliente, id_plano, id_status)
VALUES
(CURDATE(),
DATE_ADD(CURDATE(), INTERVAL 30 DAY),
1,
NOW(),
LAST_INSERT_ID(),
1,
1);

COMMIT;

/* =====================================================================
CENÁRIO 8 - ROLLBACK DE ALTERAÇÃO INCORRETA
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET conexoes_ativas = 999
WHERE id_assinatura = 3;

ROLLBACK;

/* =====================================================================
CENÁRIO 9 - ROLLBACK DE EXCLUSÃO ACIDENTAL
===================================================================== */

START TRANSACTION;

DELETE FROM CLIENTE
WHERE id_cliente = 10;

ROLLBACK;

/* =====================================================================
CENÁRIO 10 - SAVEPOINT 1
===================================================================== */

START TRANSACTION;

UPDATE CLIENTE
SET telefone = '64999999999'
WHERE id_cliente = 4;

SAVEPOINT ponto_seguranca;

UPDATE CLIENTE
SET email = 'email_errado'
WHERE id_cliente = 4;

ROLLBACK TO ponto_seguranca;

COMMIT;

/* =====================================================================
CENÁRIO 11 - SAVEPOINT 2
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_plano = 2
WHERE id_assinatura = 6;

SAVEPOINT plano_alterado;

UPDATE ASSINATURA
SET id_plano = 99
WHERE id_assinatura = 6;

ROLLBACK TO plano_alterado;

COMMIT;

/* =====================================================================
CENÁRIO 12 - SAVEPOINT 3
===================================================================== */

START TRANSACTION;

UPDATE ASSINATURA
SET id_status = 3
WHERE id_assinatura = 7;

SAVEPOINT status_salvo;

UPDATE ASSINATURA
SET id_status = 999
WHERE id_assinatura = 7;

ROLLBACK TO status_salvo;

COMMIT;

/* =====================================================================
PROCEDIMENTOS DE CONSISTÊNCIA DOS DADOS
===================================================================== */

-- Clientes sem assinatura

SELECT *
FROM CLIENTE
WHERE id_cliente NOT IN
(
SELECT id_cliente
FROM ASSINATURA
);

-- Assinaturas sem cliente válido

SELECT *
FROM ASSINATURA
WHERE id_cliente NOT IN
(
SELECT id_cliente
FROM CLIENTE
);

-- CPFs duplicados

SELECT cpf,
COUNT() AS quantidade
FROM CLIENTE
GROUP BY cpf
HAVING COUNT() > 1;

-- Clientes sem usuário de consulta

SELECT *
FROM CLIENTE
WHERE usuario_consulta IS NULL;

-- Clientes sem e-mail

SELECT *
FROM CLIENTE
WHERE email IS NULL;

-- Administradores inativos

SELECT *
FROM ADMINISTRADOR
WHERE ativo = FALSE;

-- Assinaturas vencidas

SELECT *
FROM ASSINATURA
WHERE data_vencimento < CURDATE();

/* =====================================================================
RELATÓRIO FINAL DE CONSISTÊNCIA
===================================================================== */

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
