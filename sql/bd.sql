CREATE DATABASE lanch; 
USE lanch; 
CREATE TABLE cadastro ( 
    id_cadastro INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_email VARCHAR(45) NOT NULL, 
    id_senha VARCHAR(12) NOT NULL, 
    cliente_id_cliente INT(5) NOT NULL, 
    funcionario_id_funcionario INT(5) NOT NULL, 
    CONSTRAINT fk_cad_cli FOREIGN KEY (cliente_id_cliente) REFERENCES cliente (id_cliente), 
    CONSTRAINT fk_cad_func FOREIGN KEY (funcionario_id_funcionario) REFERENCES funcionario (id_funcionario) 
); 
 
CREATE TABLE cliente ( 
    id_cliente INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_nome_cliente VARCHAR(45) NOT NULL, 
    id_email VARCHAR(45) NOT NULL, 
    id_senha VARCHAR(12) NOT NULL, 
    itens_id_cod_produto INT(2) NOT NULL, 
    CONSTRAINT fk_cad_itens FOREIGN KEY (itens_id_cod_produto) REFERENCES itens (id_itens) 
); 
 
CREATE TABLE funcionario ( 
    id_funcionario INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_nome_funcionario VARCHAR(45) NOT NULL, 
    id_email VARCHAR(45) NOT NULL, 
    id_senha VARCHAR(12) NOT NULL 
); 

CREATE TABLE itens ( 
    id_itens INT(2) NOT NULL PRIMARY KEY 
); 
 
CREATE TABLE produtos ( 
    id_codigo_produto INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_salgados VARCHAR(25) NOT NULL, 
    id_doces VARCHAR(25) NOT NULL, 
    id_bebidas VARCHAR(25) NOT NULL, 
    pedidos_id_cod_verificacao INT(5) NOT NULL, 
    pedidos_itens_idcodigo_produto INT(2) NOT NULL, 
    CONSTRAINT fk_cad_verif FOREIGN KEY (pedidos_id_cod_verificacao) REFERENCES pedidos (id_codigo_verificacao), 
    CONSTRAINT fk_cad_pedi FOREIGN KEY (pedidos_itens_idcodigo_produto) REFERENCES pedidos (itens_id_itens) 
); 
 
CREATE TABLE pedidos ( 
    id_codigo_verificacao INT(6) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    id_nome VARCHAR(25) NOT NULL, 
    id_RM INT(5), 
    funcionario_id_funcionario INT(5) NOT NULL, 
    itens_id_itens INT(2) NOT NULL, 
    CONSTRAINT fk_cad_func_ped FOREIGN KEY (funcionario_id_funcionario) REFERENCES funcionario (id_funcionario), 
    CONSTRAINT fk_cad_itens_ped FOREIGN KEY (itens_id_itens) REFERENCES itens (id_itens) 
);