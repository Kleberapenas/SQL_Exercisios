-- Levantamento dos Requisitos
-- Identificação de entidades e Relacionamentos
-- Modelo E-R(Entidade de relacionmento)
-- Diagrama E-R
-- Dicionario de Dados Normalização
-- Implementação
-- Testes Básicos

 -- Regras de Negócio
- Alunos podem trancar matrícula, não estando esntão matriculados em nenhuma disciplina no semestre.
- Em cada semetre cada aluno pode se matricular em no máximo 6 disciplinas
-- O aluno só pode ser reprovado no máximo 2 vezes na mesma disciplina
- A universidade terá no máximo 2000 alunos matriculados simultaneamente, em 6 cursos distintos
- Entrar 200 alunos por ano
- 60 disciplinas disponiveis
- Um historico escolar traz rodas as disciplinas cursadas por um aluno, incluindo nota final, frequência e período do curso realizado
- existem 30 professores trabalhando na escola
- Cada professor irá lecionar no máximo 3 disciplinas diferentes
- Cada professor é vindiculado a um departamento
- professores são indentifcado por um código de professor

1. Um aluno so pode estar matriculado em um curso por vezes

2. Alunos Possuem um codigo de Identificação

3. Cursos são compostos por várias disciplinas

4. Cada disciplinaterá no máximo 28 alunos por turma

5. As disciplinas podem ser obrigatorias ou optativas, dependendo do curso

6. As disciplinas pertencem a departamentos especificos

7. Cada disciplina possui um código de identificação

8. alunos podem trancar matrícula, não estando então matriculados em nenhuma disciplina no semestre

9. Em cada semestre, cada aluno pode se matricular em no máximo 8 disciplinas

10. O aluno só pode ser reprovado no máximo 3 vezes na mesma disciplina

11. A universidade terá no máximo 2000 alunos matriculados simultaneamente, em 8 cursos distintos

12. Entram 200 alunos novos por ano

13. Existem 64 disciplinas no total disponíveis

14. Um Historico escolar traz todas as disciplinas cursadas por um aluno, incluindo nota final, frequência e período do curso realizado

15. Professores podem ser cadastrados mesmo sem lecionar disciplinas

16. Existem 30 professores trabalhando na escola

17. Cada professor irá lecionar no máximo 3 disciplinas diferentes

18. Cada professor é vinculado a um departamento

19. Professores são identificados por um código de professor

--entidades
Alunos
disciplinas
Cursos
departamentos
historicos
professores
turma

--Vinculos
Aluno está matriculao em cursos
disciplina pertence a curso
aluno cura disciplina
departamento é responsavel por disciplina
historico contem as disciplinas
historico pertence aos alunos
professor lesciona 0 a 3 disciplinas
professor é vinculado a departamento
Aluno pertence a turma
curso gera turma

-- Atributos
Alunos
	RA
	nome_aluno
	sobrenome_aluno
	data_nascimento
	telefone_celular
	telefone_residencial
	telefone_comercial
	telefone_recado
	e-mail_pessoal
	e-mail_corporativo
	endereço
		cep
		rua
		numero
		bairro
		cidade
		estado
	genero
	nome_mãe
	nome_pai
	estado_civil
	naturalidade
	status
	deficiencia
	data_ingresso
professor
	cod_professor
	nome_professor
	sobrenome_professor
	data_contratacao
	tipo_vinculo
	CPF
	RG
	titulacao
	rua
	numero
	bairro
	cidade
	estadi
	CEP
	telefone_celular
	telefone_residencial
	telefone_comercial
	telefone_recado
	e-mail_pessoal
	e-mail_corporativo
	cod_departamento
	status_professor
curso
	Cod_Curso
	nome_curso
	tipo
	duracao_meses
	cod_departamento
	turno
	carga_horaria_total
	modalidade
	cod_prof_coordenador
departamento
	cod_departamento
	nome_departamento
	cod_professor
	cod_Curso
disciplinas
	cod_disciplinas
	nome_disciplina
	pre_requisitos
	cod_departamento
	carga_horaria
	cod_Curso
historico
	cod_historico
	RA_aluno
	nota
	média
	frequência
	situacao
	semestre
	ano
turma
	Cod_Turma
	Cod_Curso
	sala
	ano
	semestre
	cod_disciplina
	cod_professor
	periodo
	num_alunos
	data_inicio
	data_fim
matricula
	cod_matricula
	ra_aluno
	Cod_Turma
	data_matricula
	data_cancelamento
	status_matricula
