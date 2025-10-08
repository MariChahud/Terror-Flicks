DROP DATABASE IF EXISTS locacao_dvds;

CREATE DATABASE IF NOT EXISTS locacao_dvds;
USE locacao_dvds;

CREATE TABLE IF NOT EXISTS genero (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS classificacao_etaria (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ator (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  data_estreia DATE NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS dvd (
  id INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  ano_lancamento INT NOT NULL,
  ator_principal_id INT NOT NULL,
  ator_coadjuvante_id INT NOT NULL,
  data_lancamento DATE NOT NULL,
  duracao_minutos INT NOT NULL,
  classificacao_etaria_id INT NOT NULL,
  genero_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_dvd_ator_principal_idx (ator_principal_id ASC),
  INDEX fk_dvd_ator_coadjuvante_idx (ator_coadjuvante_id ASC),
  INDEX fk_dvd_classificacao_etaria_idx (classificacao_etaria_id ASC),
  INDEX fk_dvd_genero_idx (genero_id ASC),
  CONSTRAINT fk_dvd_ator_principal
    FOREIGN KEY (ator_principal_id)
    REFERENCES ator (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_dvd_ator_coadjuvante
    FOREIGN KEY (ator_coadjuvante_id)
    REFERENCES ator (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_dvd_classificacao_etaria
    FOREIGN KEY (classificacao_etaria_id)
    REFERENCES classificacao_etaria (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_dvd_genero
    FOREIGN KEY (genero_id)
    REFERENCES genero (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


INSERT INTO genero (descricao) 
VALUES 
('Comédia'),
('Drama'),
('Terror'),
('Romance'),
('Ficção Científica');


ALTER TABLE dvd
ADD COLUMN url_cartaz VARCHAR(255) NULL AFTER titulo;
