CREATE DATABASE funix_charity;
USE funix_charity;
#password funixasm1

-- CREATE TABLE ROLE
DROP TABLE IF EXISTS `ROLE`;
CREATE TABLE `ROLE`(
                       ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                       ROLE_NAME VARCHAR(50) NOT NULL UNIQUE
);

-- CREATE TABLE USER
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER`(
                       ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                       ADDRESS VARCHAR(255) NOT NULL,
                       EMAIL VARCHAR(255) NOT NULL UNIQUE,
                       FULL_NAME VARCHAR(50) NOT NULL,
                       NOTE VARCHAR(50) NOT NULL,
                       `PASSWORD` VARCHAR(68) NOT NULL,
                       PHONE_NUMBER VARCHAR(50),
                       `STATUS` INT,
                       USER_NAME VARCHAR(50) NOT NULL UNIQUE,
                       CREATED VARCHAR(50),
                       ROLE_ID INT UNSIGNED NOT NULL,
                       FOREIGN KEY (ROLE_ID) REFERENCES `ROLE`(ID)
);

-- CREATE TABLE DONATION
DROP TABLE IF EXISTS DONATION;
CREATE TABLE DONATION(
                         ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                         `CODE` VARCHAR(255) NOT NULL UNIQUE,
                         CREATED VARCHAR(255) NOT NULL,
                         `DESCRIPTION` VARCHAR(255),
                         START_DATE DATE,
                         END_DATE DATE,
                         MONEY INT NOT NULL,
                         `NAME` VARCHAR(255),
                         ORGANIZATION_NAME VARCHAR(255),
                         PHONE_NUMBER VARCHAR(50) NOT NULL UNIQUE,
                         `STATUS` INT
);

-- CREATE TABLE USER_DONATION
DROP TABLE IF EXISTS USER_DONATION;
CREATE TABLE USER_DONATION(
                              ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                              CREATED VARCHAR(255) NOT NULL,
                              MONEY INT,
                              `NAME` VARCHAR(255) NOT NULL,
                              DATE_DONATION DATE,
                              `STATUS` INT,
                              `TEXT` VARCHAR(255),
                              DONATION_ID INT UNSIGNED NOT NULL,
                              USER_ID INT UNSIGNED NOT NULL,
                              FOREIGN KEY (DONATION_ID) REFERENCES DONATION(ID),
                              FOREIGN KEY (USER_ID) REFERENCES `USER`(ID)
);

-- CREATE DATA
-- CREATE DATA ROLE
INSERT INTO `ROLE`(role_name) VALUES
                                  ('Admin'),
                                  ('User');

-- CREATE DATA USER
#Password funixasm1
INSERT INTO
    `USER`( ADDRESS    ,        EMAIL              ,  FULL_NAME            ,     NOTE      , `PASSWORD` ,  PHONE_NUMBER, `STATUS` ,  USER_NAME   ,  CREATED   , ROLE_ID)
VALUES
    ('Hà Nội'    ,'trangtran@gmail.com'   , 'Trần Thị Trang'   , 'Tôi là Quản trị viên' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0912345678' ,    1     ,  'trangtran'    , 'Đã tạo',   1   ),
    ('Hà Giang'  ,'anhnn@gmail.com'       , 'Nguyễn Ngọc Anh' , 'Tôi là Người dùng 1' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0945123456' ,    1     ,  'ngocanh'     , 'Đã tạo',   2   ),
    ('Cao Bằng'  ,'binhle@gmail.com'      , 'Lê Minh Bình'    , 'Tôi là Người dùng 2' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0913234567' ,    1     ,  'minhbinh'    , 'Đã tạo',   2   ),
    ('Bắc Kạn'   ,'huyennguyen@gmail.com' , 'Nguyễn Thị Huyền', 'Tôi là Người dùng 3' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0914345678' ,    1     ,  'thihuyen'    , 'Đã tạo',   2   ),
    ('Điện Biên' ,'vinhpham@gmail.com'    , 'Phạm Quang Vinh' , 'Tôi là Người dùng 4' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0915456789' ,    1     ,  'quangvinh'   , 'Đã tạo',   2   ),
    ('Lào Cai'   ,'hungnguyen@gmail.com'  , 'Nguyễn Văn Hùng' , 'Tôi là Người dùng 5' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0906567890' ,    1     ,  'vanhung'     , 'Đã tạo',   2   ),
    ('Lai Châu'  ,'thanhle@gmail.com'     , 'Lê Văn Thành'    , 'Tôi là Người dùng 6' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0917678901' ,    1     ,  'lethanh'     , 'Đã tạo',   2   ),
    ('Sơn La'    ,'phuongly@gmail.com'    , 'Lý Thị Phương'   , 'Tôi là Người dùng 7' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0948789012' ,    1     ,  'thiphuong'   , 'Đã tạo',   2   ),
    ('Yên Bái'   ,'thutran@gmail.com'     , 'Trần Thị Thu'    , 'Tôi là Người dùng 8' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0949890123' ,    1     ,  'thuthu'      , 'Đã tạo',   2   ),
    ('Hòa Bình'  ,'huynhtran@gmail.com'   , 'Trần Thị Huỳnh'  , 'Tôi là Quản trị viên' , '$2a$12$9MOnx5GbCsftGhDsZH0rzu9KClcvlWmgIVLzjE3nt/rCSqzYw0Fve'  , '0916789012' ,    1     ,  'tranhuynh'   , 'Đã tạo',   1   );

-- CREATE DATA DONATION
INSERT INTO
    DONATION(`CODE`  ,       CREATED        ,   `DESCRIPTION`   , START_DATE  , END_DATE    , MONEY ,            `NAME`                ,  ORGANIZATION_NAME      ,  PHONE_NUMBER,  `STATUS`)
VALUES    ('D001'  , 'CREATE DONATION OK' , 'Donationed D001' , '2023-05-20', '2023-10-11',  0    , 'Ủng hộ lũ lụt Miền Trung'       , 'Linh 14'               , '0945.942.468',  1),
          ('D002'  , 'CREATE DONATION OK' , 'Donationed D002' , '2023-06-19', '2024-12-15',  0    , 'Nụ cười trẻ thơ'                , ' Quỹ vì niềm thương'   , '0989.394.901',  1),
          ('D003'  , 'CREATE DONATION OK' , 'Donationed D003' , '2023-07-25', '2023-10-10',  0    , 'Giúp trẻ em vùng cao đến trường', ' Việt Nam Mới'         , '0911.724.666',  1),
          ('D004'  , 'CREATE DONATION OK' , 'Donationed D004' , '2023-05-27', '2023-08-11',  0    , 'Lắp đặt hệ thống nước sạch'     , ' Qũy từ thiện Hoa Hồng', '0948.443.555',  1),
          ('D005'  , 'CREATE DONATION OK' , 'Donationed D005' , '2023-04-20', '2023-12-05',  0    , 'Quỹ nâng bước tuổi thơ'         , ' Momo'                 , '0394.783.649',  2),
          ('D006'  , 'CREATE DONATION OK' , 'Donationed D006' , '2023-05-20', '2025-12-09',  0    , 'Giúp đỡ trẻ em nghèo'           , ' Bảo trợ trẻ em'       , '0911.373.918',  1),
          ('D007'  , 'CREATE DONATION OK' , 'Donationed D007' , '2023-06-25', '2023-09-25',  0    , 'Giúp đỡ người già neo đơn'      , ' Hỗ trợ người già'     , '0837.870.888',  1),
          ('D008'  , 'CREATE DONATION OK' , 'Donationed D008' , '2023-06-20', '2024-05-30',  0    , 'Quỹ khuyến học vùng cao'        , ' Vì tương lai Việt Nam', '0368.676.324',  1),
          ('D009'  , 'CREATE DONATION OK' , 'Donationed D009' , '2023-05-01', '2023-11-07',  0    , 'Xây cầu vùng cao Tây Bắc'       , ' Quỹ hi vọng'          , '02323514678' ,  1),
          ('D0010' , 'CREATE DONATION OK' , 'Donationed D0010', '2023-05-29', '2023-07-25',  0    , 'Thư viện ước mơ'                , ' Thư viện ước mơ'      , '0915.420.289',  2);

-- CREATE DATA USER_DONATION
INSERT INTO
    USER_DONATION (           CREATED        ,  MONEY    ,   `NAME`        , DATE_DONATION , `STATUS` ,      `TEXT`      , DONATION_ID , USER_ID)
VALUES           ('Create Donation DOO1 OK' , 10000000  , 'DONATE USER 1' , '2023-05-30'  ,    1     , 'User 1 Donated' ,     1       ,    2  ),
                 ('Create Donation DOO2 OK' , 50000000  , 'DONATE USER 2' , '2023-06-30'  ,    1     , 'User 2 Donated' ,     1       ,    3  ),
                 ('Create Donation DOO1 OK' , 10000000  , 'DONATE USER 2' , '2023-08-30'  ,    1     , 'User 3 Donated' ,     2       ,    5  ),
                 ('Create Donation DOO3 OK' , 20000000  , 'DONATE USER 4' , '2023-09-30'  ,    1     , 'User 4 Donated' ,     2       ,    6  ),
                 ('Create Donation DOO4 OK' , 12000000  , 'DONATE USER 2' , '2023-10-30'  ,    1     , 'User 6 Donated' ,     2       ,    2  ),
                 ('Create Donation DOO2 OK' , 11000000  , 'DONATE USER 3' , '2023-05-26'  ,    1     , 'User 8 Donated' ,     3       ,    6  ),
                 ('Create Donation DOO1 OK' , 10000000  , 'DONATE USER 7' , '2023-07-30'  ,    1     , 'User 5 Donated' ,     4       ,    1  ),
                 ('Create Donation DOO6 OK' , 10000000  , 'DONATE USER 9' , '2023-07-30'  ,    1     , 'User 9 Donated' ,     4       ,    4  ),
                 ('Create Donation DOO8 OK' , 10000000  , 'DONATE USER 6' , '2023-05-30'  ,    1     , 'User 10 Donated',     4       ,    5  );
