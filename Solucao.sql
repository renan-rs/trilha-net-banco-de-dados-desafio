-- 1 Buscar o nome e ano dos filmes
select Nome, Ano from dbo.Filmes

-- 2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
select Nome, Ano, Duracao 
from dbo.Filmes
order by Ano

-- 3 Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
select Nome, Ano, Duracao 
from dbo.Filmes
where Nome = 'De Volta para o Futuro'

-- 4 Buscar os filmes lançados em 1997
select Nome, Ano, Duracao 
from dbo.Filmes
where Ano = 1997

-- 5 Buscar os filmes lançados APÓS o ano 2000
select Nome, Ano, Duracao 
from dbo.Filmes
where Ano > 2000

-- 6 Buscar os filmes com a duracao maior que 100 e menor que 150, 
--   ordenando pela duracao em ordem crescente
select Nome, Ano, Duracao 
from dbo.Filmes
where Duracao > 100 AND Duracao < 150
order by Duracao

-- 7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, 
--   ordenando pela duracao em ordem decrescente
select Ano, Count(*) Quantidade
from dbo.Filmes
group by Ano
order by Quantidade DESC

-- 8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
select PrimeiroNome, UltimoNome, Genero
from dbo.Atores
where Genero = 'M'

-- 9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, 
--   UltimoNome, e ordenando pelo PrimeiroNome
select PrimeiroNome, UltimoNome, Genero
from dbo.Atores
where Genero = 'F'

-- 10 Buscar o nome do filme e o gênero
select f.Nome, g.Genero
from dbo.Filmes f
INNER JOIN dbo.FilmesGenero fg ON f.Id = fg.IdFilme
INNER JOIN dbo.Generos g ON fg.IdGenero = g.Id

-- 11 Buscar o nome do filme e o gênero do tipo "Mistério"
select f.Nome, g.Genero
from dbo.Filmes f
INNER JOIN dbo.FilmesGenero fg ON f.Id = fg.IdFilme
INNER JOIN dbo.Generos g ON fg.IdGenero = g.Id
where g.Genero = 'Mistério'

-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
select f.Nome, a.PrimeiroNome, a.UltimoNome, ef.Papel
from dbo.Filmes f
INNER JOIN dbo.ElencoFilme ef ON f.Id = ef.IdFilme
INNER JOIN dbo.Atores a ON ef.IdAtor = a.Id
