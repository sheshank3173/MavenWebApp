--liquibase formatted sql
--changeset Gopi Muruganantham:release_1.insert_data.sql

INSERT INTO users(
            username, password, firstname, lastname, email, address, phone)
    VALUES ("Anish","123Welcome","Anish","kumar","anish!@htcindia.com","Chennai",123456987);


INSERT INTO users(
            username, password, firstname, lastname, email, address, phone)
    VALUES ("Gopi","password","Gopi","Muruganantham","gopi.officials@gmail.com","Chennai",123456789);


INSERT INTO users(
            username, password, firstname, lastname, email, address, phone)
    VALUES ("sayooj","123Welcome","sayooj","panakal","sayoojp@htcindia.com","Chennai",123456);

