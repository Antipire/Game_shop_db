-- Generated by Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   at:        2021-10-20 08:47:06 EDT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



CREATE TABLE buyer (
    buyer_id    INTEGER NOT NULL,
    full_name   VARCHAR2(30) NOT NULL,
    age         INTEGER
);

ALTER TABLE buyer ADD CHECK ( buyer_id BETWEEN 1 AND 2147483647 );

ALTER TABLE buyer ADD CHECK ( age BETWEEN 0 AND 100 );

COMMENT ON COLUMN buyer.buyer_id IS
    'Primary key';

COMMENT ON COLUMN buyer.full_name IS
    'Buyer full name';

COMMENT ON COLUMN buyer.age IS
    'Buyer age';

ALTER TABLE buyer ADD CONSTRAINT pk_buyer PRIMARY KEY ( buyer_id );

CREATE TABLE developer (
    developer_id   INTEGER NOT NULL,
    crew_name      VARCHAR2(30) NOT NULL,
    city           VARCHAR2(50) NOT NULL
);

ALTER TABLE developer ADD CHECK ( developer_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN developer.developer_id IS
    'Primary key';

COMMENT ON COLUMN developer.crew_name IS
    'Crew name';

COMMENT ON COLUMN developer.city IS
    'City';

ALTER TABLE developer ADD CONSTRAINT pk_developer PRIMARY KEY ( developer_id );

CREATE TABLE game (
    game_id           INTEGER NOT NULL,
    name              VARCHAR2(50) NOT NULL,
    age_restriction   INTEGER NOT NULL,
    description       VARCHAR2(100) NOT NULL,
    price             FLOAT NOT NULL,
    publisher_id      INTEGER NOT NULL,
    developer_id      INTEGER NOT NULL
);

ALTER TABLE game ADD CHECK ( game_id BETWEEN 1 AND 2147483647 );

ALTER TABLE game ADD CHECK ( age_restriction BETWEEN 0 AND 100 );

ALTER TABLE game ADD CHECK ( publisher_id BETWEEN 1 AND 2147483647 );

ALTER TABLE game ADD CHECK ( developer_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN game.game_id IS
    'Primary key';

COMMENT ON COLUMN game.name IS
    'Game name';

COMMENT ON COLUMN game.age_restriction IS
    'A number indicating the age at when this product can be purchased';

COMMENT ON COLUMN game.description IS
    'Tiny game description';

COMMENT ON COLUMN game.price IS
    'Game price';

COMMENT ON COLUMN game.publisher_id IS
    'Foreign key';

COMMENT ON COLUMN game.developer_id IS
    'Foreign key';

CREATE INDEX i_game_publisher_id ON
    game (
        publisher_id
    ASC );

CREATE INDEX i_game_developer_id ON
    game (
        developer_id
    ASC );

ALTER TABLE game ADD CONSTRAINT pk_game PRIMARY KEY ( game_id );

CREATE TABLE kmtm_buyer_order (
    order_id   INTEGER NOT NULL,
    buyer_id   INTEGER NOT NULL
);

ALTER TABLE kmtm_buyer_order ADD CHECK ( order_id BETWEEN 1 AND 2147483647 );

ALTER TABLE kmtm_buyer_order ADD CHECK ( buyer_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN kmtm_buyer_order.order_id IS
    'Foreign key to order table';

COMMENT ON COLUMN kmtm_buyer_order.buyer_id IS
    'Foreign key to buyer table';

CREATE INDEX i_kmtm_buyer_order_order_id ON
    kmtm_buyer_order (
        order_id
    ASC );

CREATE INDEX i_kmtm_buyer_order_buyer_id ON
    kmtm_buyer_order (
        buyer_id
    ASC );

ALTER TABLE kmtm_buyer_order ADD CONSTRAINT pk_kmtm_buyer_order PRIMARY KEY ( order_id,
                                                                              buyer_id );

CREATE TABLE kmtm_game_order (
    ammount    INTEGER NOT NULL,
    game_id    INTEGER NOT NULL,
    shop_id    INTEGER NOT NULL,
    order_id   INTEGER NOT NULL
);

ALTER TABLE kmtm_game_order ADD CHECK ( game_id BETWEEN 1 AND 2147483647 );

ALTER TABLE kmtm_game_order ADD CHECK ( shop_id BETWEEN 1 AND 2147483647 );

ALTER TABLE kmtm_game_order ADD CHECK ( order_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN kmtm_game_order.ammount IS
    'Ammount of bought games';

COMMENT ON COLUMN kmtm_game_order.game_id IS
    'Foreign key to game_shop table';

COMMENT ON COLUMN kmtm_game_order.shop_id IS
    'Foreign key to game_shop table';

COMMENT ON COLUMN kmtm_game_order.order_id IS
    'Foreign key to order table';

CREATE INDEX i_game_order_game_id_shop_id ON
    kmtm_game_order (
        game_id
    ASC,
        shop_id
    ASC );

CREATE INDEX i_kmtm_game_order_order_id ON
    kmtm_game_order (
        order_id
    ASC );

ALTER TABLE kmtm_game_order ADD CONSTRAINT pk_kmtm_game_order PRIMARY KEY ( game_id,
                                                                            order_id );

CREATE TABLE kmtm_game_shop (
    ammount   INTEGER NOT NULL,
    game_id   INTEGER NOT NULL,
    shop_id   INTEGER NOT NULL
);

ALTER TABLE kmtm_game_shop ADD CHECK ( game_id BETWEEN 1 AND 2147483647 );

ALTER TABLE kmtm_game_shop ADD CHECK ( shop_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN kmtm_game_shop.ammount IS
    'Number of available product';

COMMENT ON COLUMN kmtm_game_shop.game_id IS
    'Foreing key to game table';

COMMENT ON COLUMN kmtm_game_shop.shop_id IS
    'Foreing key to shop table';

CREATE INDEX i_kmtm_game_shop_game_id ON
    kmtm_game_shop (
        game_id
    ASC );

CREATE INDEX i_kmtm_game_shop_shop_id ON
    kmtm_game_shop (
        shop_id
    ASC );

ALTER TABLE kmtm_game_shop ADD CONSTRAINT pk_kmtm_game_shop PRIMARY KEY ( game_id,
                                                                          shop_id );

CREATE TABLE "order" (
    order_id    INTEGER NOT NULL,
    "date"      DATE,
    worker_id   INTEGER NOT NULL
);

ALTER TABLE "order" ADD CHECK ( order_id BETWEEN 1 AND 2147483647 );

ALTER TABLE "order" ADD CHECK ( worker_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN "order".order_id IS
    'Primary key';

COMMENT ON COLUMN "order"."date" IS
    'Date when order was complete';

COMMENT ON COLUMN "order".worker_id IS
    'Foreign key to worker table';

CREATE INDEX i_order_worker_id ON
    "order" (
        worker_id
    ASC );

ALTER TABLE "order" ADD CONSTRAINT pk_order PRIMARY KEY ( order_id );

CREATE TABLE publisher (
    publisher_id     INTEGER NOT NULL,
    publisher_name   VARCHAR2(30) NOT NULL,
    city             VARCHAR2(50) NOT NULL
);

ALTER TABLE publisher ADD CHECK ( publisher_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN publisher.publisher_id IS
    'Primary key';

COMMENT ON COLUMN publisher.publisher_name IS
    'Company name';

COMMENT ON COLUMN publisher.city IS
    'City';

ALTER TABLE publisher ADD CONSTRAINT pk_publisher PRIMARY KEY ( publisher_id );

CREATE TABLE shop (
    shop_id        INTEGER NOT NULL,
    adress         VARCHAR2(30) NOT NULL,
    phone_number   INTEGER NOT NULL
);

ALTER TABLE shop ADD CHECK ( shop_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN shop.shop_id IS
    'Primary key';

COMMENT ON COLUMN shop.adress IS
    'Physical adress to shop';

COMMENT ON COLUMN shop.phone_number IS
    'Phone number';

ALTER TABLE shop ADD CONSTRAINT pk_shop PRIMARY KEY ( shop_id );

CREATE TABLE worker (
    worker_id     INTEGER NOT NULL,
    worker_name   VARCHAR2(30) NOT NULL,
    age           INTEGER NOT NULL,
    position      VARCHAR2(30) NOT NULL,
    shop_id       INTEGER NOT NULL
);

ALTER TABLE worker ADD CHECK ( worker_id BETWEEN 1 AND 2147483647 );

ALTER TABLE worker ADD CHECK ( age BETWEEN 0 AND 100 );

ALTER TABLE worker ADD CHECK ( shop_id BETWEEN 1 AND 2147483647 );

COMMENT ON COLUMN worker.worker_id IS
    'Primary key';

COMMENT ON COLUMN worker.worker_name IS
    'Worker full name';

COMMENT ON COLUMN worker.age IS
    'Workerage';

COMMENT ON COLUMN worker.position IS
    'Position';

COMMENT ON COLUMN worker.shop_id IS
    'Foreign key to shop table';

CREATE INDEX i_worker_shop_id ON
    worker (
        shop_id
    ASC );

ALTER TABLE worker ADD CONSTRAINT pk_worker PRIMARY KEY ( worker_id );

ALTER TABLE game
    ADD CONSTRAINT fk_game_developer FOREIGN KEY ( developer_id )
        REFERENCES developer ( developer_id );

ALTER TABLE game
    ADD CONSTRAINT fk_game_publisher FOREIGN KEY ( publisher_id )
        REFERENCES publisher ( publisher_id );

ALTER TABLE kmtm_buyer_order
    ADD CONSTRAINT fk_kmtm_buyer_order_buyer FOREIGN KEY ( buyer_id )
        REFERENCES buyer ( buyer_id );

ALTER TABLE kmtm_buyer_order
    ADD CONSTRAINT fk_kmtm_buyer_order_order FOREIGN KEY ( order_id )
        REFERENCES "order" ( order_id );

ALTER TABLE kmtm_game_order
    ADD CONSTRAINT fk_kmtm_game_order_game_shop FOREIGN KEY ( game_id,
                                                              shop_id )
        REFERENCES kmtm_game_shop ( game_id,
                                    shop_id );

ALTER TABLE kmtm_game_order
    ADD CONSTRAINT fk_kmtm_game_order_order FOREIGN KEY ( order_id )
        REFERENCES "order" ( order_id );

ALTER TABLE kmtm_game_shop
    ADD CONSTRAINT fk_kmtm_game_shop_game FOREIGN KEY ( game_id )
        REFERENCES game ( game_id );

ALTER TABLE kmtm_game_shop
    ADD CONSTRAINT fk_kmtm_game_shop_shop FOREIGN KEY ( shop_id )
        REFERENCES shop ( shop_id );

ALTER TABLE "order"
    ADD CONSTRAINT fk_order_worker FOREIGN KEY ( worker_id )
        REFERENCES worker ( worker_id );

ALTER TABLE worker
    ADD CONSTRAINT fk_worker_shop FOREIGN KEY ( shop_id )
        REFERENCES shop ( shop_id );

ALTER TABLE "order" RENAME TO "ORDER";

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                            10
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
