INSERT INTO STATUS_ASSINATURA (descricao) VALUES
('ATIVA'),
('VENCIDA'),
('SUSPENSA'),
('EM_ANALISE'),
('CANCELADA'),
('BLOQUEADA'),
('TESTE'),
('PENDENTE'),
('AGUARDANDO'),
('EXPIRADA'),
('ATIVA_2'),
('ATIVA_3'),
('ATIVA_4'),
('ATIVA_5'),
('ATIVA_6'),
('ATIVA_7'),
('ATIVA_8'),
('ATIVA_9'),
('ATIVA_10'),
('ATIVA_11');

INSERT INTO PLANO (nome_plano, quantidade_acessos, descricao, ativo) VALUES
('Plano 1',1,'Plano Básico',TRUE),
('Plano 2',2,'Plano Intermediário',TRUE),
('Plano 3',3,'Plano Premium',TRUE),
('Plano 4',4,'Plano Família',TRUE),
('Plano 5',5,'Plano Especial',TRUE),
('Plano 6',1,'Plano Básico',TRUE),
('Plano 7',2,'Plano Intermediário',TRUE),
('Plano 8',3,'Plano Premium',TRUE),
('Plano 9',4,'Plano Família',TRUE),
('Plano 10',5,'Plano Especial',TRUE),
('Plano 11',1,'Plano Básico',TRUE),
('Plano 12',2,'Plano Intermediário',TRUE),
('Plano 13',3,'Plano Premium',TRUE),
('Plano 14',4,'Plano Família',TRUE),
('Plano 15',5,'Plano Especial',TRUE),
('Plano 16',1,'Plano Básico',TRUE),
('Plano 17',2,'Plano Intermediário',TRUE),
('Plano 18',3,'Plano Premium',TRUE),
('Plano 19',4,'Plano Família',TRUE),
('Plano 20',5,'Plano Especial',TRUE);

-- Campo obrigatório nulo
INSERT INTO CLIENTE (nome, cpf)
VALUES (NULL,'99999999999');

-- CPF duplicado
INSERT INTO CLIENTE (nome, cpf)
VALUES ('CPF_DUPLICADO','11111111111');

-- Chave estrangeira inexistente
INSERT INTO ASSINATURA
(data_inicio,data_vencimento,conexoes_ativas,ultimo_acesso,id_cliente,id_plano,id_status)
VALUES
('2026-03-01','2026-04-01',1,'2026-03-01 10:00:00',999,1,1);

-- Login duplicado
INSERT INTO ADMINISTRADOR
(nome,login,senha_hash,nivel_acesso)
VALUES
('Admin Duplicado','admin1','teste','SUPORTE');

