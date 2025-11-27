# ClinicMaster – Sistema de Gerenciamento Clínico
## Experiência Prática 4 - Banco de Dados Relacional

### Descrição do Projeto
Sistema completo para gerenciar atendimentos, cadastros de pacientes e agendamentos médicos de uma clínica.

### Estrutura do Projeto
```
ClinicMaster/
├── README.md (este arquivo)
├── 01_create_tables.sql (criar tabelas)
├── 02_insert_data.sql (inserir dados)
├── 03_queries.sql (consultas básicas)
├── 04_update_delete.sql (atualizar e deletar)
└── 05_consultas_especificas.sql (consultas avançadas)
```

### Como Usar no VS Code

#### Pré-requisitos
1. **Visual Studio Code** instalado
2. **Extensão SQLTools** instalada (Ctrl+Shift+X → procure "SQLTools")
3. **SGBD instalado:**
   - MySQL 8.0 ou PostgreSQL
   - (ou SQLite sem instalação adicional)

#### Passos para Conectar e Rodar

1. **Instale a extensão SQLTools:**
   - Abra VS Code
   - Vá para Extensões (Ctrl+Shift+X)
   - Busque "SQLTools"
   - Instale "SQLTools" e "SQLTools Driver for MySQL" (ou PostgreSQL)

2. **Configure a conexão:**
   - Abra a seção SQLTools (ícone de banco de dados na lateral)
   - Clique em "Add Connection"
   - Escolha seu SGBD (MySQL, PostgreSQL, SQLite)
   - Preencha: Host (localhost), Port, Username, Password
   - Clique em "Test Connection" e depois "Save"

3. **Abra o arquivo SQL:**
   - Abra `01_create_tables.sql` no VS Code
   - Clique com botão direito → "Run Query" ou pressione Ctrl+Shift+E
   - Verá o resultado em "OUTPUT"

4. **Repita para cada arquivo em ordem:**
   - 01_create_tables.sql (criar estrutura)
   - 02_insert_data.sql (popular dados)
   - 03_queries.sql (testar consultas)
   - 04_update_delete.sql (testar updates/deletes)
   - 05_consultas_especificas.sql (consultas complexas)

### Principais Tabelas
- **Paciente**: Dados dos pacientes
- **Médico**: Profissionais médicos
- **Especialidade**: Áreas de especialização
- **Consulta**: Agendamentos e consultas
- **Atendimento**: Detalhes do atendimento
- **Usuário**: Usuários do sistema

### Guia Rápido de Comandos SQL Usados
- `CREATE TABLE`: Define tabelas e suas colunas
- `INSERT INTO`: Adiciona dados
- `SELECT`: Recupera dados
- `UPDATE`: Modifica dados
- `DELETE`: Remove dados
- `JOIN`: Combina dados de múltiplas tabelas
- `GROUP BY`, `COUNT`, `SUM`: Agregações de dados

### Dúvidas ou Erros?
Se encontrar erros de sintaxe, verifique:
- Se o SGBD está conectado
- Se os dados já não existem (chave primária duplicada)
- Se o número de colunas é correto no INSERT

---
**Última atualização**: 26/11/2025
