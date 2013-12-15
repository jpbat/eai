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