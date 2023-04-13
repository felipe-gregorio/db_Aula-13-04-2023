
CREATE TABLE vendas(
	id SERIAL PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	funcionario VARCHAR(50) NOT NULL,
	vendas NUMERIC(6, 2) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	preco float NOT NULL,
	categoria VARCHAR(50) NOT NULL
);

INSERT INTO vendas(funcionario, vendas, data) VALUES ('Jucilei', 20, '2023/04/13');
INSERT INTO vendas(funcionario, vendas, data) VALUES ('Lucio', 21, '2023/04/13');

INSERT INTO produtos(nome, preco, categoria) VALUES ('churrasqueira', 224.99, 'casa');
INSERT INTO produtos(nome, preco, categoria) VALUES ('antivirus', 29.90, 'tecnologia');

CREATE INDEX idx_func ON vendas (funcionario);
CREATE INDEX idx_cat ON produtos (categoria);

CREATE TABLE log_vendas(
	id int PRIMARY KEY,
	mensagem VARCHAR(100),
	data_registro TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION vendas_log_venda()
	RETURNS TRIGGER AS $$
	BEGIN
		INSERT INTO log_vendas (mensagem) VALUES ('Nova linha inserida');
		RETURN NEW;
	END;
 $$ LANGUAGE 'plpgsql';
		
CREATE TRIGGER log_trigger 
AFTER INSERT ON vendas 
FOR EACH ROW
EXECUTE PROCEDURE vendas_log_venda();

CREATE USER LewisHamilton encrypted password '123';
CREATE USER CharlesLeclerc encrypted password '123';
CREATE USER PierreGasly encrypted password '123';

SELECT *FROM pg_catalog.pg_tables WHERE shemaname = 'public';
SELECT *FROM pg_catalog.pg_index WHERE shemaname = 'public';

SELECT *FROM pg_catalog.pg_user;
SELECT *FROM pg_catalog.pg_trigger;

