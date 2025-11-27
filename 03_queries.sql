idEspecialidade SERIAL PRIMARY KEY,


-- 1. Listar todos os pacientes
SELECT * FROM Paciente;

-- 2. Listar todos os médicos
SELECT * FROM Medico;

-- 3. Contar quantos pacientes existem
SELECT COUNT(*) AS total_pacientes FROM Paciente;

-- 4. Contar quantas consultas foram agendadas
SELECT COUNT(*) AS consultas_agendadas FROM Consulta WHERE status = 'Agendada';

-- 5. Listar pacientes do sexo feminino
SELECT nome, email, telefone FROM Paciente WHERE genero = 'F';

-- 6. Listar consultas com status realizada
SELECT * FROM Consulta WHERE status = 'Realizada';

-- 7. Listar especialidades em ordem alfabética
SELECT * FROM Especialidade ORDER BY nomeEspecialidade;

-- 8. Buscar paciente por nome
SELECT * FROM Paciente WHERE nome LIKE '%João%';

-- 9. Contar quantas consultas cada médico tem
SELECT m.nome, COUNT(c.idConsulta) AS total_consultas 
FROM Medico m 
LEFT JOIN Consulta c ON m.idMedico = c.idMedico 
GROUP BY m.idMedico, m.nome;

-- 10. Listar dados de uma consulta com informações do paciente e médico
SELECT 
    c.idConsulta,
    p.nome AS paciente,
    m.nome AS medico,
    e.nomeEspecialidade,
    c.data,
    c.hora,
    c.status
FROM Consulta c
JOIN Paciente p ON c.idPaciente = p.idPaciente
JOIN Medico m ON c.idMedico = m.idMedico
JOIN Especialidade e ON c.idEspecialidade = e.idEspecialidade;

-- 11. Contar consultas por status
SELECT status, COUNT(*) AS total FROM Consulta GROUP BY status;

-- 12. Listar pacientes com mais de 30 anos
SELECT nome, dataNascimento, YEAR(CURDATE()) - YEAR(dataNascimento) AS idade 
FROM Paciente 
WHERE YEAR(CURDATE()) - YEAR(dataNascimento) > 30;

-- 13. Listar usuários do tipo Médico
SELECT nomeUsuario, tipoPerfil FROM Usuario WHERE tipoPerfil = 'Médico';

-- 14. Buscar consultas de um paciente específico (João Silva)
SELECT 
    c.idConsulta,
    p.nome,
    m.nome AS medico,
    c.data,
    c.hora
FROM Consulta c
JOIN Paciente p ON c.idPaciente = p.idPaciente
JOIN Medico m ON c.idMedico = m.idMedico
WHERE p.nome = 'João Silva';

-- 15. Contar total de atendimentos registrados
SELECT COUNT(*) AS total_atendimentos FROM Atendimento;

-- ========================================
-- FIM DAS CONSULTAS BÁSICAS
-- Execute este arquivo TERCEIRO (após inserir dados)
-- ========================================
