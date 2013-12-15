CREATE TABLE genre (
    id SERIAL NOT NULL,
    name character varying(255) NOT NULL,
    constraint pk_genre primary key (id)
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
    constraint pk_movie primary key (id)
);

CREATE TABLE email (
    receiver character varying(255) NOT NULL,
    sub_type character varying(255) NOT NULL,
    content character varying(2047) NOT NULL,
    sent timestamp NOT NULL
);

CREATE TABLE subscription (
    id SERIAL NOT NULL,
    active boolean NOT NULL,
    sub_type character varying(1024) NOT NULL,
    email character varying(1024) NOT NULL,
    via character varying(1024) NOT NULL,
    hash character varying(1024),
    constraint pk_subscription primary key (id),
    constraint subscription_email_unique unique (email)
);

INSERT INTO genre (id, name) VALUES (1, 'Horror');
INSERT INTO genre (id, name) VALUES (2, 'Thriller');
INSERT INTO genre (id, name) VALUES (3, 'Action');
INSERT INTO genre (id, name) VALUES (4, 'Crime');
INSERT INTO genre (id, name) VALUES (5, 'Drama');
INSERT INTO genre (id, name) VALUES (6, 'Comedy');
INSERT INTO genre (id, name) VALUES (7, 'Documentary');
INSERT INTO genre (id, name) VALUES (8, 'Sci-Fi');
INSERT INTO genre (id, name) VALUES (9, 'History');
INSERT INTO genre (id, name) VALUES (10, 'Fantasy');
INSERT INTO genre (id, name) VALUES (11, 'Romance');
INSERT INTO genre (id, name) VALUES (12, 'Music');
INSERT INTO genre (id, name) VALUES (13, 'Biography');
INSERT INTO genre (id, name) VALUES (14, 'War');
INSERT INTO genre (id, name) VALUES (15, 'Mystery');
INSERT INTO genre (id, name) VALUES (16, 'Animation');
INSERT INTO genre (id, name) VALUES (17, 'Adventure');
INSERT INTO genre (id, name) VALUES (18, 'Family');
INSERT INTO genre (id, name) VALUES (19, 'Sport');
INSERT INTO genre (id, name) VALUES (20, 'Western');
INSERT INTO genre (id, name) VALUES (21, 'Musical');
INSERT INTO genre (id, name) VALUES (22, 'News');