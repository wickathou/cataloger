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




CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(250) NOT NULL,
    cover_state VARCHAR(250) NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genres(id),
    author_id INT REFERENCES authors(id)
);

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    color VARCHAR(100) NOT NULL
);




CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE music (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    on_spotify BOOLEAN,
    FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);