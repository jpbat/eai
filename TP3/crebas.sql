CREATE TABLE genre (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);

CREATE TABLE movie_genre (
    movies_id bigint NOT NULL,
    genres_id bigint NOT NULL
);

CREATE TABLE movie (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    rate character varying(255),
    sent boolean NOT NULL
);

CREATE TABLE subscription (
    id integer NOT NULL,
    type character varying(1024) NOT NULL,
    email character varying(1024) NOT NULL,
    via character varying(1024) NOT NULL
);