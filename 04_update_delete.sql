idEspecialidade SERIAL PRIMARY KEY,

-- === ATUALIZAÇÕES (UPDATE) ===

-- 1. Atualizar telefone de um paciente
UPDATE Paciente SET telefone = '11911111111' WHERE idPaciente = 1;

-- 2. Atualizar status de uma consulta para realizada
UPDATE Consulta SET status = 'Realizada' WHERE idConsulta = 2;

-- 3. Atualizar email de um médico
UPDATE Medico SET email = 'novo.email@hospital.com' WHERE idMedico = 1;

-- 4. Atualizar endereço de um paciente
UPDATE Paciente SET endereco = 'Rua Nova, 999, São Paulo' WHERE idPaciente = 3;

-- 5. Atualizar status de múltiplas consultas agendadas para hoje
UPDATE Consulta SET status = 'Realizada' WHERE data = CURDATE() AND status = 'Agendada';

-- 6. Marcar todas as consultas como canceladas (cuidado!)
-- UPDATE Consulta SET status = 'Cancelada';

-- === EXCLUSÕES (DELETE) ===

-- 1. Deletar um atendimento específico (cuidado com FK!)
-- DELETE FROM Atendimento WHERE idAtendimento = 1;

-- 2. Deletar uma consulta cancelada
-- DELETE FROM Consulta WHERE status = 'Cancelada';

-- 3. Deletar um usuário específico
-- DELETE FROM Usuario WHERE idUsuario = 5;

-- 4. Deletar um paciente que não tem consultas
-- DELETE FROM Paciente WHERE idPaciente = 5;

-- ========================================
-- CUIDADOS COM DELETE:
-- - Sempre verificar Foreign Keys (FK)
-- - Deletar primeiro registros dependentes
-- - Ex: Deletar Atendimento antes de Consulta
-- - Usar WHERE para ser específico
-- ========================================

-- Exemplo seguro: Deletar um paciente sem consultas
-- DELETE FROM Paciente WHERE idPaciente NOT IN (SELECT DISTINCT idPaciente FROM Consulta);

-- ========================================
-- FIM DAS ATUALIZAÇÕES E EXCLUSÕES
-- Execute este arquivo QUARTO (teste com cuidado!)
-- ========================================
