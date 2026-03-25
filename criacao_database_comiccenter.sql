--      === EXERCÍCIOS SOBRE JOINS ===

-- -> Criação do Banco de Dados ComicCenter:

drop schema if EXISTS ComicCenter;
create schema if not EXISTS ComicCenter;
use ComicCenter;

-- -> Criação das tabelas do ComicCenter:

create table if not exists ComicCenter.Cliente (
    Cliente_id int not null auto_increment,
    Nome varchar(45) not null,
    PRIMARY key (Cliente_id)
);

CREATE TABLE IF NOT EXISTS ComicCenter.Telefone (
    Cliente_id INT NOT NULL,
    Numero VARCHAR(45) NOT NULL,
    PRIMARY KEY (Numero),
    FOREIGN KEY (Cliente_id)
    REFERENCES ComicCenter.Cliente (Cliente_id));

create table if not exists ComicCenter.Email (
    Cliente_id int not null,
    Cliente_email varchar(45) not null,
    primary key (Cliente_email),
        Foreign Key (Cliente_id) REFERENCES ComicCenter.Cliente (Cliente_id)
);

create table if not exists ComicCenter.Funcionario (
    Funcionario_id int not null,
    Nome varchar(45) not null,
    primary key (Funcionario_id)
);

create table if not exists ComicCenter.Revista (
    Revista_id int not null,
    Titulo varchar(45) not null,
    Editora varchar(45) not null,
    primary key (Revista_id)
);

-- --> Inserção dos dados nas tabelas:

insert into ComicCenter.Cliente (Cliente_id, Nome)
values (1, 'Sheldon Cooper'), (2, 'Amy Farrah Fowler'),
(3, 'Leonard Hofstadter'), (4, 'Bernadette Maryann');

insert into ComicCenter.Telefone (Cliente_id, Numero)
values (1, '(19) 16044-3249'), (2, '(73) 45578-8629'),
(3, '(23) 57692-8688'), (4, '(62) 19832-5762');

insert into ComicCenter.Email (Cliente_id, Cliente_email)
values (1, 'protoncooper@scemail.com'), (2, 'badgirl@scemail.com'), 
(3, 'luckyman@scemail.com'),  (4, 'candybern@mbmail.com');

insert into ComicCenter.Funcionario (Funcionario_id, Nome)
values(1, 'Stuart Bloom'), (2, 'Sheldon Cooper'),
(3, 'Leonard Hofstadter'), (4, 'Raj Koothrappali');

insert into ComicCenter.Revista (Revista_id, Titulo, Editora)
values (1, 'Vingadores', 'Marvel'), (2, 'Liga da Justiça', 'DC Comics'),
(3, 'Batman', 'DC Comics'), (4, 'X-Men', 'Marvel'),
(5, 'Homem Aranha', 'Marvel'), (6, 'Mulher Maravilha', 'Dc Comics');

-- -> Explicações sobre JOINS:
-- -> INNER JOIN com duas tabelas:

select Cliente.Cliente_id, Cliente.Nome, Telefone.numero
from Cliente
inner join Telefone on Cliente.Cliente_id = Telefone.Cliente_id;

-- -> INNER JOIN com ALIAS:

select c.Cliente_id, c.Nome, t.Numero
from Cliente as c
inner join Telefone as t on c.Cliente_id = t.cliente_id;

-- -> INNER JOIN com mais de duas tabelas:

select c.Cliente_id, c.Nome, t.Numero, e.Cliente_email
from Cliente as c
inner join Telefone as t on c.Cliente_id = t.Cliente_id
inner join Email as e on e.Cliente_id = c.Cliente_id;

-- -> LEFT JOIN:

select c.Cliente_id, c.Nome, f.Funcionario_id, f.Nome
from Cliente as c
left join Funcionario as f on c.Nome = f.Nome;

-- -> RIGHT JOIN:

select c.Cliente_id, c.Nome, f.Funcionario_id, f.Nome
from Cliente as c
right join Funcionario as f on c.Nome = f.Nome;

-- -> Uso do IFNULL

SELECT 
    C.Cliente_id,
    C.Nome,
    IFNULL(F.Funcionario_id, '---') AS Funcionario_id,
    IFNULL(F.Nome, 'Não Funcionário') AS Nome
FROM
    Cliente AS C
        LEFT JOIN
    Funcionario AS F ON C.Nome = F.Nome;

SELECT 
    IFNULL(C.Cliente_id, '---') AS Cliente_id,
    IFNULL(C.Nome, 'Não Cliente') AS Nome,
    F.Funcionario_id,
    F.Nome
FROM
    Cliente AS C
        RIGHT JOIN
    Funcionario AS F ON C.Nome = F.Nome;

-- -> SELF JOIN:

select R1.Titulo, R1.Editora, R2.Titulo, R2.Editora
from Revista as R1, Revista as R2
where R1.Editora = R2.Editora and R1.Titulo <> R2.Titulo;