create table if not exists Genre (
    id SERIAL primary key,
    denre VARCHAR(40) not null
);


create table if not exists Performer (
    id SERIAL primary key,
    name VARCHAR(40) not null
);


create table if not exists PerformerGenre (
    performer_id INTEGER references Performer(id),
    genre_id INTEGER references Genre(id),
    constraint pk primary key (performer_id, genre_id)
);


create table if not exists Album (
    id SERIAL primary key,
    name VARCHAR(128) not null
);


create table if not exists PerformerAlbum (
    performer_id INTEGER references Performer(id),
    album_id INTEGER references Album(id),
    constraint gs primary key (performer_id, album_id)
);


create table if not exists Track (
    id SERIAL primary key,
    album_id INTEGER not null references Album(id),
    track VARCHAR(80) not null,
    duration time not null
);


create table if not exists Collection (
    id SERIAL primary key,
    name VARCHAR(80) not null,
    release_year date not null
);

create table if not exists TrackCollection (
    track_id INTEGER references Track(id),
    collection_id INTEGER references Collection(id),
    constraint fd primary key (track_id, collection_id)
);