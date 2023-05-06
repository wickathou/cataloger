create table item (
id varchar(36) primary key,
published_date date,
archived boolean);

create table game (
id varchar(36) primary key,
multiplayer boolean,
last_played_date date,
item_id varchar(36) references item(id));

CREATE TABLE music (
id VARCHAR(36) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
on_spotify BOOLEAN,
FOREIGN KEY (id) REFERENCES item(id));

CREATE TABLE books (
id VARCHAR(36) PRIMARY KEY,
publisher VARCHAR(250) NOT NULL,
cover_state VARCHAR(250) NOT NULL,
item_id VARCHAR(36) REFERENCES item(id));

create table author (
id varchar(36) primary key,
first_name varchar(100),
last_name varchar(100));

CREATE TABLE labels (
id VARCHAR(36) PRIMARY KEY,
title VARCHAR(250) NOT NULL,
color VARCHAR(100) NOT NULL);

CREATE TABLE genres (
id VARCHAR(36) PRIMARY KEY,
name VARCHAR(100) NOT NULL);

create table item_relations (
id varchar(36) primary key,
item_id varchar(36) references item(id),
author_id varchar(36) references author(id),
genre_id varchar(36) references genres(id),
label_id varchar(36) references labels(id));