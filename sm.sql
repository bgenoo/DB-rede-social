create schema rede_social;

use rede_social;

create table usuarios(
id_usuario int primary key unique not null auto_increment,
nome_usuario varchar(50) not null,
data_nascimento date not null
);

create table postagens(
id_post int primary key unique not null auto_increment,
texto varchar(255) not null,
data_hora datetime not null,
id_usuario int,
constraint id_usuario foreign key (id_usuario) references usuarios(id_usuario)
);

alter table postagens modify column texto varchar(255);

create table comentarios(
comentario_id int primary key not null,
texto varchar(255) not null,
data_hora datetime not null,
id_usuario int,
constraint id_usuario_comentario foreign key (id_usuario) references usuarios(id_usuario),
id_post int,
constraint id_post foreign key (id_post) references postagens(id_post)
);



create table amizades(
id_amizade int primary key not null unique auto_increment,
id_usuario1 int,
constraint id_usuario1 foreign key (id_usuario1) references usuarios(id_usuario),
id_usuario2 int,
constraint id_usuario2 foreign key (id_usuario2) references usuarios(id_usuario),
data_conexao date not null
);

create table curtidas(
id_curtida int primary key unique not null auto_increment,
id_usuario_curtida int,
constraint id_usuario_curtida foreign key (id_usuario_curtida) references usuarios(id_usuario),
postagem_curtida int,
constraint postagem_curtida foreign key (postagem_curtida) references postagens(id_post),
data_curtida date not null
);

create table grupos(
grupo_id int primary key unique not null auto_increment,
nome_grupo varchar(50) not null,
descricao_grupo varchar(50)
);

create table membros_grupo(
id_membro_grupo int primary key unique not null auto_increment,
usuario_membro int,
constraint usuario_membro foreign key (usuario_membro) references usuarios(id_usuario),
grupo_id int,
constraint grupo_id foreign key (grupo_id) references grupos(grupo_id)
);



