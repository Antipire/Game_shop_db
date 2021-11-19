-->Create test table
CREATE TABLE task (
    task_id        INTEGER NOT NULL,
    task_desc      VARCHAR2(30) NOT NULL,
    task_number    INTEGER NOT NULL
);

-->Add PK
ALTER TABLE task ADD CONSTRAINT pk_task PRIMARY KEY ( task_id );

-->Insert some data
INSERT ALL
    INTO task VALUES (1, 'Some task', 1)
    INTO task VALUES (2, 'Some task', 2)
    INTO task VALUES (3, 'Some task', 3)
    SELECT * FROM dual;

-->Rename column
ALTER TABLE task RENAME COLUMN task_desc TO task_description;

-->Set unused column
ALTER TABLE task SET UNUSED COLUMN task_number;

-->Drop unused column
ALTER TABLE task DROP UNUSED COLUMNS;

-->Delete data from table
TRUNCATE TABLE task;

-->Delete table
DROP TABLE task PURGE;


-->Create sequence

CREATE SEQUENCE buyer_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
    
CREATE SEQUENCE developer_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
    
CREATE SEQUENCE game_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE order_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;
    
CREATE SEQUENCE publisher_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE shop_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

CREATE SEQUENCE worker_seq
    MINVALUE 1 
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

-->Insert Statements

-->Insert into buyer table
INSERT ALL
    INTO buyer VALUES (1,'James Addison',18)
    INTO buyer VALUES (2,'John',19)
    INTO buyer VALUES (3,'Robert',20)
    INTO buyer VALUES (4,'Michael',21)
    INTO buyer VALUES (5,'William',22)
    INTO buyer VALUES (6,'David',23)
    INTO buyer VALUES (7,'Joseph',24)
    INTO buyer VALUES (8,'Charles',25)
    INTO buyer VALUES (9,'Thomas',26)
    INTO buyer VALUES (10,'Daniel',27)
SELECT * FROM dual;
    
-->Insert into developer table
INSERT ALL
    INTO developer VALUES (1,'Ubisoft','Francie')
    INTO developer VALUES (2,'RockStar Games','USA')
    INTO developer VALUES (3,'Electronic Arts','USA')
    INTO developer VALUES (4,'Valve Corporation','USA')
    INTO developer VALUES (5,'Blizzard','USA')
    INTO developer VALUES (6,'Bethesda Softworks','USA')
    INTO developer VALUES (7,'Kojima Productions','Japan')
    INTO developer VALUES (8,'Gearbox Software','USA')
    INTO developer VALUES (9,'Facepunch Studios','USA')
    INTO developer VALUES (10,'OVERKILL - a Starbreeze Studio','USA')
SELECT * FROM dual;

-->Insert into game table
INSERT ALL
    INTO game VALUES (1,'Tom Clancys Rainbow Six Siege 2',18,'тактический шутер',2000,1,1)
    INTO game VALUES (2,'Red Dead Redemption 3',18,'action-adventure',4000,2,2)
    INTO game VALUES (3,'Sims 5',18,'однопользовательская игра в жанре симулятора жизни',100000,3,3)
    INTO game VALUES (4,'Half-Life Alyx 2',18,'игра в жанре шутера от первого лица',2000,4,4)
    INTO game VALUES (5,'Heathstone 2',18,'карточная онлайн-игра',2000,5,5)
    INTO game VALUES (6,'Fallout 77',18,'компьютерная игра в жанре Action/RPG',2000,6,6)
    INTO game VALUES (7,'Death Stranding 2',18,'игра в жанре action с открытым миром',2000,7,7)
    INTO game VALUES (8,'Borderland 4',18,'игра в жанре шутера от первого лица с элементами RPG',2000,8,8)
    INTO game VALUES (9,'Garrys Mod 2',18,'игра, физическая «песочница»',2000,9,4)
    INTO game VALUES (10,'Pay Day 3',18,'игра в жанре симулятора ограбления',2000,10,7)
SELECT * FROM dual;

-->Insert into kmtm_buyer_order table
INSERT ALL
    INTO kmtm_buyer_order VALUES (1, 1)
    INTO kmtm_buyer_order VALUES (2, 2)
    INTO kmtm_buyer_order VALUES (3, 3)
    INTO kmtm_buyer_order VALUES (1, 4)
    INTO kmtm_buyer_order VALUES (5, 5)
    INTO kmtm_buyer_order VALUES (6, 6)
    INTO kmtm_buyer_order VALUES (7, 7)
    INTO kmtm_buyer_order VALUES (8, 8)
    INTO kmtm_buyer_order VALUES (9, 9)
    INTO kmtm_buyer_order VALUES (10, 10)
SELECT * FROM dual;

