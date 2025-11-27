idEspecialidade SERIAL PRIMARY KEY,


-- 1. Listar todas as consultas com detalhes completos
SELECT 
    c.idConsulta,
    p.nome AS paciente,
    m.nome AS medico,
    e.nomeEspecialidade,
    c.data,
    c.hora,
    c.status,
    c.observacoes
FROM Consulta c
INNER JOIN Paciente p ON c.idPaciente = p.idPaciente
INNER JOIN Medico m ON c.idMedico = m.idMedico
INNER JOIN Especialidade e ON c.idEspecialidade = e.idEspecialidade
ORDER BY c.data DESC;

-- 2. Listar atendimentos realizados com detalhes
SELECT 
    a.idAtendimento,
    c.idConsulta,
    p.nome AS paciente,
    m.nome AS medico,
    a.descricao,
    a.dataHora
FROM Atendimento a
INNER JOIN Consulta c ON a.idConsulta = c.idConsulta
INNER JOIN Paciente p ON c.idPaciente = p.idPaciente
INNER JOIN Medico m ON c.idMedico = m.idMedico;

-- 3. Consultas por especialidade (resumo)
SELECT 
    e.nomeEspecialidade,
    COUNT(c.idConsulta) AS total_consultas,
    COUNT(CASE WHEN c.status = 'Agendada' THEN 1 END) AS agendadas,
    COUNT(CASE WHEN c.status = 'Realizada' THEN 1 END) AS realizadas,
    COUNT(CASE WHEN c.status = 'Cancelada' THEN 1 END) AS canceladas
FROM Especialidade e
LEFT JOIN Consulta c ON e.idEspecialidade = c.idEspecialidade
GROUP BY e.idEspecialidade, e.nomeEspecialidade;

-- 4. Desempenho dos médicos (número de consultas)
SELECT 
    m.nome,
    m.especialidade,
    COUNT(c.idConsulta) AS consultas_totais,
    COUNT(CASE WHEN c.status = 'Realizada' THEN 1 END) AS realizadas,
    COUNT(CASE WHEN c.status = 'Agendada' THEN 1 END) AS agendadas
FROM Medico m
LEFT JOIN Consulta c ON m.idMedico = c.idMedico
GROUP BY m.idMedico, m.nome, m.especialidade
ORDER BY consultas_totais DESC;

-- 5. Pacientes com mais consultas
SELECT 
    p.nome,
    p.email,
    p.telefone,
    COUNT(c.idConsulta) AS total_consultas
FROM Paciente p
LEFT JOIN Consulta c ON p.idPaciente = c.idPaciente
GROUP BY p.idPaciente, p.nome, p.email, p.telefone
HAVING COUNT(c.idConsulta) > 0
ORDER BY total_consultas DESC;

-- 6. Próximas consultas agendadas (ordenadas por data)
SELECT 
    c.data,
    c.hora,
    p.nome AS paciente,
    m.nome AS medico,
    e.nomeEspecialidade,
    c.status
FROM Consulta c
INNER JOIN Paciente p ON c.idPaciente = p.idPaciente
INNER JOIN Medico m ON c.idMedico = m.idMedico
INNER JOIN Especialidade e ON c.idEspecialidade = e.idEspecialidade
WHERE c.data >= CURDATE() AND c.status = 'Agendada'
ORDER BY c.data, c.hora;

-- 7. Histórico de atendimentos de um paciente
SELECT 
    c.idConsulta,
    c.data,
    c.hora,
    m.nome AS medico,
    e.nomeEspecialidade,
    c.status,
    a.descricao AS resultado_atendimento,
    a.dataHora
FROM Consulta c
LEFT JOIN Medico m ON c.idMedico = m.idMedico
LEFT JOIN Especialidade e ON c.idEspecialidade = e.idEspecialidade
LEFT JOIN Atendimento a ON c.idConsulta = a.idConsulta
WHERE c.idPaciente = 1
ORDER BY c.data DESC;

-- 8. Médicos disponíveis em uma especialidade específica
SELECT DISTINCT
    m.nome,
    m.especialidade,
    m.email,
    m.telefone
FROM Medico m
WHERE m.especialidade LIKE '%Cardiologia%'
ORDER BY m.nome;

-- 9. Distribuição de consultas por mês
SELECT 
    MONTH(c.data) AS mes,
    YEAR(c.data) AS ano,
    COUNT(c.idConsulta) AS total_consultas
FROM Consulta c
GROUP BY YEAR(c.data), MONTH(c.data)
ORDER BY ano DESC, mes DESC;

-- 10. Taxa de realização vs cancelamento de consultas
SELECT 
    COUNT(c.idConsulta) AS total_consultas,
    COUNT(CASE WHEN c.status = 'Realizada' THEN 1 END) AS realizadas,
    COUNT(CASE WHEN c.status = 'Cancelada' THEN 1 END) AS canceladas,
    COUNT(CASE WHEN c.status = 'Agendada' THEN 1 END) AS agendadas,
    ROUND(COUNT(CASE WHEN c.status = 'Realizada' THEN 1 END) * 100.0 / COUNT(c.idConsulta), 2) AS percentual_realizacao
FROM Consulta c;

