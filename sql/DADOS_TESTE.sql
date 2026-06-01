INSERT INTO CLIENTE
(nome, cpf, telefone, email, usuario_consulta, data_cadastro, ativo)
VALUES
('Cliente 1','11111111111','64999990001','cliente1@email.com','cliente1','2026-01-01',TRUE),
('Cliente 2','11111111112','64999990002','cliente2@email.com','cliente2','2026-01-02',TRUE),
('Cliente 3','11111111113','64999990003','cliente3@email.com','cliente3','2026-01-03',TRUE),
('Cliente 4','11111111114','64999990004','cliente4@email.com','cliente4','2026-01-04',TRUE),
('Cliente 5','11111111115','64999990005','cliente5@email.com','cliente5','2026-01-05',TRUE),
('Cliente 6','11111111116','64999990006','cliente6@email.com','cliente6','2026-01-06',TRUE),
('Cliente 7','11111111117','64999990007','cliente7@email.com','cliente7','2026-01-07',TRUE),
('Cliente 8','11111111118','64999990008','cliente8@email.com','cliente8','2026-01-08',TRUE),
('Cliente 9','11111111119','64999990009','cliente9@email.com','cliente9','2026-01-09',TRUE),
('Cliente 10','11111111120','64999990010','cliente10@email.com','cliente10','2026-01-10',TRUE),
('Cliente 11','11111111121','64999990011','cliente11@email.com','cliente11','2026-01-11',TRUE),
('Cliente 12','11111111122','64999990012','cliente12@email.com','cliente12','2026-01-12',TRUE),
('Cliente 13','11111111123','64999990013','cliente13@email.com','cliente13','2026-01-13',TRUE),
('Cliente 14','11111111124','64999990014','cliente14@email.com','cliente14','2026-01-14',TRUE),
('Cliente 15','11111111125','64999990015','cliente15@email.com','cliente15','2026-01-15',TRUE),
('Cliente 16','11111111126','64999990016','cliente16@email.com','cliente16','2026-01-16',TRUE),
('Cliente 17','11111111127','64999990017','cliente17@email.com','cliente17','2026-01-17',TRUE),
('Cliente 18','11111111128','64999990018','cliente18@email.com','cliente18','2026-01-18',TRUE),
('Cliente 19','11111111129','64999990019','cliente19@email.com','cliente19','2026-01-19',TRUE),
('Cliente 20','11111111130','64999990020','cliente20@email.com','cliente20','2026-01-20',TRUE);


-- Dados incorretos para Etapa 3

INSERT INTO CLIENTE
(nome, cpf)
VALUES
(NULL,'99999999999');

INSERT INTO CLIENTE
(nome, cpf)
VALUES
('CPF_DUPLICADO','11111111111');
