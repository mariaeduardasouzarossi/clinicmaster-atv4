idEspecialidade SERIAL PRIMARY KEY,


-- Inserir especialidades
INSERT INTO Especialidade (nomeEspecialidade) VALUES
('Pediatria'),
('Cardiologia'),
('Dermatologia'),
('Oftalmologia'),
('Ortopedia'),
('Clínica Geral');

-- Inserir pacientes
INSERT INTO Paciente (nome, dataNascimento, genero, telefone, email, endereco) VALUES
('João Silva', '1990-05-10', 'M', '11998998888', 'joao.silva@email.com', 'Rua A, 123, São Paulo'),
('Maria Santos', '1985-03-22', 'F', '11987654321', 'maria.santos@email.com', 'Avenida B, 456, São Paulo'),
('Pedro Oliveira', '1995-07-15', 'M', '11991234567', 'pedro.oliveira@email.com', 'Rua C, 789, São Paulo'),
('Ana Costa', '1988-11-30', 'F', '11985556666', 'ana.costa@email.com', 'Avenida D, 321, São Paulo'),
('Carlos Sousa', '1992-09-05', 'M', '11999887766', 'carlos.sousa@email.com', 'Rua E, 654, São Paulo');

-- Inserir médicos
INSERT INTO Medico (nome, especialidade, telefone, email) VALUES
('Dra. Paula Mendes', 'Pediatria', '11999999999', 'paula.mendes@hospital.com'),
('Dr. Roberto Silva', 'Cardiologia', '11988888888', 'roberto.silva@hospital.com'),
('Dra. Fernanda Lima', 'Dermatologia', '11977777777', 'fernanda.lima@hospital.com'),
('Dr. Gustavo Santos', 'Oftalmologia', '11966666666', 'gustavo.santos@hospital.com'),
('Dra. Juliana Costa', 'Ortopedia', '11955555555', 'juliana.costa@hospital.com');

-- Inserir usuários
INSERT INTO Usuario (nomeUsuario, senha, tipoPerfil) VALUES
('admin', '123456', 'Admin'),
('recepcionista1', '123456', 'Recepcionista'),
('medico1', '123456', 'Médico'),
('medico2', '123456', 'Médico'),
('gerente', '123456', 'Gerente');

-- Inserir consultas
INSERT INTO Consulta (idPaciente, idMedico, idEspecialidade, data, hora, status, observacoes) VALUES
(1, 1, 1, '2025-12-01', '09:00:00', 'Agendada', 'Primeira consulta - Verificar saúde geral'),
(2, 2, 2, '2025-12-02', '10:30:00', 'Agendada', 'Acompanhamento cardíaco'),
(3, 3, 3, '2025-12-03', '14:00:00', 'Realizada', 'Tratamento de acne'),
(4, 4, 4, '2025-12-04', '15:30:00', 'Agendada', 'Exame de visão'),
(5, 5, 5, '2025-12-05', '11:00:00', 'Cancelada', 'Paciente solicitou cancelamento');

-- Inserir atendimentos
INSERT INTO Atendimento (idConsulta, descricao, dataHora) VALUES
(3, 'Consulta realizada com sucesso. Paciente apresenta melhora no quadro dermatológico.', '2025-11-25 14:00:00');


