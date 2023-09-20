drop schema if exists app_jogos_37277;
Create Schema app_jogos_37277;
use app_jogos_37277;

Create Table usuario
(
nm_email varchar(200),
nm_usuario varchar(200),
nm_apelido varchar(100),
ds_usuario varchar(255),
nm_senha varchar(64),

constraint pk_usuario primary key (nm_email)
);

Create Table plataforma
(
cd_plataforma int,
nm_plataforma varchar(100),

constraint pk_plataforma primary key (cd_plataforma)
);

Create Table desenvolvedor
(
cd_desenvolvedor int,
nm_desenvolvedor varchar(100),

constraint pk_desenvolvedor primary key (cd_desenvolvedor)
);

Create Table tipo_jogo
(
cd_tipo_jogo int,
nm_tipo_jogo varchar(100),

constraint pk_tipo_jogo primary key (cd_tipo_jogo)
);

Create Table genero 
(
cd_genero int,
nm_genero  varchar(100),

constraint pk_genero primary key (cd_genero)
);

Create Table rank
(
cd_rank int,
nm_rank varchar(100),

constraint pk_rank primary key (cd_rank)
);

Create Table jogo
(
cd_jogo int,
nm_jogo varchar(200),
ds_sinopse text,
aa_lancamento int,
cd_desenvolvedor int,
cd_tipo_jogo int,

constraint pk_jogo primary key (cd_jogo),
constraint fk_jogo_desenvolvedor foreign key (cd_desenvolvedor)
references desenvolvedor (cd_desenvolvedor),
constraint fk_jogo_tipo_jogo foreign key (cd_tipo_jogo)
references tipo_jogo (cd_tipo_jogo)
);

Create Table jogo_genero
(
cd_jogo int,
cd_genero int,
constraint pk_jogo_genero primary key (cd_jogo, cd_genero),
constraint fk_jogo_genero_jogo foreign key (cd_jogo)
references jogo (cd_jogo),
constraint fk_jogo_genero_genero foreign key (cd_genero)
references genero (cd_genero)
);

Create Table preferencia_genero
(
nm_email varchar(200),
cd_genero int,

constraint pk_preferencia_genero primary key (nm_email, cd_genero),
constraint fk_preferencia_genero_usuario foreign key (nm_email)
references usuario (nm_email),
constraint fk_preferencia_genero_genero foreign key (cd_genero)
references genero (cd_genero)
);

Create Table comentario
(
nm_email_remetente varchar(200),
nm_email_destinario varchar(200),
dt_comentario date,
hr_comentario time,
ds_comentario text,

constraint pk_comentario primary key (nm_email_remetente, nm_email_destinario, dt_comentario, hr_comentario)
);

Create Table favorito
(
nm_email varchar(200),
nm_email_favoritado varchar(200),

constraint pk_favorito primary key (nm_email, nm_email_favoritado)
);

Create Table avaliacao
(
nm_email varchar(200),
nm_email_avaliador varchar(200),
cd_tipo_avaliacao int,
qt_avaliacao int,

constraint pk_avaliacao primary key (nm_email, nm_email_avaliador, cd_tipo_avaliacao),
constraint fk_avaliacao_usuario foreign key (nm_email)
references usuario (nm_email)
);

Create Table tipo_avaliacao
(
cd_tipo_avaliacao int,
nm_tipo_avaliacao varchar(100),

constraint pk_tipo_avaliacao primary key (cd_tipo_avaliacao)
);

Create Table biblioteca
(
nm_email varchar(200),
cd_jogo int,
cd_plataforma int,
qt_nivel int,
cd_rank int,
nm_apelido_jogo varchar(100),
ds_jogabilidade text,

constraint pk_biblioteca primary key (nm_email, cd_jogo, cd_plataforma),
constraint fk_biblioteca_usuario foreign key (nm_email)
references usuario (nm_email),
constraint fk_biblioteca_jogo foreign key (cd_jogo)
references jogo (cd_jogo),
constraint fk_biblioteca_plataforma foreign key (cd_plataforma)
references plataforma (cd_plataforma),
constraint fk_biblioteca_rank foreign key (cd_rank)
references rank (cd_rank)
);

