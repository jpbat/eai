CREATE TABLE genre (
    id SERIAL NOT NULL,
    name character varying(255) NOT NULL,
    constraint PK_GENRE primary key (id)
);

CREATE TABLE movie_genre (
    movies_id bigint NOT NULL,
    genres_id bigint NOT NULL
);

CREATE TABLE movie (
    id SERIAL NOT NULL,
    title character varying(255) NOT NULL,
    rate character varying(255),
    sent boolean NOT NULL,
    constraint PK_MOVIE primary key (id)
);

CREATE TABLE subscription (
    id SERIAL NOT NULL,
    active boolean NOT NULL,
    type character varying(1024) NOT NULL,
    email character varying(1024) NOT NULL,
    via character varying(1024) NOT NULL,
    constraint PK_SUBSCRIPTION primary key (id)
);