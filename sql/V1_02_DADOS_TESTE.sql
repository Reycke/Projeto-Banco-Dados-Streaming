-- ADMINISTRADORES

INSERT INTO ADMINISTRADOR
(nome, login, senha_hash, nivel_acesso, ultimo_login, ativo)
VALUES
('Admin 1','admin1','hash1','MASTER','2026-01-01 10:00:00',TRUE),
('Admin 2','admin2','hash2','SUPORTE','2026-01-02 10:00:00',TRUE),
('Admin 3','admin3','hash3','SUPORTE','2026-01-03 10:00:00',TRUE),
('Admin 4','admin4','hash4','SUPORTE','2026-01-04 10:00:00',TRUE),
('Admin 5','admin5','hash5','SUPORTE','2026-01-05 10:00:00',TRUE),
('Admin 6','admin6','hash6','SUPORTE','2026-01-06 10:00:00',TRUE),
('Admin 7','admin7','hash7','SUPORTE','2026-01-07 10:00:00',TRUE),
('Admin 8','admin8','hash8','SUPORTE','2026-01-08 10:00:00',TRUE),
('Admin 9','admin9','hash9','SUPORTE','2026-01-09 10:00:00',TRUE),
('Admin 10','admin10','hash10','SUPORTE','2026-01-10 10:00:00',TRUE),
('Admin 11','admin11','hash11','SUPORTE','2026-01-11 10:00:00',TRUE),
('Admin 12','admin12','hash12','SUPORTE','2026-01-12 10:00:00',TRUE),
('Admin 13','admin13','hash13','SUPORTE','2026-01-13 10:00:00',TRUE),
('Admin 14','admin14','hash14','SUPORTE','2026-01-14 10:00:00',TRUE),
('Admin 15','admin15','hash15','SUPORTE','2026-01-15 10:00:00',TRUE),
('Admin 16','admin16','hash16','SUPORTE','2026-01-16 10:00:00',TRUE),
('Admin 17','admin17','hash17','SUPORTE','2026-01-17 10:00:00',TRUE),
('Admin 18','admin18','hash18','SUPORTE','2026-01-18 10:00:00',TRUE),
('Admin 19','admin19','hash19','SUPORTE','2026-01-19 10:00:00',TRUE),
('Admin 20','admin20','hash20','SUPORTE','2026-01-20 10:00:00',TRUE);


-- ASSINATURAS

INSERT INTO ASSINATURA
(data_inicio, data_vencimento, conexoes_ativas, ultimo_acesso, id_cliente, id_plano, id_status)
VALUES
('2026-01-01','2026-02-01',1,'2026-01-01 12:00:00',1,1,1),
('2026-01-02','2026-02-02',2,'2026-01-02 12:00:00',2,2,1),
('2026-01-03','2026-02-03',1,'2026-01-03 12:00:00',3,3,2),
('2026-01-04','2026-02-04',3,'2026-01-04 12:00:00',4,4,1),
('2026-01-05','2026-02-05',2,'2026-01-05 12:00:00',5,5,3),
('2026-01-06','2026-02-06',1,'2026-01-06 12:00:00',6,6,1),
('2026-01-07','2026-02-07',1,'2026-01-07 12:00:00',7,7,1),
('2026-01-08','2026-02-08',2,'2026-01-08 12:00:00',8,8,2),
('2026-01-09','2026-02-09',1,'2026-01-09 12:00:00',9,9,1),
('2026-01-10','2026-02-10',2,'2026-01-10 12:00:00',10,10,1),
('2026-01-11','2026-02-11',1,'2026-01-11 12:00:00',11,11,1),
('2026-01-12','2026-02-12',3,'2026-01-12 12:00:00',12,12,2),
('2026-01-13','2026-02-13',2,'2026-01-13 12:00:00',13,13,1),
('2026-01-14','2026-02-14',1,'2026-01-14 12:00:00',14,14,1),
('2026-01-15','2026-02-15',1,'2026-01-15 12:00:00',15,15,3),
('2026-01-16','2026-02-16',2,'2026-01-16 12:00:00',16,16,1),
('2026-01-17','2026-02-17',1,'2026-01-17 12:00:00',17,17,1),
('2026-01-18','2026-02-18',2,'2026-01-18 12:00:00',18,18,2),
('2026-01-19','2026-02-19',1,'2026-01-19 12:00:00',19,19,1),
('2026-01-20','2026-02-20',2,'2026-01-20 12:00:00',20,20,1);


