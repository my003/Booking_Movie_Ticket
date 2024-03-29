CREATE DATABASE Movie_Booking_System;

USE Movie_Booking_System;

DROP DATABASE Movie_Booking_System;
--NHI
CREATE TABLE Movie (
	mId VARCHAR(100) NOT NULL DEFAULT 0,
	mName VARCHAR(100),
	mLanguage VARCHAR(100),
	mCountry VARCHAR(100),
	mDuration INT,
	PRIMARY KEY (mId)
);
SELECT * FROM BookingTicket;
CREATE TABLE MovieShow (
	shId VARCHAR(100) NOT NULL,
	shDate VARCHAR(100) NOT NULL,
	shStart TIME,

	mId VARCHAR(100) NOT NULL,
	rId VARCHAR(100) NOT NULL,

	PRIMARY KEY (shId),
	FOREIGN KEY (mId) REFERENCES Movie(mId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (rId) REFERENCES Room(rId) ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE BookingTicket (
	ticketId VARCHAR(100),
	Booking_time DATETIME,

	cId VARCHAR(100) NOT NULL,
	shId VARCHAR(100) NOT NULL,
	sId VARCHAR(100) NOT NULL,
	rId VARCHAR(100) NOT NULL,
	pId VARCHAR(100) NOT NULL,

	PRIMARY KEY (ticketId),
	FOREIGN KEY (cId) REFERENCES Customer(cId),
	FOREIGN KEY (shId) REFERENCES MovieShow(shId),
	FOREIGN KEY (sId, rId) REFERENCES Seat(sId, rId),
	FOREIGN KEY (pId) REFERENCES Payment(pId)
);
CREATE TABLE Payment (
	pId VARCHAR(100),
	pTicketNo INT,
	pPrice DECIMAL(9, 2),
    pAmount AS (pTicketNo * pPrice),
	pMethod VARCHAR(100),

	PRIMARY KEY (pId)
);

--MY
SELECT * FROM MovieGenre;

CREATE TABLE Customer(
	cId VARCHAR(100) NOT NULL DEFAULT 0,
	FName VARCHAR(100) NOT NULL,
	LName VARCHAR(100) NOT NULL,
	cPassword VARCHAR(100) NOT NULL,
	cPhone VARCHAR(100) NOT NULL,
	PRIMARY KEY (cId)
);

CREATE TABLE Room (
	rID VARCHAR(100) NOT NULL DEFAULT 0,
	rSeatAmt INT,
	PRIMARY KEY (rId)
);

CREATE TABLE Seat(
	sId VARCHAR(100) NOT NULL DEFAULT 0,
	sStatus INT,
	rId VARCHAR(100) NOT NULL,

    PRIMARY KEY (sId, rId),
    FOREIGN KEY (rId) REFERENCES Room(rId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MovieGenre (
    mId VARCHAR(100) NOT NULL,
    mGenre VARCHAR(100),
    PRIMARY KEY (mId, mGenre),
    FOREIGN KEY (mId) REFERENCES Movie(mId) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Movie
	VALUES	('001', 'Chiem doat', 'Vietsub', 'Vietnam', 113),
			('002', 'Duong cung', 'Vietsub', 'Vietnam', 123),
			('003', 'Nhung ky nguyen cua Taylor Swift', 'English - Vietsub', 'US', 169),
			('004', 'Yeu lai vo ngau', 'Korean - VietSub', 'Korea', 119),
			('005', 'Dat rung phuong nam', 'Vietsub', 'Vietnam', 130),
			('006', 'Aquaman va Vuong quoc that lac','English - Vietsub','US', 124),
			('007', 'Tee Yod: Quy an tang','Thai - Vietsub','Thailand', 119),
			('008', 'Avatar: Dong chay cua nuoc','English - Vietsub','US', 192),
			('009', 'WONKA','English - Vietsub','US', 116),
			('010', 'Thieu nien va chim diec','Japanese - Vietsub','Japan', 124),
			('011', 'Mot minh van on"t','Korean - Vietsub','Korea', 103),
			('012', 'Dieu uoc','English - Vietsub','US', 94);


INSERT INTO MovieShow
	VALUES	('MS001', '24-11-2023', '08:00', '001', 'M11'),
			('MS002', '22-12-2023', '10:10', '006', 'M11'),
			('MS003', '24-11-2023', '12:20', '005', 'M11'),
			('MS004', '30-11-2023', '14:40', '004', 'M11'),
			('MS005', '01-12-2023', '16:50', '003', 'M11'),
			('MS006', '19-11-2023', '19:50', '002', 'M11'),
			('MS007', '24-11-2023', '22:00', '012', 'M11'),
			('MS008', '15-12-2023', '23:40', '011', 'M11'),

			('MS009', '08-12-2023', '08:15', '009', 'M12'),
			('MS010', '05-01-2024', '10:20', '008', 'M12'),
			('MS011', '29-12-2023', '14:00', '007', 'M12'),
			('MS012', '24-11-2023', '16:05', '012', 'M12'),
			('MS013', '30-11-2023', '17:45', '004', 'M12'),
			('MS014', '01-12-2023', '19:50', '003', 'M12'),
			('MS015', '15-12-2023', '22:45', '011', 'M12'),

			('MS016', '01-12-2023', '07:50', '003', 'M13'),
			('MS017', '19-11-2023', '10:45', '002', 'M13'),
			('MS018', '24-11-2023', '12:55', '001', 'M13'),
			('MS019', '22-12-2023', '14:50', '006', 'M13'),
			('MS020', '24-11-2023', '17:00', '005', 'M13'),
			('MS021', '30-11-2023', '19:15', '004', 'M13'),
			('MS022', '15-12-2023', '21:20', '010', 'M13'),
			('MS023', '08-12-2023', '23:30', '009', 'M13'),

			('MS024', '30-11-2023', '08:00', '004', 'M14'),
			('MS025', '01-12-2023', '10:05', '003', 'M14'),
			('MS026', '19-11-2023', '13:00', '002', 'M14'),
			('MS027', '24-11-2023', '15:05', '001', 'M14'),
			('MS028', '22-12-2023', '17:05', '006', 'M14'),
			('MS029', '24-11-2023', '19:20', '005', 'M14'),
			('MS030', '29-12-2023', '21:30', '007', 'M14'),
			('MS031', '24-11-2023', '23:30', '012', 'M14'),

			('MS032', '24-11-2023', '08:20', '005', 'M15'),
			('MS033', '30-11-2023', '10:35', '004', 'M15'),
			('MS034', '01-12-2023', '12:35', '003', 'M15'),
			('MS035', '19-11-2023', '15:30', '002', 'M15'),
			('MS036', '22-12-2023', '17:40', '006', 'M15'),
			('MS037', '05-01-2024', '19:40', '008', 'M15'),
			('MS038', '29-12-2023', '21:50', '007', 'M15'),

			('MS039', '24-11-2023', '08:05', '012', 'M16'),
			('MS040', '15-12-2023', '09:45', '011', 'M16'),
			('MS041', '15-12-2023', '11:30', '010', 'M16'),
			('MS042', '08-12-2023', '13:35', '009', 'M16'),
			('MS043', '05-01-2024', '15:35', '008', 'M16'),
			('MS044', '24-11-2023', '18:50', '001', 'M16'),
			('MS045', '19-11-2023', '20:50', '002', 'M16'),
			('MS046', '01-12-2023', '22:55', '003', 'M16');

INSERT INTO BookingTicket 
	VALUES	('C00101201', '2024-01-02 10:32:55', 'C001', 'MS031', 'F07', 'M14', 'P001'),
			('C00101202', '2024-01-02 10:32:55', 'C001', 'MS031', 'F08', 'M14', 'P001'),
			('C00201001', '2024-01-02 08:30:05', 'C002', 'MS041', 'E04', 'M16', 'P002'),
			('C00201002', '2024-01-02 08:30:05', 'C002', 'MS041', 'E05', 'M16', 'P002'),
			('C00201003', '2024-01-02 08:30:05', 'C002', 'MS041', 'E06', 'M16', 'P002'),
			('C00300501', '2024-01-03 22:05:54', 'C003', 'MS032', 'H03', 'M15', 'P003');

INSERT INTO Payment 
	VALUES	( 'P001', 2, 45000, 'Momo'),
			( 'P002', 3, 45000, 'Bank'),
			( 'P003', 1, 45000, 'ZaloPay');
INSERT INTO Seat
	VALUES  ('A01', 0, 'M11'),
			('A02', 0, 'M11'),
			('A03', 0, 'M11'),
			('A04', 0, 'M11'),
			('A05', 0, 'M11'),
			('A06', 0, 'M11'),
			('A07', 0, 'M11'),
			('A08', 0, 'M11'),
			('A09', 0, 'M11'),
			('A10', 0, 'M11'),
			('B01', 0, 'M11'),
	        ('B02', 0, 'M11'),
	        ('B03', 0, 'M11'),
	        ('B04', 0, 'M11'),
	        ('B05', 0, 'M11'),
	        ('B06', 0, 'M11'),
	        ('B07', 0, 'M11'),
	        ('B08', 0, 'M11'),
	        ('B09', 0, 'M11'),
	        ('B10', 0, 'M11'),
	        ('C01', 0, 'M11'),
	        ('C02', 0, 'M11'),
	        ('C03', 0, 'M11'),
	        ('C04', 0, 'M11'),
	        ('C05', 0, 'M11'),
	        ('C06', 0, 'M11'),
	        ('C07', 0, 'M11'),
	        ('C08', 0, 'M11'),
	        ('C09', 0, 'M11'),
	        ('C10', 0, 'M11'),
	        ('D01', 0, 'M11'),
	        ('D02', 0, 'M11'),
	        ('D03', 0, 'M11'),
	        ('D04', 0, 'M11'),
	        ('D05', 0, 'M11'),
	        ('D06', 0, 'M11'),
	        ('D07', 0, 'M11'),
	        ('D08', 0, 'M11'),
	        ('D09', 0, 'M11'),
	        ('D10', 0, 'M11'),
			('E01', 0, 'M11'),
     	    ('E02', 0, 'M11'),
            ('E03', 0, 'M11'),
            ('E04', 0, 'M11'),
            ('E05', 0, 'M11'),
            ('E06', 0, 'M11'),
            ('E07', 0, 'M11'),
            ('E08', 0, 'M11'),
            ('E09', 0, 'M11'),
            ('E10', 0, 'M11'),
            ('F01', 0, 'M11'),
            ('F02', 0, 'M11'),
            ('F03', 0, 'M11'),
            ('F04', 0, 'M11'),
            ('F05', 0, 'M11'),
            ('F06', 0, 'M11'),
            ('F07', 0, 'M11'),
            ('F08', 0, 'M11'),
            ('F09', 0, 'M11'),
            ('F10', 0, 'M11'),
            ('G01', 0, 'M11'),
            ('G02', 0, 'M11'),
            ('G03', 0, 'M11'),
            ('G04', 0, 'M11'),
            ('G05', 0, 'M11'),
            ('G06', 0, 'M11'),
            ('G07', 0, 'M11'),
            ('G08', 0, 'M11'),
            ('G09', 0, 'M11'),
            ('G10', 0, 'M11'),
            ('H01', 0, 'M11'),
            ('H02', 0, 'M11'),
            ('H03', 0, 'M11'),
            ('H04', 0, 'M11'),
            ('H05', 0, 'M11'),
            ('H06', 0, 'M11'),
            ('H07', 0, 'M11'),
            ('H08', 0, 'M11'),
            ('H09', 0, 'M11'),
            ('H10', 0, 'M11'),
            ('I01', 0, 'M11'),
	        ('I02', 0, 'M11'),
	        ('I03', 0, 'M11'),
	        ('I04', 0, 'M11'),
	        ('I05', 0, 'M11'),
	        ('I06', 0, 'M11'),
	        ('I07', 0, 'M11'),
	        ('I08', 0, 'M11'),
	        ('I09', 0, 'M11'),
	        ('I10', 0, 'M11'),

		    ('A01', 0, 'M12'),
	        ('A02', 0, 'M12'),
	        ('A03', 0, 'M12'),
	        ('A04', 0, 'M12'),
	        ('A05', 0, 'M12'),
	        ('A06', 0, 'M12'),
	        ('A07', 0, 'M12'),
	        ('A08', 0, 'M12'),
	        ('A09', 0, 'M12'),
	        ('A10', 0, 'M12'),
	        ('B01', 0, 'M12'),
	        ('B02', 0, 'M12'),
	        ('B03', 0, 'M12'),
	        ('B04', 0, 'M12'),
	        ('B05', 0, 'M12'),
	        ('B06', 0, 'M12'),
	        ('B07', 0, 'M12'),
	        ('B09', 0, 'M12'),
	        ('B10', 0, 'M12'),
	        ('C01', 0, 'M12'),
	        ('C02', 0, 'M12'),
	        ('C03', 0, 'M12'),
	        ('C04', 0, 'M12'),
	        ('C05', 0, 'M12'),
	        ('C06', 0, 'M12'),
	        ('C07', 0, 'M12'),
	        ('C08', 0, 'M12'),
	        ('C09', 0, 'M12'),
	        ('C10', 0, 'M12'),
	        ('D01', 0, 'M12'),
	        ('D02', 0, 'M12'),
	        ('D03', 0, 'M12'),
	        ('D04', 0, 'M12'),
	        ('D05', 0, 'M12'),
	        ('D06', 0, 'M12'),
	        ('D07', 0, 'M12'),
	        ('D08', 0, 'M12'),
	        ('D09', 0, 'M12'),
	        ('D10', 0, 'M12'),
	        ('E01', 0, 'M12'),
	        ('E02', 0, 'M12'),
	        ('E03', 0, 'M12'),
	        ('E04', 0, 'M12'),
	        ('E05', 0, 'M12'),
	        ('E06', 0, 'M12'),
	        ('E07', 0, 'M12'),
	        ('E08', 0, 'M12'),
	        ('E09', 0, 'M12'),
	        ('E10', 0, 'M12'),
	        ('F01', 0, 'M12'),
	        ('F02', 0, 'M12'),
	        ('F03', 0, 'M12'),
	        ('F04', 0, 'M12'),
	        ('F05', 0, 'M12'),
	        ('F06', 0, 'M12'),
	        ('F07', 0, 'M12'),
	        ('F08', 0, 'M12'),
	        ('F09', 0, 'M12'),
	        ('F10', 0, 'M12'),
	        ('G01', 0, 'M12'),
	        ('G02', 0, 'M12'),
	        ('G03', 0, 'M12'),
	        ('G04', 0, 'M12'),
	        ('G05', 0, 'M12'),
	        ('G06', 0, 'M12'),
	        ('G07', 0, 'M12'),
	        ('G08', 0, 'M12'),
	        ('G09', 0, 'M12'),
	        ('G10', 0, 'M12'),
	        ('H01', 0, 'M12'),
	        ('H02', 0, 'M12'),
	        ('H03', 0, 'M12'),
	        ('H04', 0, 'M12'),
	        ('H05', 0, 'M12'),
	        ('H06', 0, 'M12'),
	        ('H07', 0, 'M12'),
	        ('H08', 0, 'M12'),
	        ('H09', 0, 'M12'),
	        ('H10', 0, 'M12'),

			('A01', 0, 'M13'),
	        ('A02', 0, 'M13'),
	        ('A03', 0, 'M13'),
	        ('A04', 0, 'M13'),
	        ('A05', 0, 'M13'),
	        ('A06', 0, 'M13'),
	        ('A07', 0, 'M13'),
	        ('A08', 0, 'M13'),
	        ('A09', 0, 'M13'),
	        ('A10', 0, 'M13'),
	        ('B01', 0, 'M13'),
	        ('B02', 0, 'M13'),
	        ('B03', 0, 'M13'),
	        ('B04', 0, 'M13'),
	        ('B05', 0, 'M13'),
	        ('B06', 0, 'M13'),
	        ('B07', 0, 'M13'),
	        ('B09', 0, 'M13'),
	        ('B10', 0, 'M13'),
	        ('C01', 0, 'M13'),
	        ('C02', 0, 'M13'),
	        ('C03', 0, 'M13'),
	        ('C04', 0, 'M13'),
	        ('C05', 0, 'M13'),
	        ('C06', 0, 'M13'),
	        ('C07', 0, 'M13'),
	        ('C08', 0, 'M13'),
	        ('C09', 0, 'M13'),
	        ('C10', 0, 'M13'),
	        ('D01', 0, 'M13'),
	        ('D02', 0, 'M13'),
	        ('D03', 0, 'M13'),
	        ('D04', 0, 'M13'),
	        ('D05', 0, 'M13'),
	        ('D06', 0, 'M13'),
	        ('D07', 0, 'M13'),
	        ('D08', 0, 'M13'),
	        ('D09', 0, 'M13'),
	        ('D10', 0, 'M13'),
	        ('E01', 0, 'M13'),
	        ('E02', 0, 'M13'),
	        ('E03', 0, 'M13'),
	        ('E04', 0, 'M13'),
	        ('E05', 0, 'M13'),
	        ('E06', 0, 'M13'),
	        ('E07', 0, 'M13'),
	        ('E08', 0, 'M13'),
	        ('E09', 0, 'M13'),
	        ('E10', 0, 'M13'),
	        ('F01', 0, 'M13'),
	        ('F02', 0, 'M13'),
	        ('F03', 0, 'M13'),
	        ('F04', 0, 'M13'),
	        ('F05', 0, 'M13'),
	        ('F06', 0, 'M13'),
	        ('F07', 1, 'M13'),
	        ('F08', 1, 'M13'),
	        ('F09', 0, 'M13'),
	        ('F10', 0, 'M13'),
	        ('G01', 0, 'M13'),
	        ('G02', 0, 'M13'),
	        ('G03', 0, 'M13'),
	        ('G04', 0, 'M13'),
	        ('G05', 0, 'M13'),
	        ('G06', 0, 'M13'),
	        ('G07', 0, 'M13'),
	        ('G08', 0, 'M13'),
	        ('G09', 0, 'M13'),
	        ('G10', 0, 'M13'),
	        ('H01', 0, 'M13'),
	        ('H02', 0, 'M13'),
	        ('H03', 0, 'M13'),
	        ('H04', 0, 'M13'),
	        ('H05', 0, 'M13'),
	        ('H06', 0, 'M13'),
	        ('H07', 0, 'M13'),
	        ('H08', 0, 'M13'),
	        ('H09', 0, 'M13'),
	        ('H10', 0, 'M13'),
	        ('I01', 0, 'M13'),
	        ('I02', 0, 'M13'),
	        ('I03', 0, 'M13'),
	        ('I04', 0, 'M13'),
	        ('I05', 0, 'M13'),
	        ('I06', 0, 'M13'),
	        ('I07', 0, 'M13'),
	        ('I08', 0, 'M13'),
	        ('I09', 0, 'M13'),
	        ('I10', 0, 'M13'),
	        ('K01', 0, 'M13'),
	        ('K02', 0, 'M13'),
	        ('K03', 0, 'M13'),
	        ('K04', 0, 'M13'),
	        ('K05', 0, 'M13'),
	        ('K06', 0, 'M13'),
	        ('K07', 0, 'M13'),
	        ('K08', 0, 'M13'),
	        ('K09', 0, 'M13'),
	        ('K10', 0, 'M13'),

	        ('A01', 0, 'M14'),
	        ('A02', 0, 'M14'),
	        ('A03', 0, 'M14'),
	        ('A04', 0, 'M14'),
	        ('A05', 0, 'M14'),
	        ('A06', 0, 'M14'),
	        ('A07', 0, 'M14'),
	        ('A08', 0, 'M14'),
	        ('A09', 0, 'M14'),
	        ('A10', 0, 'M14'),
	        ('B01', 0, 'M14'),
	        ('B02', 0, 'M14'),
	        ('B03', 0, 'M14'),
	        ('B04', 0, 'M14'),
	        ('B05', 0, 'M14'),
	        ('B06', 0, 'M14'),
	        ('B07', 0, 'M14'),
	        ('B09', 0, 'M14'),
	        ('B10', 0, 'M14'),
	        ('C01', 0, 'M14'),
	        ('C02', 0, 'M14'),
	        ('C03', 0, 'M14'),
	        ('C04', 0, 'M14'),
	        ('C05', 0, 'M14'),
	        ('C06', 0, 'M14'),
	        ('C07', 0, 'M14'),
	        ('C08', 0, 'M14'),
	        ('C09', 0, 'M14'),
	        ('C10', 0, 'M14'),
	        ('D01', 0, 'M14'),
	        ('D02', 0, 'M14'),
	        ('D03', 0, 'M14'),
	        ('D04', 0, 'M14'),
	        ('D05', 0, 'M14'),
	        ('D06', 0, 'M14'),
	        ('D07', 0, 'M14'),
	        ('D08', 0, 'M14'),
	        ('D09', 0, 'M14'),
	        ('D10', 0, 'M14'),
	        ('E01', 0, 'M14'),
	        ('E02', 0, 'M14'),
	        ('E03', 0, 'M14'),
	        ('E04', 0, 'M14'),
	        ('E05', 0, 'M14'),
	        ('E06', 0, 'M14'),
	        ('E07', 0, 'M14'),
	        ('E08', 0, 'M14'),
	        ('E09', 0, 'M14'),
	        ('E10', 0, 'M14'),
	        ('F01', 0, 'M14'),
	        ('F02', 0, 'M14'),
	        ('F03', 0, 'M14'),
	        ('F04', 0, 'M14'),
	        ('F05', 0, 'M14'),
	        ('F06', 0, 'M14'),
	        ('F07', 0, 'M14'),
	        ('F08', 0, 'M14'),
	        ('F09', 0, 'M14'),
	        ('F10', 0, 'M14'),
	        ('G01', 0, 'M14'),
	        ('G02', 0, 'M14'),
	        ('G03', 0, 'M14'),
	        ('G04', 0, 'M14'),
	        ('G05', 0, 'M14'),
	        ('G06', 0, 'M14'),
	        ('G07', 0, 'M14'),
	        ('G08', 0, 'M14'),
	        ('G09', 0, 'M14'),
	        ('G10', 0, 'M14'),
	        ('H01', 0, 'M14'),
	        ('H02', 0, 'M14'),
	        ('H03', 0, 'M14'),
	        ('H04', 0, 'M14'),
	        ('H05', 0, 'M14'),
	        ('H06', 0, 'M14'),
	        ('H07', 0, 'M14'),
	        ('H08', 0, 'M14'),
	        ('H09', 0, 'M14'),
	        ('H10', 0, 'M14'),
	        ('I01', 0, 'M14'),
	        ('I02', 0, 'M14'),
	        ('I03', 0, 'M14'),
	        ('I04', 0, 'M14'),
	        ('I05', 0, 'M14'),
	        ('I06', 0, 'M14'),
	        ('I07', 0, 'M14'),
	        ('I08', 0, 'M14'),
	        ('I09', 0, 'M14'),
	        ('I10', 0, 'M14'),

	        ('A01', 0, 'M15'),
	        ('A02', 0, 'M15'),
	        ('A03', 0, 'M15'),
	        ('A04', 0, 'M15'),
	        ('A05', 0, 'M15'),
	        ('A06', 0, 'M15'),
	        ('A07', 0, 'M15'),
	        ('A08', 0, 'M15'),
	        ('A09', 0, 'M15'),
	        ('A10', 0, 'M15'),
	        ('B01', 0, 'M15'),
	        ('B02', 0, 'M15'),
	        ('B03', 0, 'M15'),
	        ('B04', 0, 'M15'),
	        ('B05', 0, 'M15'),
	        ('B06', 0, 'M15'),
	        ('B07', 0, 'M15'),
	        ('B09', 0, 'M15'),
	        ('B10', 0, 'M15'),
	        ('C01', 0, 'M15'),
	        ('C02', 0, 'M15'),
	        ('C03', 0, 'M15'),
	        ('C04', 0, 'M15'),
	        ('C05', 0, 'M15'),
	        ('C06', 0, 'M15'),
	        ('C07', 0, 'M15'),
	        ('C08', 0, 'M15'),
	        ('C09', 0, 'M15'),
	        ('C10', 0, 'M15'),
	        ('D01', 0, 'M15'),
	        ('D02', 0, 'M15'),
	        ('D03', 0, 'M15'),
	        ('D04', 0, 'M15'),
	        ('D05', 0, 'M15'),
	        ('D06', 0, 'M15'),
	        ('D07', 0, 'M15'),
	        ('D08', 0, 'M15'),
	        ('D09', 0, 'M15'),
	        ('D10', 0, 'M15'),
	        ('E01', 0, 'M15'),
	        ('E02', 0, 'M15'),
	        ('E03', 0, 'M15'),
	        ('E04', 0, 'M15'),
	        ('E05', 0, 'M15'),
	        ('E06', 0, 'M15'),
	        ('E07', 0, 'M15'),
	        ('E08', 0, 'M15'),
	        ('E09', 0, 'M15'),
	        ('E10', 0, 'M15'),
	        ('F01', 0, 'M15'),
	        ('F02', 0, 'M15'),
	        ('F03', 0, 'M15'),
	        ('F04', 0, 'M15'),
	        ('F05', 0, 'M15'),
	        ('F06', 0, 'M15'),
	        ('F07', 0, 'M15'),
	        ('F08', 0, 'M15'),
	        ('F09', 0, 'M15'),
	        ('F10', 0, 'M15'),
	        ('G01', 0, 'M15'),
	        ('G02', 0, 'M15'),
	        ('G03', 0, 'M15'),
	        ('G04', 0, 'M15'),
	        ('G05', 0, 'M15'),
	        ('G06', 0, 'M15'),
	        ('G07', 0, 'M15'),
	        ('G08', 0, 'M15'),
	        ('G09', 0, 'M15'),
	        ('G10', 0, 'M15'),
	        ('H01', 0, 'M15'),
	        ('H02', 0, 'M15'),
	        ('H03', 1, 'M15'),
	        ('H04', 0, 'M15'),
	        ('H05', 0, 'M15'),
	        ('H06', 0, 'M15'),
	        ('H07', 0, 'M15'),
	        ('H08', 0, 'M15'),
	        ('H09', 0, 'M15'),
	        ('H10', 0, 'M15'),
	        ('I01', 0, 'M15'),
	        ('I02', 0, 'M15'),
	        ('I03', 0, 'M15'),
	        ('I04', 0, 'M15'),
	        ('I05', 0, 'M15'),
	        ('I06', 0, 'M15'),
	        ('I07', 0, 'M15'),
	        ('I08', 0, 'M15'),
	        ('I09', 0, 'M15'),
	        ('I10', 0, 'M15'),
	        ('K01', 0, 'M15'),
	        ('K02', 0, 'M15'),
	        ('K03', 0, 'M15'),
	        ('K04', 0, 'M15'),
	        ('K05', 0, 'M15'),
	        ('K06', 0, 'M15'),
	        ('K07', 0, 'M15'),
	        ('K08', 0, 'M15'),
	        ('K09', 0, 'M15'),
	        ('K10', 0, 'M15'),

	        ('A01', 0, 'M16'),
	        ('A02', 0, 'M16'),
	        ('A03', 0, 'M16'),
	        ('A04', 0, 'M16'),
	        ('A05', 0, 'M16'),
	        ('A06', 0, 'M16'),
	        ('A07', 0, 'M16'),
	        ('A08', 0, 'M16'),
	        ('A09', 0, 'M16'),
	        ('A10', 0, 'M16'),
	        ('B01', 0, 'M16'),
	        ('B02', 0, 'M16'),
	        ('B03', 0, 'M16'),
	        ('B04', 0, 'M16'),
	        ('B05', 0, 'M16'),
	        ('B06', 0, 'M16'),
	        ('B07', 0, 'M16'),
	        ('B09', 0, 'M16'),
	        ('B10', 0, 'M16'),
	        ('C01', 0, 'M16'),
	        ('C02', 0, 'M16'),
	        ('C03', 0, 'M16'),
	        ('C04', 0, 'M16'),
	        ('C05', 0, 'M16'),
	        ('C06', 0, 'M16'),
	        ('C07', 0, 'M16'),
	        ('C08', 0, 'M16'),
	        ('C09', 0, 'M16'),
	        ('C10', 0, 'M16'),
	        ('D01', 0, 'M16'),
	        ('D02', 0, 'M16'),
	        ('D03', 0, 'M16'),
	        ('D04', 0, 'M16'),
	        ('D05', 0, 'M16'),
	        ('D06', 0, 'M16'),
	        ('D07', 0, 'M16'),
	        ('D08', 0, 'M16'),
	        ('D09', 0, 'M16'),
	        ('D10', 0, 'M16'),
	        ('E01', 0, 'M16'),
	        ('E02', 0, 'M16'),
	        ('E03', 0, 'M16'),
	        ('E04', 1, 'M16'),
	        ('E05', 1, 'M16'),
	        ('E06', 1, 'M16'),
	        ('E07', 0, 'M16'),
	        ('E08', 0, 'M16'),
	        ('E09', 0, 'M16'),
	        ('E10', 0, 'M16'),
	        ('F01', 0, 'M16'),
	        ('F02', 0, 'M16'),
	        ('F03', 0, 'M16'),
	        ('F04', 0, 'M16'),
	        ('F05', 0, 'M16'),
	        ('F06', 0, 'M16'),
	        ('F07', 0, 'M16'),
	        ('F08', 0, 'M16'),
	        ('F09', 0, 'M16'),
	        ('F10', 0, 'M16'),
	        ('G01', 0, 'M16'),
	        ('G02', 0, 'M16'),
	        ('G03', 0, 'M16'),
	        ('G04', 0, 'M16'),
	        ('G05', 0, 'M16'),
	        ('G06', 0, 'M16'),
	        ('G07', 0, 'M16'),
	        ('G08', 0, 'M16'),
	        ('G09', 0, 'M16'),
	        ('G10', 0, 'M16'),
	        ('H01', 0, 'M16'),
	        ('H02', 0, 'M16'),
	        ('H03', 0, 'M16'),
	        ('H04', 0, 'M16'),
	        ('H05', 0, 'M16'),
	        ('H06', 0, 'M16'),
	        ('H07', 0, 'M16'),
	        ('H08', 0, 'M16'),
	        ('H09', 0, 'M16'),
	        ('H10', 0, 'M16');


INSERT INTO Customer
	VALUES ('C001', 'Nguyen', 'My','mia2003','0123456001'),
		   ('C002', 'Le', 'Hoang', 'shibadx', '0123456002'),
		   ('C003', 'Ha', 'Nhi','nhibienhoa', '0123456003'),
		   ('C000', 'Nguyen', 'Phu', 'nqphu@iu', '0123456000');

INSERT INTO Room
	VALUES ('M11', 90),
		   ('M12', 80),
		   ('M13', 100),
		   ('M14', 90),
		   ('M15', 100),
		   ('M16', 80);

INSERT INTO MovieGenre

	VALUES  ('001','Thriller'),
			('001','Comedy'),
			('002','Crime'),
			('002','Thriller'),
			('003','Musical'),
			('004','Family'),
			('004','Romance'),
			('004','Comedy'),
			('005','War'),
			('005','Family'),
			('006','Action'),
			('006','Adventure'),
			('006','Mystery'),
			('007','Horror'),
			('008','Action'),
			('008','Science fiction'),
			('008','Adventure'),
			('009','Family'),
			('009','Comedy'),
			('009','Adventure'),
			('009','Thần thoại'),
			('010','Family'),
			('010','Animation'),
			('010','Adventure'),
			('011','Comedy'),
			('011','Romance'),
			('012','Comedy'),
			('012','Animation');
