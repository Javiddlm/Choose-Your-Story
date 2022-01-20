drop database if exists choose_your_story;

create database choose_your_story;

use choose_your_story;

create table if not exists users (
	id_user int auto_increment,
    user_name varchar(50),
    passwd varchar(50)
);

create table if not exists characters (
	id_character int auto_increment,
    character_name varchar(50),
    character_desc varchar(500)
);

create table if not exists adventures (
	id_adventure int auto_increment,
    adventure_name varchar(100),
    adventure_desc varchar(1000),
    protagonist int
);

create table if not exists steps(
	id_step int auto_increment,
	step_desc varchar(1000),
    adventure int
);

create table if not exists game (
	id_game int auto_increment,
    user varchar(50),
    adventure varchar(100),
    date_of_play date,
    decisions varchar(300)
);

alter table users add primary key(id_user);
alter table characters add primary key(id_character);
alter table adventures add primary key(id_adventure);
alter table steps add primary key (id_step);
alter table game add primary key(id_game);

alter table adventures add constraint fk_adv_char foreign key (protagonist) references characters(id_character);
alter table steps add constraint fk_step_adv foreign key (adventure) references adventures(id_adventure);
alter table game add constraint fk_game_users foreign key (user) references users(id_user);
alter table game add constraint fk_game_adv foreign key (adventure) references adventrues(adventure_id)