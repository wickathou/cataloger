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