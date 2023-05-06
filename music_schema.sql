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