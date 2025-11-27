SET search_path TO public;

CREATE TABLE Especialidade (
    idEspecialidade SERIAL PRIMARY KEYAUTO_INCREMENT,
    nomeEspecialidade VARCHAR(100) NOT NULL UNIQUE
);

-- Criar tabela de Pacientes
CREATE TABLE Paciente (
    idPaciente SERIAL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL,
    genero CHAR(1),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

-- Criar tabela de Médicos
CREATE TABLE Medico (
    idMedico SERIAL PRIMARY KEYAUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criar tabela de Usuários
CREATE TABLE Usuario (
    idUsuario SERIAL PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    tipoPerfil VARCHAR(50)
);

-- Criar tabela de Consultas
CREATE TABLE Consulta (
    idConsulta SERIAL PRIMARY KEY AUTO_INCREMENT,
    idPaciente INT NOT NULL,
    idMedico INT NOT NULL,
    idEspecialidade INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    status VARCHAR(50),
    observacoes TEXT,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES Medico(idMedico),
    FOREIGN KEY (idEspecialidade) REFERENCES Especialidade(idEspecialidade)
);

-- Criar tabela de Atendimentos
CREATE TABLE Atendimento (
    idAtendimento SERIAL PRIMARY KEY AUTO_INCREMENT,
    idConsulta INT NOT NULL UNIQUE,
    descricao TEXT,
    dataHora DATETIME,
    FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta)
);