/*Insert's*/
Insert Into usuario (nm_email, nm_usuario, nm_apelido, ds_usuario, nm_senha) values ('joaozinho223@gmail.com','João','joazinho_reidelas','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','#Juao2009');
Insert Into usuario (nm_email, nm_usuario, nm_apelido, ds_usuario, nm_senha) values ('mariaeduarda2645@gmail.com','Maria Eduarda','batata_assada','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','mariaeduarda');
Insert Into usuario (nm_email, nm_usuario, nm_apelido, ds_usuario, nm_senha) values ('analuisaprevidissl@gmail.com','Ana','alprevidi','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','analuisaprevidi');

Insert into plataforma (cd_plataforma, nm_plataforma) values ('001','Steam');
Insert into plataforma (cd_plataforma, nm_plataforma) values ('967','Orangutango');
Insert into plataforma (cd_plataforma, nm_plataforma) values ('2357','Suco Laranja');

Insert into desenvolvedor (cd_desenvolvedor, nm_desenvolvedor) values ('785','Barack');
Insert into desenvolvedor (cd_desenvolvedor, nm_desenvolvedor) values ('433','Arachetik');
Insert into desenvolvedor (cd_desenvolvedor, nm_desenvolvedor) values ('576','Edward');

Insert into tipo_jogo (cd_tipo_jogo, nm_tipo_jogo) values ('782','MultiPlayer');
Insert into tipo_jogo (cd_tipo_jogo, nm_tipo_jogo) values ('2135','Offline');
Insert into tipo_jogo (cd_tipo_jogo, nm_tipo_jogo) values ('546','Ambos');

Insert into genero (cd_genero, nm_genero) values ('469','Ação');
Insert into genero (cd_genero, nm_genero) values ('468','Aventura');
Insert into genero (cd_genero, nm_genero) values ('123','Arcade');

Insert into rank (cd_rank, nm_rank) values ('645','Diamantes');
Insert into rank (cd_rank, nm_rank) values ('345','Bronze');
Insert into rank (cd_rank, nm_rank) values ('213','Platina');

Insert into jogo (cd_jogo, nm_jogo, ds_sinopse, aa_lancamento, cd_desenvolvedor, cd_tipo_jogo) values ('657','League of Legends','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','2009','785','782');
Insert into jogo (cd_jogo, nm_jogo, ds_sinopse, aa_lancamento, cd_desenvolvedor, cd_tipo_jogo) values ('567','Mario','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','2010','433','2135');
Insert into jogo (cd_jogo, nm_jogo, ds_sinopse, aa_lancamento, cd_desenvolvedor, cd_tipo_jogo) values ('987','CyberPunk','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','1986','576','546');
Insert into jogo (cd_jogo, nm_jogo, ds_sinopse, aa_lancamento, cd_desenvolvedor, cd_tipo_jogo) values ('536','Sally Face','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','2016','576','2135');
Insert into jogo (cd_jogo, nm_jogo, ds_sinopse, aa_lancamento, cd_desenvolvedor, cd_tipo_jogo) values ('710','Limbo','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','2010','433','2135');

Insert into jogo_genero (cd_jogo, cd_genero) values ('657','469');
Insert into jogo_genero (cd_jogo, cd_genero) values ('567','468');
Insert into jogo_genero (cd_jogo, cd_genero) values ('987','123');

Insert into preferencia_genero (nm_email, cd_genero) values ('joaozinho223@gmail.com','469');
Insert into preferencia_genero (nm_email, cd_genero) values ('mariaeduarda2645@gmail.com','468');
Insert into preferencia_genero (nm_email, cd_genero) values ('analuisaprevidissl@gmail.com','123');

