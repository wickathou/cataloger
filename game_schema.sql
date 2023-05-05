create table item (
id varchar(36) primary key,
published_date date,
archived boolean);

create table game (
id varchar(36) primary key,
multiplayer boolean,
last_played_date date,
item_id varchar(36) references item(id));

create table author (
id varchar(36) primary key,
first_name varchar(100),
last_name varchar(100));

create table label (
id varchar(36) primary key,
title varchar(100),
color varchar(100));

create table genre (
id varchar(36) primary key,
name varchar(100));

create table item_relations (
id varchar(36) primary key,
item_id varchar(36) references item(id),
author_id varchar(36) references author(id),
genre_id varchar(36) references genre(id),
label_id varchar(36) references label(id));
