CREATE DATABASE bd_vsconnect;

/*Usa o banco de dados selecionado*/
USE bd_vsconnect; 

/*Tabela de techs*/
CREATE TABLE tb_techs(
	id_tech BINARY(16) NOT NULL,
	nome VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY(id_tech)
);

/*Comando deletar tabela*/
/*DROP TABLE tb_techs;*/

/*Tabela de usuarios*/
CREATE TABLE tb_usuarios(
	id_usuario BINARY(16) NOT NULL,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	endereco VARCHAR(255),
	cep VARCHAR(9),
	tipo_usuario TINYINT NOT NULL,
	PRIMARY KEY(id_usuario)
);

CREATE TABLE tb_dev_tech(
	id_dev BINARY(16) NOT NULL,
	id_tech BINARY(16) NOT NULL,
	FOREIGN KEY(id_dev) REFERENCES tb_usuarios(id_usuario),
	FOREIGN KEY(id_tech) REFERENCES tb_techs(id_tech)
);

/*Tabela Servicos*/
CREATE TABLE tb_servicos(
	id_servico BINARY(16) NOT NULL,
	titulo VARCHAR(255) not null,
	descricao TEXT NOT NULL,
	proposta DECIMAL(10, 2) NOT NULL,
	status_servico VARCHAR(50) NOT NULL,
	d_cliente BINARY(16) NOT NULL,
	id_dev BINARY(16),
	PRIMARY KEY(id_servico),
	FOREIGN KEY(id_cliente) REFERENCES tb_usuarios(id_usuario),
	FOREIGN KEY(id_dev) REFERENCES tb_usuarios(id_usuario)
);

/*Tabela da cotacao*/
CREATE TABLE tb_cotacao(
	id_cotacao BINARY(16) NOT NULL,
	valor DECIMAL(10, 2) NOT NULL,
	id_dev BINARY(16) NOT NULL,
	id_servico BINARY(16) NOT NULL,
	PRIMARY KEY(id_cotacao),
	FOREIGN KEY(id_dev) REFERENCES tb_usuarios(id_usuario),
	FOREIGN KEY(id_servico) REFERENCES tb_servicos(id_servico)
);

/*Tabela da servico tech*/
CREATE TABLE tb_tech_servico(
	id_tech BINARY(16) NOT NULL,
	id_servico BINARY(16) NOT NULL,
	FOREIGN KEY(id_tech) REFERENCES tb_techs(id_tech),
	FOREIGN KEY(id_servico) REFERENCES tb_servicos(id_servico)
);
