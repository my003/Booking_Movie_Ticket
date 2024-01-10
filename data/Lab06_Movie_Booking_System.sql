CREATE DATABASE Lab06_Movie_Booking_System;

USE Lab06_Movie_Booking_System;

-- DROP DATABASE Lab06_Movie_Booking_System;
--NHI
CREATE TABLE Movie (
	mId VARCHAR(100) NOT NULL DEFAULT 0,
	mName VARCHAR(100),
	Language VARCHAR(100),
	Country VARCHAR(100),
	Ratings DECIMAL(8,1),
	Description VARCHAR(500),
	Duration INT,
	Genre VARCHAR(100),
	PRIMARY KEY (mId)
);

CREATE TABLE MovieShow (	
	shId VARCHAR(100) NOT NULL,
	Date DATE,
	Start TIME,
	End_ TIME,

	mId VARCHAR(100) NOT NULL,
	rId VARCHAR(100) NOT NULL,
	tId VARCHAR(100) NOT NULL,
	
	PRIMARY KEY (shId),
	FOREIGN KEY (mId) REFERENCES Movie(mId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (rId, tId) REFERENCES Room(rId,tId) ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE BookingTicket (
	ticketId VARCHAR(100),
	Booking_time DATETIME,
	
	cId VARCHAR(100) NOT NULL,
	shId VARCHAR(100) NOT NULL,
	sId VARCHAR(100) NOT NULL,
	tId VARCHAR(100) NOT NULL,
	rId VARCHAR(100) NOT NULL,
	pId VARCHAR(100) NOT NULL,

	PRIMARY KEY (ticketId),
	FOREIGN KEY (cId) REFERENCES Customer(cId),
	FOREIGN KEY (shId) REFERENCES MovieShow(shId),
	FOREIGN KEY (sId, rId, tId) REFERENCES Seat(sId, rId, tId),
	FOREIGN KEY (pId) REFERENCES Payment(pId)
);

CREATE TABLE Payment (
	pId VARCHAR(100),
	ticketNo INT,
	Price DECIMAL(9, 2),
    Amount AS (ticketNo * Price),
	Method VARCHAR(100),

	PRIMARY KEY (pId)
);

--MY
CREATE TABLE Customer(
	cId VARCHAR(100) NOT NULL DEFAULT 0,
	FName VARCHAR(100) NOT NULL,
	LName VARCHAR(100) NOT NULL,
	cMail VARCHAR(100) NOT NULL,
	cPassword VARCHAR(100) NOT NULL,
	cAdress VARCHAR(100) NOT NULL,
	cPhone VARCHAR(100) NOT NULL,
	cBirthday DATE,
	PRIMARY KEY (cId)
);

CREATE TABLE Room (
	rID VARCHAR(100) NOT NULL DEFAULT 0,
	rSeatAmt INT,
	tId VARCHAR(100) NOT NULL,
	PRIMARY KEY (rId, tId),
	FOREIGN KEY (tId) REFERENCES Theater (tId) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Theater(
	tId VARCHAR(100) NOT NULL DEFAULT 0,
	tName VARCHAR(100),
	tLocation VARCHAR(100) NOT NULL,
	tRoomAmt INT,
	PRIMARY KEY (tId)
);

CREATE TABLE Seat(
	sId VARCHAR(100) NOT NULL DEFAULT 0, 
	status INT,
	rId VARCHAR(100) NOT NULL,
    tId VARCHAR(100) NOT NULL,
    
    PRIMARY KEY (sId, rId, tId),
    FOREIGN KEY (rId, tId) REFERENCES Room(rId, tId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MovieGenre (
    mId VARCHAR(100) NOT NULL,
    mGenre VARCHAR(100),
    PRIMARY KEY (mId, mGenre),
    FOREIGN KEY (mId) REFERENCES Movie(mId) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Movie 
	VALUES	('001', 'Chiếm Đoạt', 'Tiếng Việt', 'Việt Nam', 7.3, 'Chồng chị muốn em, con chị cần em!', 113, 'Kịch tính'),
			('002', 'Đường Cùng', 'Tiếng Việt', 'Việt Nam', 7.3, 'Không nơi nào có thể tìm thấy được hy vọng.', 123, 'Trinh thám'),
			('003', 'Những kỷ nguyên của Taylor Swift', 'Tiếng Việt', 'Mỹ', 9.9, 'Hiện tượng văn hóa tiếp tục trên màn ảnh lớn!', 169, 'Âm nhạc'),
			('004', 'Yêu lại vợ ngầu', 'Tiếng Việt', 'Hàn Quốc', 9.1, 'Chúng ta phải nhớ để quên!', 119, 'Lãng mạn'),
			('005', 'Đất rừng phương nam', 'Tiếng Việt', 'Việt Nam', 8.2, 'Dựa theo tiểu thuyết cùng tên của nhà văn Đoàn Giỏi.', 130, 'Chiến tranh');


INSERT INTO MovieShow 
	VALUES	('MS001', '2023-11-24', '14:20', '15:13', '001', 'M12', '0123'),
			('MS002', '2023-11-19', '14:25', '17:14', '003', 'M13', '0123'),
			('MS003', '2023-12-01', '21:15', '22:53', '005', 'H15', '0124'),
			('MS004', '2023-11-30', '19:30', '21:05', '004', 'N18', '0127'),
			('MW005', '2023-11-24', '09:20', '10:27', '004', 'H14', '0124');

INSERT INTO BookingTicket 
	VALUES	('C5005B', '2023-11-12 13:23', '21204', 'MS001', 'C5', '0123', 'M12', 'P001'),
			('F1905C', '2023-11-03 09:01', '21205', 'MS002', 'F1', '0123', 'M13', 'P002'),
			('C8005B', '2023-11-10 21:14', '21206', 'MS003', 'C8', '0124', 'H15', 'P003'),
			('B1105E', '2023-11-28 22:47', '21207', 'MS004', 'B1', '0127', 'N18', 'P004'),
			('F3005C', '2023-11-20 15:13', '21208', 'MW005', 'F3', '0124', 'H14', 'P005');

INSERT INTO Seat
	VALUES  ('B2', 1, 'M11','0123'),
            ('B5', 1, 'M11','0123'),
            ('B9', 1, 'M11','0123'),
            ('C5', 1, 'M12','0123'),
            ('C6', 0, 'M12','0123'),
            ('B5', 1, 'H14','0124'),
            ('F3', 1, 'H14','0124'),
			('C9', 1, 'H15','0124'),
            ('C8', 1, 'H15','0124'),
            ('G1', 0, 'H16','0126'),
            ('A6', 1, 'M12','0123'),
            ('D7', 0, 'H16','0126'),
            ('D4', 0, 'H16','0126'),
            ('E4', 1, 'H16','0126'),
            ('E7', 1, 'H14','0124'),
            ('C5', 0, 'H14','0124'),
            ('F6', 0, 'M11','0123'),
            ('A1', 1, 'N17','0127'),
            ('B1', 1, 'N18','0127'),
            ('F1', 1, 'M13','0123');

INSERT INTO Payment 
	VALUES	( 'P001', 23, 60000, 'Momo'),
			( 'P002', 9, 80000, 'Bank'),
			( 'P003', 16, 80000, 'Bank'),
			( 'P004', 21, 100000, 'ZaloPay'),
			( 'P005', 19, 100000, 'Momo');


INSERT INTO Customer
	VALUES ('21204', 'Nguyen', 'My', 'thaomypc2003@gmail.com', 'mia2003', '01 Nguyen Hue', '0123456789', '2003-03-31'),
		   ('21205', 'Le', 'Hoang', 'thomapbitba@gmail.com', 'shibadx', '01 Dinh Duong', '0123456788', '2003-01-18'),
		   ('21206', 'Nguyen', 'Nhi', 'mnhiton@gmail.com', 'nhibienhoa', '01 Vo Thi Sau', '0123456787', '2003-03-09'),
	       ('21207', 'Nguyen', 'Phan', 'nguyenpol@gmail.com', 'vaicanguyen', '01 Nguyen Ai Quoc', '0123456786', '2003-05-03'),
		   ('21208', 'Nguyen', 'Anh', 'ntna0103@gmail.com', 'hcmiu@2002', '01 Le Hong Phong', '0123456785', '2002-03-01'),
		   ('21209', 'Tran', 'Duy', 'tqbd@gmail.com', 'tqbd@2003', '01 Vo Thi Sau', '0123456785', '2003-03-23');

INSERT INTO Room
	VALUES ('M11', 60,'0123'),
		   ('M12', 70,'0123'),
		   ('M13', 80,'0123'),
		   ('H14', 90,'0124'),
		   ('H15', 50,'0124'),
		   ('H16', 40,'0126'),
		   ('N17', 30,'0127'),
		   ('N18', 20,'0127'),
		   ('N19', 10,'0126');

SELECT * FROM Theater;
INSERT INTO Theater
	VALUES  ('0123', 'CGV', 'Phan Xich Long Phu Nhuan', 6),
		    ('0124', 'Galaxy', ' 5Lotte Linh Trung Thu Duc', 6),
			('0125', 'Cinestar', '23 Dong Khoi Q1', 4),
			('0126', 'Starlight', ' 45 Ha Huy Tap P1 Binh Tan', 5),
			('0127', 'DCine', '99 Le Quy Don Q3', 4);


INSERT INTO MovieGenre 
	VALUES  ('001', 'Action'),
			('001', 'Adventure'),
            ('001', 'Fantasy'),
            ('002', 'Action'),
            ('002', 'Comedy'),
            ('002', 'Fantasy'),
            ('003', 'Action'),
            ('003', 'Comedy'),
            ('003', 'Romance'),
            ('004', 'Animation'),
            ('004', 'Fantasy'),
            ('005', 'Adventure'),
            ('005', 'Fantasy'),
            ('005', 'Horror'),
            ('005', 'Thriller');