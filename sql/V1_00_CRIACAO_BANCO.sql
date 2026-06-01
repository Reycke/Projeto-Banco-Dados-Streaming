CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    usuario_consulta VARCHAR(50) UNIQUE,
    data_cadastro DATE,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE PLANO (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    quantidade_acessos INT,
    descricao VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE STATUS_ASSINATURA (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(30) NOT NULL
);

CREATE TABLE ASSINATURA (
    id_assinatura INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE,
    data_vencimento DATE,
    conexoes_ativas INT,
    ultimo_acesso DATETIME,
    id_cliente INT NOT NULL,
    id_plano INT NOT NULL,
    id_status INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_plano) REFERENCES PLANO(id_plano),
    FOREIGN KEY (id_status) REFERENCES STATUS_ASSINATURA(id_status)
);

CREATE TABLE ACESSO_SISTEMA (
    id_acesso INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME,
    ip_acesso VARCHAR(45),
    dispositivo VARCHAR(100),
    navegador VARCHAR(100),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ADMINISTRADOR (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) UNIQUE,
    senha_hash VARCHAR(255),
    nivel_acesso VARCHAR(30),
    ultimo_login DATETIME,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE HISTORICO_ASSINATURA (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    data_alteracao DATETIME,
    tipo_alteracao VARCHAR(50),
    observacao VARCHAR(255),
    id_assinatura INT NOT NULL,
    id_admin INT NOT NULL,
    FOREIGN KEY (id_assinatura) REFERENCES ASSINATURA(id_assinatura),
    FOREIGN KEY (id_admin) REFERENCES ADMINISTRADOR(id_admin)
);