-->Insert into kmtm_game_order table
INSERT ALL
    INTO kmtm_game_order VALUES (1, 1, 1, 1)
    INTO kmtm_game_order VALUES (1, 2, 2, 2)
    INTO kmtm_game_order VALUES (1, 3, 3, 3)
    INTO kmtm_game_order VALUES (1, 4, 4, 4)
    INTO kmtm_game_order VALUES (1, 5, 5, 5)
    INTO kmtm_game_order VALUES (1, 6, 6, 6)
    INTO kmtm_game_order VALUES (1, 7, 7, 7)
    INTO kmtm_game_order VALUES (1, 8, 8, 8)
    INTO kmtm_game_order VALUES (1, 9, 9, 9)
    INTO kmtm_game_order VALUES (1, 10, 10, 10)
SELECT * FROM dual;

-->Insert into kmtm_game_shop table
INSERT ALL
    INTO kmtm_game_shop VALUES (10, 1, 1)
    INTO kmtm_game_shop VALUES (10, 2, 2)
    INTO kmtm_game_shop VALUES (10, 3, 3)
    INTO kmtm_game_shop VALUES (10, 4, 4)
    INTO kmtm_game_shop VALUES (10, 5, 5)
    INTO kmtm_game_shop VALUES (10, 6, 6)
    INTO kmtm_game_shop VALUES (10, 7, 7)
    INTO kmtm_game_shop VALUES (10, 8, 8)
    INTO kmtm_game_shop VALUES (10, 9, 9)
    INTO kmtm_game_shop VALUES (10, 10, 10)
SELECT * FROM dual;

-->Insert into order table
INSERT ALL
	INTO "ORDER" VALUES (1,TO_DATE('2021.03.28', 'YYYY.MM.DD'),1)
	INTO "ORDER" VALUES (2,TO_DATE('2021.03.27', 'YYYY.MM.DD'),2)
	INTO "ORDER" VALUES (3,TO_DATE('2021.03.26', 'YYYY.MM.DD'),3)
	INTO "ORDER" VALUES (4,TO_DATE('2021.03.25', 'YYYY.MM.DD'),4)
	INTO "ORDER" VALUES (5,TO_DATE('2021.03.24', 'YYYY.MM.DD'),5)
	INTO "ORDER" VALUES (6,TO_DATE('2021.03.23', 'YYYY.MM.DD'),6)
	INTO "ORDER" VALUES (7,TO_DATE('2021.03.22', 'YYYY.MM.DD'),7)
	INTO "ORDER" VALUES (8,TO_DATE('2021.03.21', 'YYYY.MM.DD'),8)
	INTO "ORDER" VALUES (9,TO_DATE('2021.03.20', 'YYYY.MM.DD'),9)
	INTO "ORDER" VALUES (10,TO_DATE('2021.03.19', 'YYYY.MM.DD'),10)
SELECT * FROM dual;

-->Insert into publisher table
INSERT ALL
	INTO publisher VALUES (1, 'Ubisoft', 'Francie')
	INTO publisher VALUES (2, 'Rockstar', 'USA')
	INTO publisher VALUES (3, 'Maxis', 'USA')
	INTO publisher VALUES (4, 'Valve', 'USA')
	INTO publisher VALUES (5, 'Blizzard', 'USA')
	INTO publisher VALUES (6, 'Bethesda', 'USA')
	INTO publisher VALUES (7, 'Kojima Studio', 'Japan')
	INTO publisher VALUES (8, '2k', 'USA')
	INTO publisher VALUES (9, 'Nintendo', 'Japan')
	INTO publisher VALUES (10, '505 Games', 'USA')
SELECT * FROM dual;

-->Insert into shop table
INSERT ALL
    INTO shop VALUES (1,'ул. Мира 1', 88001001011)
    INTO shop VALUES (2,'ул. Мира 2', 88001001012)
    INTO shop VALUES (3,'ул. Мира 3', 88001001013)
    INTO shop VALUES (4,'ул. Мира 4', 88001001014)
    INTO shop VALUES (5,'ул. Мира 5', 88001001015)
    INTO shop VALUES (6,'ул. Мира 6', 88001001016)
    INTO shop VALUES (7,'ул. Мира 7', 88001001017)
    INTO shop VALUES (8,'ул. Мира 8', 88001001018)
    INTO shop VALUES (9,'ул. Мира 9', 88001001019)
    INTO shop VALUES (10,'ул. Мира 10', 88001001020)
SELECT * FROM dual;

-->Insert into worker table
INSERT ALL
    INTO worker VALUES (1,'Alex Avdeev',20,'Chief',1)
    INTO worker VALUES (2,'Brown',20,'Chief',2)
    INTO worker VALUES (3,'Charlie',20,'Chief',3)
    INTO worker VALUES (4,'Darl',20,'Chief',4)
    INTO worker VALUES (5,'Edgar',20,'Chief',5)
    INTO worker VALUES (6,'Fred',20,'Chief',6)
    INTO worker VALUES (7,'Garry',20,'Chief',7)
    INTO worker VALUES (8,'Hermon',20,'Chief',8)
    INTO worker VALUES (9,'Jack',20,'Chief',9)
    INTO worker VALUES (10,'Koff',20,'Chief',10)
SELECT * FROM dual;