Insert into comentario (nm_email_remetente, nm_email_destinario, dt_comentario, hr_comentario, ds_comentario) values ('joaozinho223@gmail.com','mariaeduarda2645@gmail.com','2007-08-11','12:09','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
Insert into comentario (nm_email_remetente, nm_email_destinario, dt_comentario, hr_comentario, ds_comentario) values ('analuisaprevidissl@gmail.com','joaozinho223@gmail.com','2023-05-23','23:56','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
Insert into comentario (nm_email_remetente, nm_email_destinario, dt_comentario, hr_comentario, ds_comentario) values ('mariaeduarda2645@gmail.com','analuisaprevidissl@gmail.com','2018-09-09','14:57','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');

Insert into favorito (nm_email, nm_email_favoritado) values ('mariaeduarda2645@gmail.com','analuisaprevidissl@gmail.com');
Insert into favorito (nm_email, nm_email_favoritado) values ('joaozinho223@gmail.com','mariaeduarda2645@gmail.com');
Insert into favorito (nm_email, nm_email_favoritado) values ('analuisaprevidissl@gmail.com','joaozinho223@gmail.com');

Insert into avaliacao (nm_email, nm_email_avaliador, cd_tipo_avaliacao, qt_avaliacao) values ('joaozinho223@gmail.com','mariaeduarda2645@gmail.com','76785','01');
Insert into avaliacao (nm_email, nm_email_avaliador, cd_tipo_avaliacao, qt_avaliacao) values ('analuisaprevidissl@gmail.com','mariaeduarda2645@gmail.com','35468','05');
Insert into avaliacao (nm_email, nm_email_avaliador, cd_tipo_avaliacao, qt_avaliacao) values ('joaozinho223@gmail.com','analuisaprevidissl@gmail.com','64245','04');

Insert into tipo_avaliacao (cd_tipo_avaliacao, nm_tipo_avaliacao) values ('76785','Cooperação');
Insert into tipo_avaliacao (cd_tipo_avaliacao, nm_tipo_avaliacao) values ('35468','Amigável');
Insert into tipo_avaliacao (cd_tipo_avaliacao, nm_tipo_avaliacao) values ('64245','Habilidade');

Insert into biblioteca (nm_email, cd_jogo, cd_plataforma, qt_nivel, cd_rank, nm_apelido_jogo, ds_jogabilidade) values ('joaozinho223@gmail.com','657','001','990','645','Juaoziiiiiinho','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
Insert into biblioteca (nm_email, cd_jogo, cd_plataforma, qt_nivel, cd_rank, nm_apelido_jogo, ds_jogabilidade) values ('analuisaprevidissl@gmail.com','567','967','465','345','Anainha','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');
Insert into biblioteca (nm_email, cd_jogo, cd_plataforma, qt_nivel, cd_rank, nm_apelido_jogo, ds_jogabilidade) values ('mariaeduarda2645@gmail.com','987','2357','567','213','Meduarda','Lorem Ipsum is simply dummy text of the printing and typesetting industry.');

/*Select's*/
Select nm_apelido, ds_usuario from usuario order by nm_usuario asc;
Select * from plataforma order by cd_plataforma;
Select nm_desenvolvedor from desenvolvedor order by cd_desenvolvedor;
Select * from tipo_jogo order by cd_tipo_jogo;
Select * from genero order by cd_genero;
Select * from rank order by cd_rank;
Select cd_jogo, nm_jogo ordery from jogo order by cd_jogo;
Select * from jogo_genero;
Select nm_email_remetente, nm_email_destinario, dt_comentario from comentario order by dt_comentario;
Select * from favorito order by nm_email_favoritado;
Select nm_email, nm_email_avaliador, cd_tipo_avaliacao from avaliacao order by cd_tipo_avaliacao;
Select * from tipo_avaliacao order by cd_tipo_avaliacao;
Select cd_jogo, cd_plataforma, nm_apelido_jogo from biblioteca order by cd_jogo;
Select nm_jogo from jogo order by nm_jogo asc

/*Descritivo (por gentileza, cole os códigos do Descritivo aqui :D )*/