-- ACESSOS

INSERT INTO ACESSO_SISTEMA
(data_hora, ip_acesso, dispositivo, navegador, id_cliente)
VALUES
('2026-01-01 20:00:00','192.168.0.1','Android','Chrome',1),
('2026-01-02 20:00:00','192.168.0.2','Android','Chrome',2),
('2026-01-03 20:00:00','192.168.0.3','Android','Chrome',3),
('2026-01-04 20:00:00','192.168.0.4','Android','Chrome',4),
('2026-01-05 20:00:00','192.168.0.5','Android','Chrome',5),
('2026-01-06 20:00:00','192.168.0.6','Android','Chrome',6),
('2026-01-07 20:00:00','192.168.0.7','Android','Chrome',7),
('2026-01-08 20:00:00','192.168.0.8','Android','Chrome',8),
('2026-01-09 20:00:00','192.168.0.9','Android','Chrome',9),
('2026-01-10 20:00:00','192.168.0.10','Android','Chrome',10),
('2026-01-11 20:00:00','192.168.0.11','Android','Chrome',11),
('2026-01-12 20:00:00','192.168.0.12','Android','Chrome',12),
('2026-01-13 20:00:00','192.168.0.13','Android','Chrome',13),
('2026-01-14 20:00:00','192.168.0.14','Android','Chrome',14),
('2026-01-15 20:00:00','192.168.0.15','Android','Chrome',15),
('2026-01-16 20:00:00','192.168.0.16','Android','Chrome',16),
('2026-01-17 20:00:00','192.168.0.17','Android','Chrome',17),
('2026-01-18 20:00:00','192.168.0.18','Android','Chrome',18),
('2026-01-19 20:00:00','192.168.0.19','Android','Chrome',19),
('2026-01-20 20:00:00','192.168.0.20','Android','Chrome',20);


-- HISTORICO

INSERT INTO HISTORICO_ASSINATURA
(data_alteracao, tipo_alteracao, observacao, id_assinatura, id_admin)
VALUES
('2026-01-01 09:00:00','CRIACAO','Assinatura criada',1,1),
('2026-01-02 09:00:00','RENOVACAO','Renovação efetuada',2,2),
('2026-01-03 09:00:00','ALTERACAO','Plano alterado',3,3),
('2026-01-04 09:00:00','CRIACAO','Assinatura criada',4,4),
('2026-01-05 09:00:00','SUSPENSAO','Assinatura suspensa',5,5),
('2026-01-06 09:00:00','CRIACAO','Assinatura criada',6,6),
('2026-01-07 09:00:00','RENOVACAO','Renovação efetuada',7,7),
('2026-01-08 09:00:00','ALTERACAO','Plano alterado',8,8),
('2026-01-09 09:00:00','CRIACAO','Assinatura criada',9,9),
('2026-01-10 09:00:00','RENOVACAO','Renovação efetuada',10,10),
('2026-01-11 09:00:00','CRIACAO','Assinatura criada',11,11),
('2026-01-12 09:00:00','ALTERACAO','Plano alterado',12,12),
('2026-01-13 09:00:00','RENOVACAO','Renovação efetuada',13,13),
('2026-01-14 09:00:00','CRIACAO','Assinatura criada',14,14),
('2026-01-15 09:00:00','SUSPENSAO','Assinatura suspensa',15,15),
('2026-01-16 09:00:00','CRIACAO','Assinatura criada',16,16),
('2026-01-17 09:00:00','RENOVACAO','Renovação efetuada',17,17),
('2026-01-18 09:00:00','ALTERACAO','Plano alterado',18,18),
('2026-01-19 09:00:00','CRIACAO','Assinatura criada',19,19),
('2026-01-20 09:00:00','RENOVACAO','Renovação efetuada',20,20);
