/* QUESTAO 1*/
SELECT tb_curso.nome as curso, numero as turma, inicio
FROM tb_curso
INNER JOIN tb_turma ON tb_curso.id = tb_turma.curso_id

/*QUESTAO 2*/
SELECT DISTINCT tb_curso.nome as curso, tb_turma.numero as turma, tb_aluno.nome as aluno, tb_aluno.cpf as cpf
FROM tb_curso
INNER JOIN tb_turma ON tb_curso.id = tb_turma.curso_id
INNER JOIN tb_matricula ON tb_matricula.turma_id = tb_turma.id
INNER JOIN tb_aluno ON tb_aluno.cpf = tb_matricula.aluno_id
ORDER BY turma

/*QUESTAO 3*/
SELECT data, nota, nome, nota_obtida, ROUND((nota_obtida/nota*100), 2) AS porcentagem
FROM tb_avaliacao
INNER JOIN tb_resultado ON tb_avaliacao.id = tb_resultado.avaliacao_id
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
ORDER BY data DESC, nome ASC

/*QUESTAO 4*/
SELECT nome, SUM(nota_obtida) as total
FROM tb_resultado
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_turma ON tb_turma.id = tb_avaliacao.turma_id
WHERE numero = 10 AND avaliacao_id != 1 AND avaliacao_id != 2
GROUP BY nome
ORDER BY nome
