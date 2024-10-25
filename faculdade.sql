CREATE DATABASE faculdade;

USE faculdade;

CREATE TABLE tab_aluno (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `data_nascimento` DATE NULL,
    `cpf` VARCHAR(14) NULL,
    `endereco_aluno_id` INT NOT NULL,
    `contato_aluno_id` INT NOT NULL,
    `tab_curso_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
    INDEX `fk_aluno_endereco_aluno_idx` (`endereco_aluno_id`),
    INDEX `fk_aluno_contato_aluno1_idx` (`contato_aluno_id`),
    INDEX `fk_aluno_tab_curso1_idx` (`tab_curso_id`),
    CONSTRAINT `fk_aluno_endereco_aluno`
        FOREIGN KEY (`endereco_aluno_id`) REFERENCES `tab_endereco_aluno` (`id`),
    CONSTRAINT `fk_aluno_contato_aluno1`
        FOREIGN KEY (`contato_aluno_id`) REFERENCES `tab_contato_aluno` (`id`),
    CONSTRAINT `fk_aluno_tab_curso1`
        FOREIGN KEY (`tab_curso_id`) REFERENCES `tab_curso` (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_endereco_aluno (
    `id` INT NOT NULL AUTO_INCREMENT,
    `bairro` VARCHAR(45) NULL,
    `cidade` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_contato_aluno (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NULL,
    `telefone` VARCHAR(15) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_curso (
    `id` INT NOT NULL AUTO_INCREMENT,
    `carga_horaria` INT NULL,
    `duracao` INT NULL,
    `nome` VARCHAR(45) NULL,
    `coordenador` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_nota (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nota` DECIMAL(5,2) NULL,
    `semestre` DECIMAL(5,2) NULL,
    `aluno_id` INT NOT NULL,
    `tab_disciplina_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_tab_nota_aluno1_idx` (`aluno_id`),
    INDEX `fk_tab_nota_tab_disciplina1_idx` (`tab_disciplina_id`),
    CONSTRAINT `fk_tab_nota_aluno1`
        FOREIGN KEY (`aluno_id`) REFERENCES `tab_aluno` (`id`),
    CONSTRAINT `fk_tab_nota_tab_disciplina1`
        FOREIGN KEY (`tab_disciplina_id`) REFERENCES `tab_disciplina` (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_turmas (
    `id` INT NOT NULL AUTO_INCREMENT,
    `codigo_turma` VARCHAR(10) NULL,
    `ano` INT NULL,
    `semestre` INT NULL,
    `tab_disciplina_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `codigo_turma_UNIQUE` (`codigo_turma` ASC),
    INDEX `fk_tab_turmas_tab_disciplina1_idx` (`tab_disciplina_id`),
    CONSTRAINT `fk_tab_turmas_tab_disciplina1`
        FOREIGN KEY (`tab_disciplina_id`) REFERENCES `tab_disciplina` (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_disciplina (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NULL,
    `carga_horaria` INT NULL,
    `professores_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_tab_disciplina_professores1_idx` (`professores_id`),
    CONSTRAINT `fk_tab_disciplina_professores1`
        FOREIGN KEY (`professores_id`) REFERENCES `tab_professores` (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_professores (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NULL,
    `cpf` VARCHAR(14) NULL,
    `endereco_professor_id` INT NOT NULL,
    `contato_professor_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
    INDEX `fk_professores_endereco_professor1_idx` (`endereco_professor_id`),
    INDEX `fk_professores_contato_professor1_idx` (`contato_professor_id`),
    CONSTRAINT `fk_professores_endereco_professor1`
        FOREIGN KEY (`endereco_professor_id`) REFERENCES `tab_endereco_professor` (`id`),
    CONSTRAINT `fk_professores_contato_professor1`
        FOREIGN KEY (`contato_professor_id`) REFERENCES `tab_contato_professor` (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_endereco_professor (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cidade` VARCHAR(45) NULL,
    `bairro` VARCHAR(45) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE tab_contato_professor (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(45) NULL,
    `telefone` VARCHAR(15) NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;
