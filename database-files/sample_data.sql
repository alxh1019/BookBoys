CREATE TABLE Customer(
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    Membership_Date DATETIME,
    CustomerID INT NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Events(
    EventID INT NOT NULL,
    Max_Capacity INT NOT NULL,
    Date DATETIME,
    Location VARCHAR(50),
    Title VARCHAR(150),
    Time TIME NOT NULL,
    PRIMARY KEY (EventID)
);

CREATE TABLE Report(
    Date DATETIME,
    Book_Usage VARCHAR(50),
    Category_Trends VARCHAR(50),
    ReportID INT NOT NULL,
    PRIMARY KEY (ReportID)
);

CREATE TABLE Librarian(
    Role VARCHAR(50),
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    LibrarianID INT NOT NULL,
    PRIMARY KEY (LibrarianID)
);

CREATE TABLE Website(
    WebsiteURL VARCHAR(50),
    Name VARCHAR(50),
    Last_Updated DATETIME NOT NULL,
    PRIMARY KEY (WebsiteURL)
);

CREATE TABLE MembershipPlan(
    PlanID INT NOT NULL,
    Fee INT NOT NULL,
    Duration INT NOT NULL,
    PRIMARY KEY (PlanID)
);

CREATE TABLE Search_Filter(
    Time_Stamp DATETIME NOT NULL,
    FilterID INT NOT NULL,
    Filter_Type VARCHAR(50),
    Filter_Value VARCHAR(50),
    LibrarianID INT NOT NULL,
    Primary Key (FilterID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID) ON DELETE CASCADE
);

CREATE TABLE Admin(
    FName VARCHAR(50),
    MName VARCHAR(50),
    LName VARCHAR(50),
    Last_Login DATETIME,
    Role VARCHAR(50),
    AdminID INT NOT NULL,
    ReportID INT NOT NULL,
    PRIMARY KEY (AdminID),
    FOREIGN KEY (ReportID) REFERENCES Report(ReportID) ON DELETE CASCADE
);

CREATE TABLE User_Log(
    Action VARCHAR(50),
    Time_Stamp DATETIME NOT NULL,
    LogID INT NOT NULL,
    AdminID INT NOT NULL,
    PRIMARY KEY (LogID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) ON DELETE CASCADE
);

CREATE TABLE Payment(
    PaymentID INT NOT NULL,
    Amount INT NOT NULL,
    Date DATETIME,
    Method VARCHAR(50),
    CustomerID INT NOT NULL,
    PRIMARY KEY(PaymentID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Notification(
    NotificationID INT NOT NULL,
    Message VARCHAR(500),
    Date_Sent INT NOT NULL,
    AdminID INT NOT NULL,
    PRIMARY KEY (NotificationID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) ON DELETE CASCADE
);

CREATE TABLE Author(
    AuthorID INT NOT NULL,
    Date_Of_Birth DATE,
    FName VARCHAR(50),
    LName VARCHAR(50),
    PRIMARY KEY (AuthorID)
);

CREATE TABLE Books(
    BookID INT NOT NULL,
    Genre VARCHAR(50),
    Title VARCHAR(150),
    Pages INT NOT NULL,
    CustomerID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE
);

CREATE TABLE Book_Status(
    Status VARCHAR(50),
    BookID INT NOT NULL,
    PRIMARY KEY (BookID, Status),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);

CREATE Table Registers_For(
    EventID INT NOT NULL,
    CustomerID INT NOT NULL,
    PRIMARY KEY (EventID, CustomerID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

CREATE Table Organizes(
    BookID INT NOT NULL,
    LibrarianID INT NOT NULL,
    PRIMARY KEY (BookID, LibrarianID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID) ON DELETE CASCADE
);

CREATE Table Stores(
    WebsiteURL VARCHAR(200),
    BookID INT NOT NULL,
    PRIMARY KEY (BookID, WebsiteURL),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (WebsiteURL) REFERENCES Website(WebsiteURL) ON DELETE CASCADE
);

CREATE Table Sets_Up(
    EventID INT NOT NULL ,
    LibrarianID INT NOT NULL,
    PRIMARY KEY (EventID, LibrarianID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE,
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID) ON DELETE CASCADE
);

CREATE Table Browses(
    CustomerID INT NOT NULL ,
    WebsiteURL VARCHAR(200),
    PRIMARY KEY (CustomerID, WebsiteURL),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (WebsiteURL) REFERENCES Website(WebsiteURL) ON DELETE CASCADE
);

CREATE Table Manages(
    AdminID INT NOT NULL ,
    WebsiteURL VARCHAR(200),
    PRIMARY KEY (AdminID, WebsiteURL),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) ON DELETE CASCADE,
    FOREIGN KEY (WebsiteURL) REFERENCES Website(WebsiteURL) ON DELETE CASCADE
);

CREATE TABLE Favorites (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    product_name VARCHAR(150),
    genre VARCHAR(50),
    PRIMARY KEY (BookID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID) ON DELETE CASCADE
);

insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (1, '4/13/2024', 'Miguel', 'Stinchcombe', 'Ashlen');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (2, '4/14/2023', 'Damara', 'Coulling', 'Amory');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (3, '7/18/2023', 'Davin', 'Dishman', 'Cassy');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (4, '8/10/2024', 'Ciro', 'Arundale', 'Saloma');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (5, '8/26/2024', 'Seymour', 'Bernath', 'Gui');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (6, '5/15/2024', 'Blisse', 'Stanlake', 'Isaiah');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (7, '3/1/2023', 'Jennette', 'Goodbarne', 'Herb');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (8, '1/4/2024', 'Rudolfo', 'Ranson', 'Paddy');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (9, '8/16/2023', 'Terza', 'Shilvock', 'Demetris');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (10, '12/18/2024', 'Elvis', 'Pigot', 'Carole');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (11, '2/26/2025', 'Trey', 'Colby', 'Marshal');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (12, '2/6/2024', 'Sollie', 'Chaize', 'Sammy');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (13, '10/5/2024', 'Milly', 'Philcox', 'Kippie');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (14, '3/28/2024', 'Giacomo', 'Eivers', 'Irwin');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (15, '11/6/2023', 'Jonell', 'Bawles', 'Kerby');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (16, '10/23/2023', 'Tabbi', 'Bauer', 'Inness');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (17, '7/14/2023', 'Lexie', 'Dabel', 'Adelina');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (18, '9/26/2023', 'Cad', 'Pinkney', 'Clarette');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (19, '10/17/2023', 'Lisha', 'Dilleston', 'Byrom');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (20, '2/7/2024', 'Milton', 'McElvine', 'Domini');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (21, '11/20/2023', 'Hailey', 'Querree', 'Raff');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (22, '5/16/2023', 'Alexio', 'Rolles', 'Gwenora');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (23, '6/22/2024', 'Roxine', 'Cranmer', 'Keri');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (24, '6/19/2023', 'Benedicto', 'Briggdale', 'Gayel');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (25, '5/14/2023', 'Dalenna', 'Gerbel', 'Kati');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (26, '5/24/2023', 'Cecilla', 'Weatherley', 'Dillon');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (27, '8/1/2023', 'Brenn', 'Humphris', 'Algernon');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (28, '4/26/2023', 'Gustave', 'Huddlestone', 'Ashlie');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (29, '9/29/2024', 'Dewitt', 'Langhorne', 'Leonie');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (30, '5/28/2023', 'Mohandas', 'Sphinxe', 'Brocky');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (31, '11/30/2023', 'Ibbie', 'Saban', 'Franchot');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (32, '5/7/2024', 'Xena', 'Ridsdole', 'Reid');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (33, '4/16/2025', 'Bobina', 'Figure', 'Alfie');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (34, '2/15/2025', 'Kerry', 'Roumier', 'Homere');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (35, '9/17/2024', 'Gerick', 'Becraft', 'Giacinta');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (36, '1/2/2024', 'Nora', 'Ruste', 'Graeme');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (37, '3/29/2023', 'Dede', 'Ensor', 'Jefferson');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (38, '2/3/2024', 'Merilee', 'Dorant', 'Flore');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (39, '3/13/2024', 'Evin', 'Saddington', 'Maisie');
insert into Customer (CustomerID, Membership_Date, FName, LName, MName) values (40, '9/1/2023', 'Raimondo', 'Pygott', 'Rowland');


insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (1, '7/11/2023', '4:33 PM', 'Author Meetup', 'Muang Sam Sip', 106);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (2, '10/16/2023', '10:05 AM', 'Author Meetup', 'Kaolinovo', 33);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (3, '4/9/2025', '4:07 PM', 'Poetry Reading', 'Kuleqi', 60);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (4, '10/14/2024', '12:46 PM', 'Author Meetup', 'Kosonsoy', 56);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (5, '2/26/2024', '11:50 AM', 'Poetry Reading', 'Sam Chuk', 17);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (6, '4/22/2023', '11:52 PM', 'Poetry Reading', 'Gavião', 141);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (7, '1/20/2025', '2:30 PM', 'Book Club', 'Bai’e', 38);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (8, '4/8/2025', '8:06 AM', 'Book Club', 'Waru', 33);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (9, '8/7/2023', '9:45 PM', 'Book Club', 'Kraskino', 117);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (10, '3/23/2025', '1:21 PM', 'Book Club', 'Tiantai', 64);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (11, '1/17/2025', '7:32 PM', 'Author Meetup', 'New York City', 91);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (12, '8/20/2024', '3:15 PM', 'Book Club', 'Sukosari', 76);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (13, '9/5/2024', '2:23 PM', 'Book Club', 'Ciilat', 66);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (14, '1/11/2025', '10:53 PM', 'Author Meetup', 'Bŭstonqal’a', 76);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (15, '7/12/2024', '9:16 AM', 'Author Meetup', 'Palenggihan', 26);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (16, '7/8/2023', '2:11 PM', 'Poetry Reading', 'Lianghe', 68);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (17, '8/17/2023', '7:00 PM', 'Book Exchange', 'Ust’-Uda', 67);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (18, '8/5/2023', '6:58 PM', 'Author Meetup', 'Ordem', 58);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (19, '5/15/2024', '7:36 AM', 'Poetry Reading', 'Máncora', 140);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (20, '6/1/2023', '6:44 AM', 'Poetry Reading', 'Kuybyshevskiy Zaton', 38);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (21, '12/9/2024', '5:40 PM', 'Author Meetup', 'Quanxi', 1);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (22, '3/26/2023', '3:58 PM', 'Book Club', 'Aoji-ri', 60);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (23, '12/19/2023', '11:33 AM', 'Book Club', 'Basseterre', 61);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (24, '3/30/2024', '9:38 PM', 'Book Exchange', 'Cidahu', 85);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (25, '3/3/2024', '11:32 PM', 'Author Meetup', 'Youxikou', 52);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (26, '3/5/2024', '8:35 AM', 'Book Exchange', 'Boa Viagem', 66);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (27, '9/19/2023', '9:16 AM', 'Author Meetup', 'Ząbkowice Śląskie', 85);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (28, '7/13/2024', '2:04 PM', 'Book Club', 'Sapotskin', 51);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (29, '11/30/2024', '4:48 PM', 'Poetry Reading', 'Anle', 122);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (30, '8/10/2024', '9:08 PM', 'Book Exchange', 'Rebe', 59);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (31, '2/21/2025', '9:03 AM', 'Book Exchange', 'Châteauroux', 50);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (32, '4/16/2023', '10:02 PM', 'Poetry Reading', 'Iłowa', 79);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (33, '5/27/2023', '7:57 PM', 'Book Club', 'San Jorge', 134);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (34, '6/25/2023', '8:00 PM', 'Book Exchange', 'Tuanchengshan', 58);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (35, '11/14/2023', '7:05 AM', 'Book Club', 'Sintansin', 67);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (36, '12/15/2023', '9:58 AM', 'Poetry Reading', 'Paraíso', 104);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (37, '9/23/2023', '3:47 PM', 'Author Meetup', 'Hexi', 102);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (38, '1/15/2024', '12:14 PM', 'Book Exchange', 'Morioka-shi', 62);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (39, '10/7/2023', '7:44 AM', 'Book Exchange', 'Martigues', 113);
insert into Events (EventID, Date, Time, Title, Location, Max_Capacity) values (40, '8/9/2024', '7:21 AM', 'Book Club', 'Longzhong', 34);

insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (1, '5/20/2024', 'Drama|Romance', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (2, '11/30/2023', 'Thriller', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (3, '5/22/2024', 'Animation|Drama|Sci-Fi|IMAX', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (4, '2/26/2024', 'Drama', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (5, '12/3/2022', 'Horror|Mystery|Thriller', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (6, '5/24/2022', 'Action|Romance', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (7, '4/18/2022', 'Children|Comedy|Romance', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (8, '11/30/2024', 'Action|Crime|Drama|Horror', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (9, '5/8/2023', 'Adventure|Drama|Romance', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (10, '12/19/2023', 'Drama|Romance', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (11, '11/20/2024', 'Drama', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (12, '4/3/2024', 'Comedy', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (13, '1/18/2024', 'Comedy|Drama|Romance', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (14, '4/14/2022', 'Comedy|Musical', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (15, '1/22/2023', 'Drama|Thriller', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (16, '10/14/2022', 'Horror', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (17, '8/29/2024', 'Drama', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (18, '4/20/2025', 'Action|Sci-Fi|Thriller', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (19, '7/5/2023', 'Crime|Documentary', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (20, '1/26/2023', 'Crime|Drama', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (21, '5/16/2023', 'Adventure|Animation|Children', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (22, '3/18/2022', 'Horror|Mystery|Thriller', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (23, '7/20/2023', 'Action|Adventure|Thriller', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (24, '6/11/2023', 'Drama|Romance', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (25, '5/8/2024', 'Action|Animation|Drama|Sci-Fi', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (26, '4/16/2024', 'Comedy', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (27, '11/14/2022', 'Comedy|Drama|Romance', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (28, '6/29/2023', 'Comedy', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (29, '12/6/2022', 'Comedy|Drama', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (30, '12/29/2023', 'Action|Adventure|Animation|Children', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (31, '4/8/2024', 'Comedy|Crime|Thriller', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (32, '3/23/2025', 'Crime|Drama|Film-Noir', 'Old');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (33, '2/15/2024', 'Comedy|Drama', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (34, '4/13/2023', 'Comedy', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (35, '5/12/2022', 'Drama', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (36, '12/29/2023', 'Comedy', 'New');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (37, '4/3/2022', 'Drama|Romance', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (38, '9/26/2022', 'Drama', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (39, '1/4/2025', 'Comedy|Romance', 'Damaged');
insert into Report (ReportID, Date, Category_Trends, Book_Usage) values (40, '11/29/2022', 'Drama', 'Old');

insert into Librarian (LibrarianID, Role, FName, LName, MName) values (1, 'Community Outreach', 'Nickolas', 'Fist', 'Halie');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (2, 'Resource Management', 'Amii', 'Vercruysse', 'Harlene');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (3, 'Resource Management', 'Hubert', 'Fearenside', 'Madelene');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (4, 'Resource Management', 'Joshuah', 'Wimlett', 'Lorrin');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (5, 'Community Outreach', 'Jewelle', 'Give', 'Netta');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (6, 'Resource Management', 'Maryann', 'Bater', 'Evangelin');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (7, 'Tech Support', 'Kathe', 'Luebbert', 'Lianna');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (8, 'Patron Assistance', 'Mahmoud', 'Hanwright', 'Shayne');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (9, 'Patron Assistance', 'Nissy', 'Setchfield', 'Charlean');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (10, 'Patron Assistance', 'Bern', 'Caff', 'Chanda');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (11, 'Tech Support', 'Randene', 'Girault', 'Chanda');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (12, 'Community Outreach', 'Murry', 'Balch', 'Jude');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (13, 'Community Outreach', 'Lanita', 'Menhci', 'Larina');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (14, 'Community Outreach', 'Lacy', 'Chew', 'Romain');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (15, 'Patron Assistance', 'Pattie', 'Gall', 'Davin');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (16, 'Tech Support', 'Myra', 'Yerlett', 'Quentin');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (17, 'Community Outreach', 'Barbee', 'Pope', 'Rafaello');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (18, 'Tech Support', 'Giustina', 'Bogie', 'Astra');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (19, 'Tech Support', 'Nell', 'Caddan', 'Sukey');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (20, 'Community Outreach', 'Reilly', 'MacDavitt', 'Remus');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (21, 'Tech Support', 'Nanni', 'Figures', 'Clara');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (22, 'Tech Support', 'Gael', 'Vernon', 'Dierdre');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (23, 'Resource Management', 'Ricard', 'Tythacott', 'Lamar');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (24, 'Resource Management', 'Charley', 'Skehens', 'Weber');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (25, 'Patron Assistance', 'Ranee', 'Raysdale', 'Wye');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (26, 'Patron Assistance', 'Robbyn', 'Castagnier', 'Aaron');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (27, 'Community Outreach', 'Malorie', 'Almey', 'Arluene');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (28, 'Patron Assistance', 'Jaquelyn', 'Heintzsch', 'Karyn');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (29, 'Patron Assistance', 'Xever', 'Darville', 'Noble');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (30, 'Resource Management', 'Birch', 'Learmonth', 'Terry');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (31, 'Tech Support', 'Doroteya', 'Kalkofer', 'Philip');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (32, 'Resource Management', 'Blinnie', 'Moran', 'Ashleigh');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (33, 'Community Outreach', 'Lyon', 'Benedek', 'Alic');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (34, 'Resource Management', 'Kathrine', 'Tolle', 'Jandy');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (35, 'Patron Assistance', 'Palmer', 'Randal', 'Meara');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (36, 'Patron Assistance', 'Javier', 'Higgan', 'Novelia');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (37, 'Community Outreach', 'Maura', 'Ksandra', 'Stafford');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (38, 'Tech Support', 'Rance', 'Kenealy', 'Cynthy');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (39, 'Patron Assistance', 'Reginauld', 'Castelain', 'Brear');
insert into Librarian (LibrarianID, Role, FName, LName, MName) values (40, 'Tech Support', 'Derrik', 'McNutt', 'Shandra');

insert into Website (WebsiteURL, Name, Last_Updated) values (1, 'Customer Website', '4/3/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (2, 'Library Website', '4/9/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (3, 'Library Website', '7/25/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (4, 'Customer Website', '12/23/2022');
insert into Website (WebsiteURL, Name, Last_Updated) values (5, 'Library Admin Website', '7/14/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (6, 'Library Admin Website', '9/18/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (7, 'Library Admin Website', '8/2/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (8, 'Customer Website', '6/15/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (9, 'Library Admin Website', '4/5/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (10, 'Library Website', '11/27/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (11, 'Library Admin Website', '7/18/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (12, 'Library Admin Website', '12/29/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (13, 'Library Website', '7/29/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (14, 'Library Admin Website', '5/17/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (15, 'Customer Website', '9/12/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (16, 'Library Website', '9/29/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (17, 'Library Website', '12/10/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (18, 'Customer Website', '1/19/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (19, 'Customer Website', '3/20/2025');
insert into Website (WebsiteURL, Name, Last_Updated) values (20, 'Library Admin Website', '11/16/2022');
insert into Website (WebsiteURL, Name, Last_Updated) values (21, 'Customer Website', '1/14/2025');
insert into Website (WebsiteURL, Name, Last_Updated) values (22, 'Library Admin Website', '11/28/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (23, 'Library Admin Website', '7/26/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (24, 'Library Website', '3/2/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (25, 'Customer Website', '11/11/2022');
insert into Website (WebsiteURL, Name, Last_Updated) values (26, 'Library Website', '2/16/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (27, 'Customer Website', '9/16/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (28, 'Library Admin Website', '10/25/2022');
insert into Website (WebsiteURL, Name, Last_Updated) values (29, 'Customer Website', '9/22/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (30, 'Library Website', '3/12/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (31, 'Customer Website', '2/15/2025');
insert into Website (WebsiteURL, Name, Last_Updated) values (32, 'Library Admin Website', '7/4/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (33, 'Library Admin Website', '2/3/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (34, 'Library Admin Website', '6/17/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (35, 'Customer Website', '4/10/2025');
insert into Website (WebsiteURL, Name, Last_Updated) values (36, 'Customer Website', '12/10/2022');
insert into Website (WebsiteURL, Name, Last_Updated) values (37, 'Library Admin Website', '7/18/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (38, 'Library Website', '12/11/2024');
insert into Website (WebsiteURL, Name, Last_Updated) values (39, 'Library Admin Website', '3/25/2023');
insert into Website (WebsiteURL, Name, Last_Updated) values (40, 'Library Website', '1/3/2025');

insert into MembershipPlan (PlanID, Fee, Duration) values (1, '$188.29', 7);
insert into MembershipPlan (PlanID, Fee, Duration) values (2, '$49.01', 47);
insert into MembershipPlan (PlanID, Fee, Duration) values (3, '$405.27', 6);
insert into MembershipPlan (PlanID, Fee, Duration) values (4, '$396.72', 20);
insert into MembershipPlan (PlanID, Fee, Duration) values (5, '$248.55', 14);
insert into MembershipPlan (PlanID, Fee, Duration) values (6, '$452.64', 2);
insert into MembershipPlan (PlanID, Fee, Duration) values (7, '$323.62', 11);
insert into MembershipPlan (PlanID, Fee, Duration) values (8, '$283.91', 6);
insert into MembershipPlan (PlanID, Fee, Duration) values (9, '$141.68', 15);
insert into MembershipPlan (PlanID, Fee, Duration) values (10, '$57.96', 14);
insert into MembershipPlan (PlanID, Fee, Duration) values (11, '$334.28', 45);
insert into MembershipPlan (PlanID, Fee, Duration) values (12, '$26.92', 47);
insert into MembershipPlan (PlanID, Fee, Duration) values (13, '$293.45', 0);
insert into MembershipPlan (PlanID, Fee, Duration) values (14, '$276.48', 34);
insert into MembershipPlan (PlanID, Fee, Duration) values (15, '$393.15', 16);
insert into MembershipPlan (PlanID, Fee, Duration) values (16, '$264.56', 32);
insert into MembershipPlan (PlanID, Fee, Duration) values (17, '$474.22', 3);
insert into MembershipPlan (PlanID, Fee, Duration) values (18, '$68.62', 36);
insert into MembershipPlan (PlanID, Fee, Duration) values (19, '$311.39', 11);
insert into MembershipPlan (PlanID, Fee, Duration) values (20, '$163.20', 3);
insert into MembershipPlan (PlanID, Fee, Duration) values (21, '$438.55', 42);
insert into MembershipPlan (PlanID, Fee, Duration) values (22, '$152.87', 1);
insert into MembershipPlan (PlanID, Fee, Duration) values (23, '$291.12', 22);
insert into MembershipPlan (PlanID, Fee, Duration) values (24, '$46.78', 26);
insert into MembershipPlan (PlanID, Fee, Duration) values (25, '$164.10', 23);
insert into MembershipPlan (PlanID, Fee, Duration) values (26, '$492.92', 29);
insert into MembershipPlan (PlanID, Fee, Duration) values (27, '$311.47', 47);
insert into MembershipPlan (PlanID, Fee, Duration) values (28, '$224.88', 46);
insert into MembershipPlan (PlanID, Fee, Duration) values (29, '$401.92', 8);
insert into MembershipPlan (PlanID, Fee, Duration) values (30, '$460.52', 38);
insert into MembershipPlan (PlanID, Fee, Duration) values (31, '$31.40', 9);
insert into MembershipPlan (PlanID, Fee, Duration) values (32, '$483.47', 10);
insert into MembershipPlan (PlanID, Fee, Duration) values (33, '$295.32', 32);
insert into MembershipPlan (PlanID, Fee, Duration) values (34, '$425.01', 7);
insert into MembershipPlan (PlanID, Fee, Duration) values (35, '$184.00', 10);
insert into MembershipPlan (PlanID, Fee, Duration) values (36, '$232.92', 4);
insert into MembershipPlan (PlanID, Fee, Duration) values (37, '$446.20', 37);
insert into MembershipPlan (PlanID, Fee, Duration) values (38, '$146.79', 14);
insert into MembershipPlan (PlanID, Fee, Duration) values (39, '$153.83', 25);
insert into MembershipPlan (PlanID, Fee, Duration) values (40, '$353.85', 21);

insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (1, 'Author', 'Narrative', '5/18/2023', 7);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (2, 'Author', 'Fiction', '5/15/2024', 17);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (3, 'Author', 'Nonfiction', '7/9/2024', 38);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (4, 'Availability', 'Narrative', '7/26/2023', 29);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (5, 'Author', 'Romance', '9/20/2024', 1);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (6, 'Author', 'Science Fiction', '3/31/2023', 38);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (7, 'Pages', 'Bibliography', '9/29/2024', 34);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (8, 'Availability', 'Of Mice and Men', '1/10/2024', 12);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (9, 'Author', 'Of Mice and Men', '11/4/2023', 12);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (10, 'Author', 'Drama', '7/9/2023', 8);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (11, 'Availability', 'Thriller', '1/26/2025', 8);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (12, 'Author', 'Fiction', '4/6/2025', 21);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (13, 'Genre', 'Drama', '7/20/2023', 8);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (14, 'Availability', 'Drama', '10/14/2023', 7);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (15, 'Title', 'Drama', '9/13/2023', 5);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (16, 'Title', 'Animal Farm', '9/8/2024', 30);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (17, 'Title', 'Of Mice and Men', '12/9/2023', 35);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (18, 'Title', 'Science Fiction', '10/31/2023', 9);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (19, 'Pages', 'Romance', '8/17/2024', 14);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (20, 'Title', 'Of Mice and Men', '1/17/2025', 23);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (21, 'Genre', 'Of Mice and Men', '6/12/2023', 18);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (22, 'Author', 'Animal Farm', '5/6/2024', 34);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (23, 'Pages', 'Science Fiction', '6/4/2024', 27);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (24, 'Pages', 'Romance', '3/9/2024', 13);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (25, 'Author', 'Animal Farm', '10/3/2024', 30);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (26, 'Availability', 'Narrative', '2/7/2024', 4);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (27, 'Availability', 'Nonfiction', '2/16/2024', 16);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (28, 'Title', 'Narrative', '5/5/2024', 26);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (29, 'Genre', 'Mystery', '6/7/2023', 9);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (30, 'Pages', 'Drama', '4/28/2024', 2);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (31, 'Author', 'To Kill a Mockingbird', '11/2/2024', 7);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (32, 'Author', 'Thriller', '9/10/2023', 3);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (33, 'Genre', 'Thriller', '9/22/2024', 37);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (34, 'Genre', 'Nonfiction', '5/1/2024', 27);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (35, 'Author', 'To Kill a Mockingbird', '1/18/2025', 36);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (36, 'Title', 'Science Fiction', '12/16/2024', 39);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (37, 'Author', 'To Kill a Mockingbird', '12/19/2023', 27);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (38, 'Availability', 'Bibliography', '6/26/2023', 25);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (39, 'Author', 'Mystery', '3/3/2023', 27);
insert into Search_Filter (FilterID, Filter_Type, Filter_Value, Time_Stamp, LibrarianID) values (40, 'Author', 'To Kill a Mockingbird', '1/16/2025', 27);

insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (1, 'User Management Admin', '7/8/2024', 'Maryellen', 'Valsler', 'Vally', 1);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (2, 'User Management Admin', '2/4/2025', 'Karoly', 'Dinse', 'Merrill', 5);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (3, 'User Management Admin', '1/19/2025', 'Vassili', 'Batting', 'Regan', 7);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (4, 'IT Admin', '3/1/2025', 'Ashlie', 'Shakesby', 'Wally', 17);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (5, 'IT Admin', '4/2/2025', 'Antoine', 'Alfonsetti', 'Rozele', 1);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (6, 'Website Admin', '3/1/2025', 'Gwenora', 'Mackerness', 'Karin', 9);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (7, 'Website Admin', '4/24/2024', 'Barny', 'Hearfield', 'Andrus', 18);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (8, 'User Management Admin', '5/11/2024', 'Chicky', 'Fenna', 'Jaine', 35);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (9, 'Website Admin', '8/2/2024', 'Luci', 'Whaplington', 'Viv', 36);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (10, 'IT Admin', '6/30/2024', 'Tabbi', 'Rewcassell', 'Boniface', 29);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (11, 'User Management Admin', '2/16/2025', 'Giacomo', 'Rainon', 'Cecelia', 24);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (12, 'User Management Admin', '6/17/2024', 'Ethelbert', 'Deaton', 'Arther', 9);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (13, 'IT Admin', '7/23/2024', 'Sabine', 'Fairhead', 'Marissa', 36);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (14, 'IT Admin', '2/20/2025', 'Jerrold', 'Wintour', 'Sonya', 34);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (15, 'Website Admin', '11/20/2024', 'Joleen', 'Henri', 'Cheryl', 40);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (16, 'User Management Admin', '7/20/2024', 'Mick', 'Suart', 'Regen', 11);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (17, 'Website Admin', '12/17/2024', 'Pietro', 'Filmer', 'Cammy', 1);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (18, 'IT Admin', '8/20/2024', 'Stephi', 'Helbeck', 'Maggie', 29);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (19, 'Website Admin', '4/26/2024', 'Valaree', 'Hanbridge', 'Vicky', 15);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (20, 'User Management Admin', '10/23/2024', 'Arabelle', 'Spoerl', 'Fabe', 3);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (21, 'IT Admin', '5/1/2024', 'Danita', 'O''Shaughnessy', 'Sibylla', 8);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (22, 'Website Admin', '9/11/2024', 'Kyla', 'Morales', 'Anthe', 36);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (23, 'IT Admin', '4/17/2025', 'Ives', 'Potapczuk', 'Gordan', 33);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (24, 'User Management Admin', '11/28/2024', 'Addi', 'Kyngdon', 'Helge', 2);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (25, 'IT Admin', '8/28/2024', 'Dalenna', 'Flintoft', 'Marilyn', 32);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (26, 'IT Admin', '1/13/2025', 'Kirbee', 'Ketton', 'Eleni', 3);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (27, 'Website Admin', '9/26/2024', 'Newton', 'Leavold', 'Selene', 20);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (28, 'User Management Admin', '2/16/2025', 'Thomas', 'Belliveau', 'Tony', 5);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (29, 'User Management Admin', '11/12/2024', 'Estella', 'Bownas', 'Denna', 3);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (30, 'IT Admin', '11/18/2024', 'Brenna', 'Wyles', 'Wyatt', 13);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (31, 'Website Admin', '5/14/2024', 'Oralee', 'Kubacek', 'Ebonee', 6);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (32, 'Website Admin', '12/6/2024', 'Aristotle', 'Isakson', 'Lamond', 34);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (33, 'User Management Admin', '10/15/2024', 'Storm', 'Sall', 'Pearla', 15);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (34, 'User Management Admin', '7/24/2024', 'Annette', 'Catley', 'Frasco', 14);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (35, 'Website Admin', '6/7/2024', 'Carroll', 'Davidow', 'Valentine', 14);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (36, 'Website Admin', '3/26/2025', 'Farley', 'Woollaston', 'Danita', 33);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (37, 'Website Admin', '12/14/2024', 'Ibrahim', 'De Anesy', 'Hill', 15);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (38, 'IT Admin', '6/29/2024', 'Juliana', 'Wey', 'Vasili', 10);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (39, 'User Management Admin', '6/7/2024', 'Cissiee', 'Jocelyn', 'Tonye', 29);
insert into Admin (AdminID, Role, Last_Login, FName, LName, MName, ReportID) values (40, 'IT Admin', '10/15/2024', 'Florian', 'Burfoot', 'Junia', 34);

insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (1, 'Returning Books', '9/10/2024', 11);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (2, 'Returning Books', '3/24/2025', 24);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (3, 'Returning Books', '8/3/2024', 38);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (4, 'Donating Books', '4/1/2024', 12);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (5, 'Donating Books', '9/9/2024', 12);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (6, 'Donating Books', '10/11/2023', 29);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (7, 'Donating Books', '11/21/2024', 38);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (8, 'Returning Books', '1/5/2025', 38);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (9, 'Donating Books', '1/15/2023', 40);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (10, 'Returning Books', '11/27/2022', 22);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (11, 'Checking Out Books', '10/7/2024', 36);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (12, 'Returning Books', '10/16/2022', 34);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (13, 'Checking Out Books', '12/18/2022', 25);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (14, 'Returning Books', '9/22/2023', 36);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (15, 'Donating Books', '9/16/2024', 22);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (16, 'Checking Out Books', '12/6/2024', 33);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (17, 'Returning Books', '12/5/2023', 16);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (18, 'Donating Books', '9/2/2024', 27);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (19, 'Checking Out Books', '8/15/2023', 2);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (20, 'Donating Books', '1/27/2025', 10);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (21, 'Checking Out Books', '1/4/2025', 21);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (22, 'Donating Books', '10/19/2023', 25);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (23, 'Donating Books', '12/19/2023', 3);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (24, 'Returning Books', '11/1/2024', 26);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (25, 'Returning Books', '12/19/2022', 25);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (26, 'Donating Books', '2/8/2024', 20);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (27, 'Donating Books', '5/19/2023', 32);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (28, 'Returning Books', '9/19/2024', 35);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (29, 'Returning Books', '1/11/2025', 7);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (30, 'Checking Out Books', '2/16/2023', 24);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (31, 'Returning Books', '8/5/2024', 2);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (32, 'Checking Out Books', '8/16/2023', 40);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (33, 'Donating Books', '1/15/2023', 33);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (34, 'Checking Out Books', '10/4/2024', 17);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (35, 'Checking Out Books', '2/11/2025', 32);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (36, 'Returning Books', '5/16/2024', 24);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (37, 'Returning Books', '1/21/2024', 16);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (38, 'Donating Books', '2/27/2023', 30);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (39, 'Checking Out Books', '7/3/2024', 24);
insert into User_Log (LogID, Action, Time_Stamp, AdminID) values (40, 'Checking Out Books', '5/27/2023', 30);


insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (1, 6, '2/11/2025', 'Cash', 12);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (2, 61, '5/10/2024', 'Debit Card', 33);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (3, 22, '3/11/2025', 'Credit Card', 10);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (4, 91, '3/7/2025', 'Cash', 7);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (5, 66, '2/26/2025', 'Cash', 16);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (6, 26, '3/4/2025', 'Debit Card', 10);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (7, 82, '2/23/2025', 'Debit Card', 14);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (8, 63, '3/30/2025', 'Credit Card', 32);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (9, 42, '5/20/2024', 'Cash', 37);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (10, 51, '1/22/2025', 'Credit Card', 3);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (11, 24, '12/12/2024', 'Cash', 24);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (12, 19, '6/17/2024', 'Debit Card', 37);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (13, 8, '4/23/2024', 'Cash', 14);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (14, 40, '3/2/2025', 'Debit Card', 39);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (15, 91, '3/21/2025', 'Cash', 2);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (16, 75, '11/26/2024', 'Debit Card', 14);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (17, 49, '10/15/2024', 'Credit Card', 31);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (18, 21, '10/1/2024', 'Cash', 3);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (19, 53, '10/14/2024', 'Credit Card', 17);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (20, 83, '8/22/2024', 'Cash', 18);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (21, 33, '3/8/2025', 'Debit Card', 18);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (22, 54, '11/29/2024', 'Cash', 2);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (23, 75, '12/2/2024', 'Cash', 15);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (24, 63, '2/14/2025', 'Cash', 35);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (25, 74, '10/11/2024', 'Credit Card', 16);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (26, 90, '5/19/2024', 'Debit Card', 12);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (27, 49, '1/1/2025', 'Cash', 11);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (28, 90, '4/30/2024', 'Debit Card', 32);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (29, 5, '6/4/2024', 'Debit Card', 31);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (30, 52, '4/30/2024', 'Cash', 35);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (31, 62, '9/27/2024', 'Debit Card', 32);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (32, 12, '8/23/2024', 'Cash', 6);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (33, 36, '5/13/2024', 'Debit Card', 2);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (34, 34, '5/21/2024', 'Cash', 29);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (35, 9, '1/12/2025', 'Cash', 23);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (36, 81, '7/2/2024', 'Cash', 29);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (37, 50, '6/9/2024', 'Debit Card', 15);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (38, 19, '9/6/2024', 'Credit Card', 3);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (39, 83, '4/27/2024', 'Cash', 1);
insert into Payment (PaymentID, Amount, Date, Method, CustomerID) values (40, 85, '6/26/2024', 'Debit Card', 35);

insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (1, 'Upcoming events', '3/20/2025', 24);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (2, 'Upcoming events', '3/18/2025', 28);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (3, 'Upcoming events', '12/21/2024', 17);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (4, 'New Books', '12/23/2024', 15);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (5, 'Upcoming events', '6/5/2024', 22);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (6, 'Upcoming events', '4/17/2025', 21);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (7, 'New Books', '6/28/2024', 4);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (8, 'Expiring Membership', '1/16/2025', 11);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (9, 'New Books', '6/26/2024', 31);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (10, 'New Books', '5/18/2024', 5);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (11, 'Expiring Membership', '1/21/2025', 34);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (12, 'Upcoming events', '5/28/2024', 34);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (13, 'Upcoming events', '3/6/2025', 23);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (14, 'Expiring Membership', '11/14/2024', 35);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (15, 'Upcoming events', '6/23/2024', 35);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (16, 'New Books', '7/11/2024', 1);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (17, 'Upcoming events', '1/19/2025', 35);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (18, 'Expiring Membership', '4/17/2025', 20);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (19, 'Expiring Membership', '5/9/2024', 24);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (20, 'New Books', '7/19/2024', 33);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (21, 'Upcoming events', '6/18/2024', 32);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (22, 'Upcoming events', '4/14/2025', 26);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (23, 'New Books', '1/4/2025', 19);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (24, 'Expiring Membership', '3/2/2025', 19);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (25, 'Upcoming events', '6/21/2024', 21);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (26, 'Expiring Membership', '9/17/2024', 9);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (27, 'Upcoming events', '2/28/2025', 8);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (28, 'Expiring Membership', '5/10/2024', 36);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (29, 'New Books', '1/22/2025', 27);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (30, 'New Books', '10/29/2024', 26);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (31, 'Upcoming events', '8/22/2024', 6);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (32, 'Upcoming events', '4/25/2024', 17);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (33, 'Upcoming events', '8/19/2024', 16);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (34, 'New Books', '11/9/2024', 20);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (35, 'Upcoming events', '10/31/2024', 13);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (36, 'New Books', '9/15/2024', 7);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (37, 'Upcoming events', '6/19/2024', 5);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (38, 'New Books', '12/10/2024', 29);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (39, 'Upcoming events', '10/18/2024', 26);
insert into Notification (NotificationID, Message , Date_Sent , Admin_ID) values (40, 'Upcoming events', '8/14/2024', 39);

insert into Author (AuthorID, DateOfBirth, FName, LName) values (1, '11/3/1994', 'Raymund', 'Espada');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (2, '11/10/2004', 'Wyndham', 'Hobbert');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (3, '11/17/1995', 'Clerc', 'Saller');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (4, '6/9/1966', 'Alva', 'Woodward');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (5, '3/3/2024', 'Avram', 'Barhims');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (6, '11/30/1988', 'Dallis', 'Carpmile');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (7, '6/25/1997', 'Elbertine', 'Branche');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (8, '4/26/2014', 'Koren', 'Canavan');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (9, '5/11/1982', 'Artemas', 'Burles');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (10, '5/14/2005', 'Tynan', 'Jerrolt');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (11, '8/10/1980', 'Valentine', 'Fydo');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (12, '5/28/1976', 'Nara', 'Kendle');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (13, '5/17/1962', 'Luelle', 'Byrch');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (14, '12/1/1961', 'Marlin', 'Halbord');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (15, '3/2/1977', 'Kelley', 'Trendle');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (16, '3/17/1968', 'Allie', 'Tovey');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (17, '11/21/2022', 'Kele', 'McPhate');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (18, '4/1/2010', 'Engracia', 'Aucott');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (19, '5/4/2000', 'Ahmad', 'Jenik');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (20, '6/10/2012', 'Blanch', 'Geram');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (21, '12/28/1972', 'Colan', 'Sabatier');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (22, '7/3/1980', 'Collie', 'Knapper');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (23, '11/25/1967', 'Malory', 'Ogglebie');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (24, '11/7/1965', 'Claiborne', 'Whittlesee');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (25, '12/25/1968', 'Vivien', 'Coghlan');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (26, '11/14/1960', 'Sibbie', 'Hasker');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (27, '6/24/2017', 'Alis', 'Breckenridge');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (28, '5/15/1973', 'Marcie', 'Cockhill');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (29, '2/20/2018', 'Caron', 'Lindback');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (30, '7/7/1968', 'Cherilynn', 'Connolly');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (31, '3/2/1971', 'Aldous', 'Summerlee');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (32, '11/3/1989', 'Fanchon', 'Abrahamoff');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (33, '3/26/2015', 'Durante', 'Huggins');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (34, '12/25/2010', 'Sonnnie', 'Megroff');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (35, '6/16/1971', 'Ronnica', 'Jonin');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (36, '11/24/1976', 'Dyann', 'Yukhtin');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (37, '3/30/1968', 'Merridie', 'Symones');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (38, '12/1/2018', 'Rosanne', 'Liverseege');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (39, '9/23/2006', 'Pen', 'Gribbell');
insert into Author (AuthorID, DateOfBirth, FName, LName) values (40, '10/3/1962', 'Wolf', 'Mainston');


insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (1, 'Non-Fiction', 'October', 456, 35, 3);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (2, 'Horror', 'It''s Not Me, I Swear! (C''est pas moi, je le jure!)', 489, 35, 25);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (3, 'Mystery', 'Shadows of Our Forgotten Ancestors (Tini zabutykh predkiv)', 326, 21, 40);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (4, 'Horror', 'Snarveien (Detour)', 274, 1, 15);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (5, 'Adventure', 'Buried Alive', 62, 2, 8);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (6, 'Horror', 'The Hound of the Baskervilles', 425, 25, 40);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (7, 'Non-Fiction', 'My Sassy Girl (Yeopgijeogin geunyeo)', 416, 3, 25);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (8, 'Horror', 'Autumn Leaves', 82, 15, 7);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (9, 'Adventure', 'Hunt, The (Caza, La)', 60, 34, 35);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (10, 'Non-Fiction', 'Silver City', 456, 30, 21);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (11, 'Fiction', 'Victim', 426, 4, 23);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (12, 'Fiction', 'Flash Gordon', 91, 5, 28);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (13, 'Adventure', 'Lovelace', 190, 22, 6);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (14, 'Mystery', 'The Harmony Game', 344, 30, 12);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (15, 'Adventure', 'Disney Sing Along Songs: Under the Sea', 220, 12, 12);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (16, 'Mystery', 'Rat King', 245, 32, 8);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (17, 'Fantasy', 'Project X', 125, 19, 38);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (18, 'Fiction', 'Hoosiers (a.k.a. Best Shot)', 425, 28, 28);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (19, 'Adventure', 'Under Siege 2: Dark Territory', 57, 31, 18);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (20, 'Fiction', 'Rocker', 87, 22, 20);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (21, 'Non-Fiction', 'Monkey''s Mask, The', 338, 19, 34);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (22, 'Non-Fiction', 'C(r)ook (Basta - Rotwein Oder Totsein)', 299, 10, 11);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (23, 'Mystery', 'Last Blitzkrieg, The', 308, 16, 12);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (24, 'Non-Fiction', 'Wood & Stock: Sexo, Orégano e Rock''n''Roll', 287, 36, 18);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (25, 'Fiction', 'Dead Man', 472, 35, 30);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (26, 'Fiction', 'Dark and Stormy Night', 124, 24, 18);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (27, 'Horror', 'Lincz', 309, 35, 35);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (28, 'Adventure', 'Nevada Smith', 347, 5, 5);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (29, 'Horror', 'Forklift Driver Klaus: The First Day on the Job', 246, 9, 20);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (30, 'Adventure', 'In the Line of Duty: The F.B.I. Murders', 101, 25, 7);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (31, 'Horror', 'Pitch Perfect', 300, 18, 10);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (32, 'Adventure', 'Days and Nights', 179, 27, 10);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (33, 'Non-Fiction', 'Zombie Girl: The Movie', 66, 10, 18);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (34, 'Non-Fiction', 'I Love You, Beth Cooper', 181, 13, 24);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (35, 'Mystery', 'Ninette', 396, 5, 17);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (36, 'Non-Fiction', 'St. Valentine''s Day Massacre, The', 265, 38, 39);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (37, 'Fantasy', 'Red Shoes, The (Bunhongsin)', 143, 10, 12);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (38, 'Fantasy', 'Eclisse, L'' (Eclipse)', 482, 6, 14);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (39, 'Non-Fiction', 'Lost for Life', 314, 16, 32);
insert into Books (BookID, Genre, Title, Pages, CustomerID, AuthorID) values (40, 'Adventure', 'Suriyothai (a.k.a. Legend of Suriyothai, The)', 194, 31, 20);

insert into Book_Status (BookID, Status) values (39, 'New');
insert into Book_Status (BookID, Status) values (7, 'Damaged');
insert into Book_Status (BookID, Status) values (2, 'Damaged');
insert into Book_Status (BookID, Status) values (11, 'Old');
insert into Book_Status (BookID, Status) values (34, 'Damaged');
insert into Book_Status (BookID, Status) values (27, 'Damaged');
insert into Book_Status (BookID, Status) values (31, 'Old');
insert into Book_Status (BookID, Status) values (20, 'Old');
insert into Book_Status (BookID, Status) values (2, 'Old');
insert into Book_Status (BookID, Status) values (20, 'New');
insert into Book_Status (BookID, Status) values (12, 'New');
insert into Book_Status (BookID, Status) values (24, 'Old');
insert into Book_Status (BookID, Status) values (24, 'Old');
insert into Book_Status (BookID, Status) values (18, 'Damaged');
insert into Book_Status (BookID, Status) values (28, 'New');
insert into Book_Status (BookID, Status) values (31, 'Old');
insert into Book_Status (BookID, Status) values (28, 'Old');
insert into Book_Status (BookID, Status) values (40, 'Old');
insert into Book_Status (BookID, Status) values (40, 'New');
insert into Book_Status (BookID, Status) values (33, 'New');
insert into Book_Status (BookID, Status) values (35, 'Damaged');
insert into Book_Status (BookID, Status) values (22, 'Old');
insert into Book_Status (BookID, Status) values (9, 'Old');
insert into Book_Status (BookID, Status) values (25, 'New');
insert into Book_Status (BookID, Status) values (34, 'Damaged');
insert into Book_Status (BookID, Status) values (6, 'Damaged');
insert into Book_Status (BookID, Status) values (15, 'Old');
insert into Book_Status (BookID, Status) values (36, 'Damaged');
insert into Book_Status (BookID, Status) values (8, 'Damaged');
insert into Book_Status (BookID, Status) values (29, 'New');
insert into Book_Status (BookID, Status) values (20, 'Old');
insert into Book_Status (BookID, Status) values (26, 'Old');
insert into Book_Status (BookID, Status) values (10, 'New');
insert into Book_Status (BookID, Status) values (33, 'Damaged');
insert into Book_Status (BookID, Status) values (16, 'New');
insert into Book_Status (BookID, Status) values (6, 'Damaged');
insert into Book_Status (BookID, Status) values (18, 'Old');
insert into Book_Status (BookID, Status) values (35, 'Damaged');
insert into Book_Status (BookID, Status) values (40, 'Old');
insert into Book_Status (BookID, Status) values (13, 'Old');
insert into Book_Status (BookID, Status) values (33, 'New');
insert into Book_Status (BookID, Status) values (28, 'Old');
insert into Book_Status (BookID, Status) values (2, 'Damaged');
insert into Book_Status (BookID, Status) values (2, 'New');
insert into Book_Status (BookID, Status) values (28, 'New');
insert into Book_Status (BookID, Status) values (30, 'Old');
insert into Book_Status (BookID, Status) values (4, 'Old');
insert into Book_Status (BookID, Status) values (26, 'New');
insert into Book_Status (BookID, Status) values (23, 'New');
insert into Book_Status (BookID, Status) values (35, 'New');
insert into Book_Status (BookID, Status) values (31, 'New');
insert into Book_Status (BookID, Status) values (32, 'Old');
insert into Book_Status (BookID, Status) values (10, 'Old');
insert into Book_Status (BookID, Status) values (30, 'Old');
insert into Book_Status (BookID, Status) values (3, 'New');
insert into Book_Status (BookID, Status) values (30, 'Old');
insert into Book_Status (BookID, Status) values (11, 'New');
insert into Book_Status (BookID, Status) values (23, 'Damaged');
insert into Book_Status (BookID, Status) values (34, 'Damaged');
insert into Book_Status (BookID, Status) values (33, 'Old');
insert into Book_Status (BookID, Status) values (31, 'Damaged');
insert into Book_Status (BookID, Status) values (34, 'Old');
insert into Book_Status (BookID, Status) values (2, 'Damaged');
insert into Book_Status (BookID, Status) values (34, 'Old');
insert into Book_Status (BookID, Status) values (14, 'Old');
insert into Book_Status (BookID, Status) values (39, 'Damaged');
insert into Book_Status (BookID, Status) values (3, 'New');
insert into Book_Status (BookID, Status) values (32, 'Old');
insert into Book_Status (BookID, Status) values (14, 'Old');
insert into Book_Status (BookID, Status) values (28, 'Old');
insert into Book_Status (BookID, Status) values (21, 'New');
insert into Book_Status (BookID, Status) values (27, 'Damaged');
insert into Book_Status (BookID, Status) values (25, 'New');
insert into Book_Status (BookID, Status) values (28, 'Old');
insert into Book_Status (BookID, Status) values (35, 'Old');


insert into Registers_For (EventID, CustomerID) values (18, 34);
insert into Registers_For (EventID, CustomerID) values (14, 30);
insert into Registers_For (EventID, CustomerID) values (17, 20);
insert into Registers_For (EventID, CustomerID) values (16, 26);
insert into Registers_For (EventID, CustomerID) values (25, 25);
insert into Registers_For (EventID, CustomerID) values (18, 6);
insert into Registers_For (EventID, CustomerID) values (25, 12);
insert into Registers_For (EventID, CustomerID) values (3, 14);
insert into Registers_For (EventID, CustomerID) values (18, 36);
insert into Registers_For (EventID, CustomerID) values (25, 37);
insert into Registers_For (EventID, CustomerID) values (40, 37);
insert into Registers_For (EventID, CustomerID) values (6, 35);
insert into Registers_For (EventID, CustomerID) values (15, 31);
insert into Registers_For (EventID, CustomerID) values (15, 33);
insert into Registers_For (EventID, CustomerID) values (21, 36);
insert into Registers_For (EventID, CustomerID) values (33, 2);
insert into Registers_For (EventID, CustomerID) values (19, 19);
insert into Registers_For (EventID, CustomerID) values (38, 37);
insert into Registers_For (EventID, CustomerID) values (4, 4);
insert into Registers_For (EventID, CustomerID) values (21, 9);
insert into Registers_For (EventID, CustomerID) values (7, 15);
insert into Registers_For (EventID, CustomerID) values (32, 25);
insert into Registers_For (EventID, CustomerID) values (30, 25);
insert into Registers_For (EventID, CustomerID) values (30, 22);
insert into Registers_For (EventID, CustomerID) values (24, 14);
insert into Registers_For (EventID, CustomerID) values (11, 9);
insert into Registers_For (EventID, CustomerID) values (3, 25);
insert into Registers_For (EventID, CustomerID) values (21, 10);
insert into Registers_For (EventID, CustomerID) values (2, 15);
insert into Registers_For (EventID, CustomerID) values (23, 9);
insert into Registers_For (EventID, CustomerID) values (1, 24);
insert into Registers_For (EventID, CustomerID) values (4, 16);
insert into Registers_For (EventID, CustomerID) values (2, 1);
insert into Registers_For (EventID, CustomerID) values (31, 40);
insert into Registers_For (EventID, CustomerID) values (19, 4);
insert into Registers_For (EventID, CustomerID) values (32, 38);
insert into Registers_For (EventID, CustomerID) values (33, 29);
insert into Registers_For (EventID, CustomerID) values (24, 10);
insert into Registers_For (EventID, CustomerID) values (20, 4);
insert into Registers_For (EventID, CustomerID) values (37, 1);
insert into Registers_For (EventID, CustomerID) values (19, 18);
insert into Registers_For (EventID, CustomerID) values (34, 24);
insert into Registers_For (EventID, CustomerID) values (30, 3);
insert into Registers_For (EventID, CustomerID) values (1, 29);
insert into Registers_For (EventID, CustomerID) values (15, 21);
insert into Registers_For (EventID, CustomerID) values (8, 5);
insert into Registers_For (EventID, CustomerID) values (5, 34);
insert into Registers_For (EventID, CustomerID) values (11, 18);
insert into Registers_For (EventID, CustomerID) values (23, 30);
insert into Registers_For (EventID, CustomerID) values (28, 34);
insert into Registers_For (EventID, CustomerID) values (2, 28);
insert into Registers_For (EventID, CustomerID) values (10, 38);
insert into Registers_For (EventID, CustomerID) values (27, 9);
insert into Registers_For (EventID, CustomerID) values (35, 30);
insert into Registers_For (EventID, CustomerID) values (29, 17);
insert into Registers_For (EventID, CustomerID) values (22, 31);
insert into Registers_For (EventID, CustomerID) values (38, 13);
insert into Registers_For (EventID, CustomerID) values (25, 2);
insert into Registers_For (EventID, CustomerID) values (16, 19);
insert into Registers_For (EventID, CustomerID) values (27, 30);
insert into Registers_For (EventID, CustomerID) values (6, 6);
insert into Registers_For (EventID, CustomerID) values (22, 33);
insert into Registers_For (EventID, CustomerID) values (28, 27);
insert into Registers_For (EventID, CustomerID) values (40, 15);
insert into Registers_For (EventID, CustomerID) values (20, 13);
insert into Registers_For (EventID, CustomerID) values (12, 4);
insert into Registers_For (EventID, CustomerID) values (40, 15);
insert into Registers_For (EventID, CustomerID) values (34, 18);
insert into Registers_For (EventID, CustomerID) values (7, 3);
insert into Registers_For (EventID, CustomerID) values (13, 12);
insert into Registers_For (EventID, CustomerID) values (40, 17);
insert into Registers_For (EventID, CustomerID) values (39, 18);
insert into Registers_For (EventID, CustomerID) values (34, 37);
insert into Registers_For (EventID, CustomerID) values (9, 24);
insert into Registers_For (EventID, CustomerID) values (34, 4);
insert into Registers_For (EventID, CustomerID) values (32, 22);
insert into Registers_For (EventID, CustomerID) values (29, 14);
insert into Registers_For (EventID, CustomerID) values (14, 6);
insert into Registers_For (EventID, CustomerID) values (20, 36);
insert into Registers_For (EventID, CustomerID) values (23, 8);
insert into Registers_For (EventID, CustomerID) values (26, 37);
insert into Registers_For (EventID, CustomerID) values (31, 39);
insert into Registers_For (EventID, CustomerID) values (36, 3);
insert into Registers_For (EventID, CustomerID) values (20, 11);
insert into Registers_For (EventID, CustomerID) values (7, 34);
insert into Registers_For (EventID, CustomerID) values (1, 37);
insert into Registers_For (EventID, CustomerID) values (38, 11);
insert into Registers_For (EventID, CustomerID) values (32, 16);
insert into Registers_For (EventID, CustomerID) values (26, 18);
insert into Registers_For (EventID, CustomerID) values (36, 37);
insert into Registers_For (EventID, CustomerID) values (24, 25);
insert into Registers_For (EventID, CustomerID) values (5, 4);
insert into Registers_For (EventID, CustomerID) values (8, 30);
insert into Registers_For (EventID, CustomerID) values (40, 16);
insert into Registers_For (EventID, CustomerID) values (39, 36);
insert into Registers_For (EventID, CustomerID) values (15, 30);
insert into Registers_For (EventID, CustomerID) values (29, 9);
insert into Registers_For (EventID, CustomerID) values (27, 31);
insert into Registers_For (EventID, CustomerID) values (2, 9);
insert into Registers_For (EventID, CustomerID) values (39, 37);
insert into Registers_For (EventID, CustomerID) values (38, 12);
insert into Registers_For (EventID, CustomerID) values (25, 39);
insert into Registers_For (EventID, CustomerID) values (40, 39);
insert into Registers_For (EventID, CustomerID) values (27, 8);
insert into Registers_For (EventID, CustomerID) values (28, 2);
insert into Registers_For (EventID, CustomerID) values (31, 12);
insert into Registers_For (EventID, CustomerID) values (14, 11);
insert into Registers_For (EventID, CustomerID) values (3, 29);
insert into Registers_For (EventID, CustomerID) values (39, 26);
insert into Registers_For (EventID, CustomerID) values (6, 23);
insert into Registers_For (EventID, CustomerID) values (39, 16);
insert into Registers_For (EventID, CustomerID) values (8, 6);
insert into Registers_For (EventID, CustomerID) values (39, 9);
insert into Registers_For (EventID, CustomerID) values (22, 12);
insert into Registers_For (EventID, CustomerID) values (29, 27);
insert into Registers_For (EventID, CustomerID) values (32, 14);
insert into Registers_For (EventID, CustomerID) values (22, 40);
insert into Registers_For (EventID, CustomerID) values (19, 16);
insert into Registers_For (EventID, CustomerID) values (37, 22);
insert into Registers_For (EventID, CustomerID) values (17, 18);
insert into Registers_For (EventID, CustomerID) values (37, 8);
insert into Registers_For (EventID, CustomerID) values (6, 35);
insert into Registers_For (EventID, CustomerID) values (31, 40);
insert into Registers_For (EventID, CustomerID) values (11, 20);
insert into Registers_For (EventID, CustomerID) values (8, 5);

insert into Organizes (BookID, LibrarianID) values (32, 14);
insert into Organizes (BookID, LibrarianID) values (27, 11);
insert into Organizes (BookID, LibrarianID) values (28, 32);
insert into Organizes (BookID, LibrarianID) values (37, 3);
insert into Organizes (BookID, LibrarianID) values (6, 16);
insert into Organizes (BookID, LibrarianID) values (22, 29);
insert into Organizes (BookID, LibrarianID) values (4, 4);
insert into Organizes (BookID, LibrarianID) values (35, 3);
insert into Organizes (BookID, LibrarianID) values (26, 9);
insert into Organizes (BookID, LibrarianID) values (9, 14);
insert into Organizes (BookID, LibrarianID) values (37, 38);
insert into Organizes (BookID, LibrarianID) values (23, 37);
insert into Organizes (BookID, LibrarianID) values (40, 14);
insert into Organizes (BookID, LibrarianID) values (1, 21);
insert into Organizes (BookID, LibrarianID) values (19, 28);
insert into Organizes (BookID, LibrarianID) values (6, 9);
insert into Organizes (BookID, LibrarianID) values (36, 39);
insert into Organizes (BookID, LibrarianID) values (14, 30);
insert into Organizes (BookID, LibrarianID) values (19, 32);
insert into Organizes (BookID, LibrarianID) values (37, 13);
insert into Organizes (BookID, LibrarianID) values (2, 23);
insert into Organizes (BookID, LibrarianID) values (26, 3);
insert into Organizes (BookID, LibrarianID) values (25, 35);
insert into Organizes (BookID, LibrarianID) values (38, 23);
insert into Organizes (BookID, LibrarianID) values (3, 20);
insert into Organizes (BookID, LibrarianID) values (33, 15);
insert into Organizes (BookID, LibrarianID) values (32, 29);
insert into Organizes (BookID, LibrarianID) values (9, 36);
insert into Organizes (BookID, LibrarianID) values (4, 29);
insert into Organizes (BookID, LibrarianID) values (32, 29);
insert into Organizes (BookID, LibrarianID) values (7, 14);
insert into Organizes (BookID, LibrarianID) values (12, 20);
insert into Organizes (BookID, LibrarianID) values (37, 12);
insert into Organizes (BookID, LibrarianID) values (33, 27);
insert into Organizes (BookID, LibrarianID) values (19, 39);
insert into Organizes (BookID, LibrarianID) values (29, 10);
insert into Organizes (BookID, LibrarianID) values (6, 12);
insert into Organizes (BookID, LibrarianID) values (37, 18);
insert into Organizes (BookID, LibrarianID) values (15, 11);
insert into Organizes (BookID, LibrarianID) values (32, 4);
insert into Organizes (BookID, LibrarianID) values (21, 8);
insert into Organizes (BookID, LibrarianID) values (36, 21);
insert into Organizes (BookID, LibrarianID) values (3, 33);
insert into Organizes (BookID, LibrarianID) values (30, 21);
insert into Organizes (BookID, LibrarianID) values (31, 34);
insert into Organizes (BookID, LibrarianID) values (37, 12);
insert into Organizes (BookID, LibrarianID) values (37, 18);
insert into Organizes (BookID, LibrarianID) values (29, 21);
insert into Organizes (BookID, LibrarianID) values (12, 17);
insert into Organizes (BookID, LibrarianID) values (22, 1);
insert into Organizes (BookID, LibrarianID) values (26, 29);
insert into Organizes (BookID, LibrarianID) values (8, 39);
insert into Organizes (BookID, LibrarianID) values (28, 18);
insert into Organizes (BookID, LibrarianID) values (10, 4);
insert into Organizes (BookID, LibrarianID) values (33, 29);
insert into Organizes (BookID, LibrarianID) values (3, 15);
insert into Organizes (BookID, LibrarianID) values (34, 5);
insert into Organizes (BookID, LibrarianID) values (7, 20);
insert into Organizes (BookID, LibrarianID) values (39, 16);
insert into Organizes (BookID, LibrarianID) values (19, 26);
insert into Organizes (BookID, LibrarianID) values (7, 2);
insert into Organizes (BookID, LibrarianID) values (12, 37);
insert into Organizes (BookID, LibrarianID) values (5, 33);
insert into Organizes (BookID, LibrarianID) values (24, 28);
insert into Organizes (BookID, LibrarianID) values (36, 12);
insert into Organizes (BookID, LibrarianID) values (20, 2);
insert into Organizes (BookID, LibrarianID) values (22, 38);
insert into Organizes (BookID, LibrarianID) values (8, 15);
insert into Organizes (BookID, LibrarianID) values (5, 37);
insert into Organizes (BookID, LibrarianID) values (32, 5);
insert into Organizes (BookID, LibrarianID) values (33, 16);
insert into Organizes (BookID, LibrarianID) values (26, 38);
insert into Organizes (BookID, LibrarianID) values (30, 18);
insert into Organizes (BookID, LibrarianID) values (36, 34);
insert into Organizes (BookID, LibrarianID) values (17, 38);
insert into Organizes (BookID, LibrarianID) values (40, 22);
insert into Organizes (BookID, LibrarianID) values (7, 3);
insert into Organizes (BookID, LibrarianID) values (20, 40);
insert into Organizes (BookID, LibrarianID) values (11, 26);
insert into Organizes (BookID, LibrarianID) values (9, 19);
insert into Organizes (BookID, LibrarianID) values (19, 7);
insert into Organizes (BookID, LibrarianID) values (34, 7);
insert into Organizes (BookID, LibrarianID) values (14, 31);
insert into Organizes (BookID, LibrarianID) values (40, 25);
insert into Organizes (BookID, LibrarianID) values (17, 6);
insert into Organizes (BookID, LibrarianID) values (4, 32);
insert into Organizes (BookID, LibrarianID) values (13, 29);
insert into Organizes (BookID, LibrarianID) values (14, 31);
insert into Organizes (BookID, LibrarianID) values (24, 37);
insert into Organizes (BookID, LibrarianID) values (21, 33);
insert into Organizes (BookID, LibrarianID) values (39, 40);
insert into Organizes (BookID, LibrarianID) values (9, 19);
insert into Organizes (BookID, LibrarianID) values (17, 2);
insert into Organizes (BookID, LibrarianID) values (35, 1);
insert into Organizes (BookID, LibrarianID) values (5, 31);
insert into Organizes (BookID, LibrarianID) values (4, 7);
insert into Organizes (BookID, LibrarianID) values (1, 11);
insert into Organizes (BookID, LibrarianID) values (27, 17);
insert into Organizes (BookID, LibrarianID) values (9, 21);
insert into Organizes (BookID, LibrarianID) values (3, 38);
insert into Organizes (BookID, LibrarianID) values (29, 20);
insert into Organizes (BookID, LibrarianID) values (26, 1);
insert into Organizes (BookID, LibrarianID) values (12, 15);
insert into Organizes (BookID, LibrarianID) values (27, 22);
insert into Organizes (BookID, LibrarianID) values (2, 17);
insert into Organizes (BookID, LibrarianID) values (26, 23);
insert into Organizes (BookID, LibrarianID) values (25, 17);
insert into Organizes (BookID, LibrarianID) values (8, 15);
insert into Organizes (BookID, LibrarianID) values (30, 23);
insert into Organizes (BookID, LibrarianID) values (7, 22);
insert into Organizes (BookID, LibrarianID) values (15, 12);
insert into Organizes (BookID, LibrarianID) values (35, 8);
insert into Organizes (BookID, LibrarianID) values (39, 33);
insert into Organizes (BookID, LibrarianID) values (21, 4);
insert into Organizes (BookID, LibrarianID) values (27, 29);
insert into Organizes (BookID, LibrarianID) values (11, 28);
insert into Organizes (BookID, LibrarianID) values (36, 17);
insert into Organizes (BookID, LibrarianID) values (30, 40);
insert into Organizes (BookID, LibrarianID) values (2, 33);
insert into Organizes (BookID, LibrarianID) values (2, 37);
insert into Organizes (BookID, LibrarianID) values (6, 25);
insert into Organizes (BookID, LibrarianID) values (22, 22);
insert into Organizes (BookID, LibrarianID) values (25, 21);
insert into Organizes (BookID, LibrarianID) values (38, 33);
insert into Organizes (BookID, LibrarianID) values (26, 9);

insert into Stores (WebsiteURL, BookID) values (30, 17);
insert into Stores (WebsiteURL, BookID) values (10, 37);
insert into Stores (WebsiteURL, BookID) values (36, 9);
insert into Stores (WebsiteURL, BookID) values (24, 27);
insert into Stores (WebsiteURL, BookID) values (15, 40);
insert into Stores (WebsiteURL, BookID) values (37, 26);
insert into Stores (WebsiteURL, BookID) values (29, 9);
insert into Stores (WebsiteURL, BookID) values (35, 7);
insert into Stores (WebsiteURL, BookID) values (33, 14);
insert into Stores (WebsiteURL, BookID) values (36, 5);
insert into Stores (WebsiteURL, BookID) values (38, 4);
insert into Stores (WebsiteURL, BookID) values (28, 16);
insert into Stores (WebsiteURL, BookID) values (1, 36);
insert into Stores (WebsiteURL, BookID) values (26, 5);
insert into Stores (WebsiteURL, BookID) values (37, 22);
insert into Stores (WebsiteURL, BookID) values (28, 12);
insert into Stores (WebsiteURL, BookID) values (14, 21);
insert into Stores (WebsiteURL, BookID) values (20, 32);
insert into Stores (WebsiteURL, BookID) values (25, 33);
insert into Stores (WebsiteURL, BookID) values (4, 27);
insert into Stores (WebsiteURL, BookID) values (29, 20);
insert into Stores (WebsiteURL, BookID) values (40, 18);
insert into Stores (WebsiteURL, BookID) values (19, 1);
insert into Stores (WebsiteURL, BookID) values (34, 25);
insert into Stores (WebsiteURL, BookID) values (33, 28);
insert into Stores (WebsiteURL, BookID) values (29, 16);
insert into Stores (WebsiteURL, BookID) values (29, 24);
insert into Stores (WebsiteURL, BookID) values (20, 21);
insert into Stores (WebsiteURL, BookID) values (37, 3);
insert into Stores (WebsiteURL, BookID) values (31, 11);
insert into Stores (WebsiteURL, BookID) values (18, 23);
insert into Stores (WebsiteURL, BookID) values (23, 18);
insert into Stores (WebsiteURL, BookID) values (28, 39);
insert into Stores (WebsiteURL, BookID) values (25, 31);
insert into Stores (WebsiteURL, BookID) values (13, 17);
insert into Stores (WebsiteURL, BookID) values (8, 14);
insert into Stores (WebsiteURL, BookID) values (35, 30);
insert into Stores (WebsiteURL, BookID) values (20, 38);
insert into Stores (WebsiteURL, BookID) values (30, 19);
insert into Stores (WebsiteURL, BookID) values (35, 26);
insert into Stores (WebsiteURL, BookID) values (15, 19);
insert into Stores (WebsiteURL, BookID) values (31, 29);
insert into Stores (WebsiteURL, BookID) values (23, 24);
insert into Stores (WebsiteURL, BookID) values (11, 11);
insert into Stores (WebsiteURL, BookID) values (14, 12);
insert into Stores (WebsiteURL, BookID) values (35, 33);
insert into Stores (WebsiteURL, BookID) values (27, 26);
insert into Stores (WebsiteURL, BookID) values (26, 9);
insert into Stores (WebsiteURL, BookID) values (3, 24);
insert into Stores (WebsiteURL, BookID) values (17, 29);
insert into Stores (WebsiteURL, BookID) values (36, 8);
insert into Stores (WebsiteURL, BookID) values (28, 26);
insert into Stores (WebsiteURL, BookID) values (2, 5);
insert into Stores (WebsiteURL, BookID) values (5, 6);
insert into Stores (WebsiteURL, BookID) values (9, 30);
insert into Stores (WebsiteURL, BookID) values (28, 38);
insert into Stores (WebsiteURL, BookID) values (9, 38);
insert into Stores (WebsiteURL, BookID) values (40, 38);
insert into Stores (WebsiteURL, BookID) values (29, 12);
insert into Stores (WebsiteURL, BookID) values (33, 31);
insert into Stores (WebsiteURL, BookID) values (17, 28);
insert into Stores (WebsiteURL, BookID) values (11, 18);
insert into Stores (WebsiteURL, BookID) values (29, 7);
insert into Stores (WebsiteURL, BookID) values (26, 26);
insert into Stores (WebsiteURL, BookID) values (18, 26);
insert into Stores (WebsiteURL, BookID) values (22, 2);
insert into Stores (WebsiteURL, BookID) values (39, 17);
insert into Stores (WebsiteURL, BookID) values (12, 14);
insert into Stores (WebsiteURL, BookID) values (18, 23);
insert into Stores (WebsiteURL, BookID) values (8, 19);
insert into Stores (WebsiteURL, BookID) values (11, 26);
insert into Stores (WebsiteURL, BookID) values (39, 35);
insert into Stores (WebsiteURL, BookID) values (8, 32);
insert into Stores (WebsiteURL, BookID) values (16, 33);
insert into Stores (WebsiteURL, BookID) values (17, 29);
insert into Stores (WebsiteURL, BookID) values (5, 12);
insert into Stores (WebsiteURL, BookID) values (24, 26);
insert into Stores (WebsiteURL, BookID) values (13, 28);
insert into Stores (WebsiteURL, BookID) values (27, 22);
insert into Stores (WebsiteURL, BookID) values (30, 17);
insert into Stores (WebsiteURL, BookID) values (21, 32);
insert into Stores (WebsiteURL, BookID) values (21, 18);
insert into Stores (WebsiteURL, BookID) values (38, 24);
insert into Stores (WebsiteURL, BookID) values (31, 9);
insert into Stores (WebsiteURL, BookID) values (40, 9);
insert into Stores (WebsiteURL, BookID) values (29, 15);
insert into Stores (WebsiteURL, BookID) values (37, 32);
insert into Stores (WebsiteURL, BookID) values (32, 22);
insert into Stores (WebsiteURL, BookID) values (3, 33);
insert into Stores (WebsiteURL, BookID) values (13, 5);
insert into Stores (WebsiteURL, BookID) values (10, 29);
insert into Stores (WebsiteURL, BookID) values (23, 10);
insert into Stores (WebsiteURL, BookID) values (7, 37);
insert into Stores (WebsiteURL, BookID) values (15, 14);
insert into Stores (WebsiteURL, BookID) values (30, 9);
insert into Stores (WebsiteURL, BookID) values (9, 29);
insert into Stores (WebsiteURL, BookID) values (28, 20);
insert into Stores (WebsiteURL, BookID) values (6, 1);
insert into Stores (WebsiteURL, BookID) values (2, 27);
insert into Stores (WebsiteURL, BookID) values (35, 16);
insert into Stores (WebsiteURL, BookID) values (3, 26);
insert into Stores (WebsiteURL, BookID) values (24, 29);
insert into Stores (WebsiteURL, BookID) values (23, 15);
insert into Stores (WebsiteURL, BookID) values (23, 30);
insert into Stores (WebsiteURL, BookID) values (16, 28);
insert into Stores (WebsiteURL, BookID) values (36, 3);
insert into Stores (WebsiteURL, BookID) values (17, 19);
insert into Stores (WebsiteURL, BookID) values (10, 27);
insert into Stores (WebsiteURL, BookID) values (19, 21);
insert into Stores (WebsiteURL, BookID) values (17, 7);
insert into Stores (WebsiteURL, BookID) values (32, 27);
insert into Stores (WebsiteURL, BookID) values (40, 13);
insert into Stores (WebsiteURL, BookID) values (12, 7);
insert into Stores (WebsiteURL, BookID) values (1, 38);
insert into Stores (WebsiteURL, BookID) values (32, 2);
insert into Stores (WebsiteURL, BookID) values (36, 1);
insert into Stores (WebsiteURL, BookID) values (31, 38);
insert into Stores (WebsiteURL, BookID) values (16, 23);
insert into Stores (WebsiteURL, BookID) values (12, 38);
insert into Stores (WebsiteURL, BookID) values (9, 28);
insert into Stores (WebsiteURL, BookID) values (13, 6);
insert into Stores (WebsiteURL, BookID) values (3, 39);
insert into Stores (WebsiteURL, BookID) values (5, 16);
insert into Stores (WebsiteURL, BookID) values (13, 16);
insert into Stores (WebsiteURL, BookID) values (11, 11);

insert into Sets_Up (EventID, LibrarianID) values (9, 12);
insert into Sets_Up (EventID, LibrarianID) values (25, 23);
insert into Sets_Up (EventID, LibrarianID) values (22, 32);
insert into Sets_Up (EventID, LibrarianID) values (12, 10);
insert into Sets_Up (EventID, LibrarianID) values (35, 7);
insert into Sets_Up (EventID, LibrarianID) values (11, 37);
insert into Sets_Up (EventID, LibrarianID) values (27, 9);
insert into Sets_Up (EventID, LibrarianID) values (27, 7);
insert into Sets_Up (EventID, LibrarianID) values (14, 15);
insert into Sets_Up (EventID, LibrarianID) values (19, 17);
insert into Sets_Up (EventID, LibrarianID) values (36, 18);
insert into Sets_Up (EventID, LibrarianID) values (12, 2);
insert into Sets_Up (EventID, LibrarianID) values (30, 37);
insert into Sets_Up (EventID, LibrarianID) values (27, 28);
insert into Sets_Up (EventID, LibrarianID) values (33, 15);
insert into Sets_Up (EventID, LibrarianID) values (9, 28);
insert into Sets_Up (EventID, LibrarianID) values (22, 30);
insert into Sets_Up (EventID, LibrarianID) values (29, 1);
insert into Sets_Up (EventID, LibrarianID) values (10, 15);
insert into Sets_Up (EventID, LibrarianID) values (13, 25);
insert into Sets_Up (EventID, LibrarianID) values (15, 25);
insert into Sets_Up (EventID, LibrarianID) values (33, 17);
insert into Sets_Up (EventID, LibrarianID) values (4, 24);
insert into Sets_Up (EventID, LibrarianID) values (20, 13);
insert into Sets_Up (EventID, LibrarianID) values (22, 27);
insert into Sets_Up (EventID, LibrarianID) values (7, 11);
insert into Sets_Up (EventID, LibrarianID) values (15, 4);
insert into Sets_Up (EventID, LibrarianID) values (35, 12);
insert into Sets_Up (EventID, LibrarianID) values (24, 25);
insert into Sets_Up (EventID, LibrarianID) values (17, 12);
insert into Sets_Up (EventID, LibrarianID) values (16, 30);
insert into Sets_Up (EventID, LibrarianID) values (19, 12);
insert into Sets_Up (EventID, LibrarianID) values (2, 32);
insert into Sets_Up (EventID, LibrarianID) values (6, 40);
insert into Sets_Up (EventID, LibrarianID) values (4, 12);
insert into Sets_Up (EventID, LibrarianID) values (5, 2);
insert into Sets_Up (EventID, LibrarianID) values (13, 17);
insert into Sets_Up (EventID, LibrarianID) values (13, 40);
insert into Sets_Up (EventID, LibrarianID) values (40, 21);
insert into Sets_Up (EventID, LibrarianID) values (6, 5);
insert into Sets_Up (EventID, LibrarianID) values (2, 35);
insert into Sets_Up (EventID, LibrarianID) values (39, 31);
insert into Sets_Up (EventID, LibrarianID) values (5, 39);
insert into Sets_Up (EventID, LibrarianID) values (1, 8);
insert into Sets_Up (EventID, LibrarianID) values (22, 2);
insert into Sets_Up (EventID, LibrarianID) values (17, 38);
insert into Sets_Up (EventID, LibrarianID) values (34, 16);
insert into Sets_Up (EventID, LibrarianID) values (21, 35);
insert into Sets_Up (EventID, LibrarianID) values (30, 27);
insert into Sets_Up (EventID, LibrarianID) values (40, 26);
insert into Sets_Up (EventID, LibrarianID) values (4, 3);
insert into Sets_Up (EventID, LibrarianID) values (14, 14);
insert into Sets_Up (EventID, LibrarianID) values (25, 27);
insert into Sets_Up (EventID, LibrarianID) values (12, 8);
insert into Sets_Up (EventID, LibrarianID) values (39, 14);
insert into Sets_Up (EventID, LibrarianID) values (30, 30);
insert into Sets_Up (EventID, LibrarianID) values (35, 16);
insert into Sets_Up (EventID, LibrarianID) values (24, 21);
insert into Sets_Up (EventID, LibrarianID) values (18, 30);
insert into Sets_Up (EventID, LibrarianID) values (27, 29);
insert into Sets_Up (EventID, LibrarianID) values (23, 23);
insert into Sets_Up (EventID, LibrarianID) values (8, 28);
insert into Sets_Up (EventID, LibrarianID) values (21, 34);
insert into Sets_Up (EventID, LibrarianID) values (30, 11);
insert into Sets_Up (EventID, LibrarianID) values (39, 13);
insert into Sets_Up (EventID, LibrarianID) values (5, 9);
insert into Sets_Up (EventID, LibrarianID) values (26, 13);
insert into Sets_Up (EventID, LibrarianID) values (9, 9);
insert into Sets_Up (EventID, LibrarianID) values (3, 28);
insert into Sets_Up (EventID, LibrarianID) values (22, 27);
insert into Sets_Up (EventID, LibrarianID) values (4, 5);
insert into Sets_Up (EventID, LibrarianID) values (22, 37);
insert into Sets_Up (EventID, LibrarianID) values (17, 38);
insert into Sets_Up (EventID, LibrarianID) values (22, 19);
insert into Sets_Up (EventID, LibrarianID) values (16, 16);
insert into Sets_Up (EventID, LibrarianID) values (34, 14);
insert into Sets_Up (EventID, LibrarianID) values (25, 16);
insert into Sets_Up (EventID, LibrarianID) values (33, 36);
insert into Sets_Up (EventID, LibrarianID) values (39, 37);
insert into Sets_Up (EventID, LibrarianID) values (20, 40);
insert into Sets_Up (EventID, LibrarianID) values (7, 29);
insert into Sets_Up (EventID, LibrarianID) values (8, 3);
insert into Sets_Up (EventID, LibrarianID) values (33, 11);
insert into Sets_Up (EventID, LibrarianID) values (30, 1);
insert into Sets_Up (EventID, LibrarianID) values (31, 4);
insert into Sets_Up (EventID, LibrarianID) values (32, 23);
insert into Sets_Up (EventID, LibrarianID) values (19, 35);
insert into Sets_Up (EventID, LibrarianID) values (33, 25);
insert into Sets_Up (EventID, LibrarianID) values (1, 33);
insert into Sets_Up (EventID, LibrarianID) values (10, 30);
insert into Sets_Up (EventID, LibrarianID) values (7, 26);
insert into Sets_Up (EventID, LibrarianID) values (33, 34);
insert into Sets_Up (EventID, LibrarianID) values (6, 39);
insert into Sets_Up (EventID, LibrarianID) values (28, 10);
insert into Sets_Up (EventID, LibrarianID) values (6, 39);
insert into Sets_Up (EventID, LibrarianID) values (13, 24);
insert into Sets_Up (EventID, LibrarianID) values (39, 22);
insert into Sets_Up (EventID, LibrarianID) values (23, 25);
insert into Sets_Up (EventID, LibrarianID) values (32, 23);
insert into Sets_Up (EventID, LibrarianID) values (17, 33);
insert into Sets_Up (EventID, LibrarianID) values (6, 3);
insert into Sets_Up (EventID, LibrarianID) values (6, 33);
insert into Sets_Up (EventID, LibrarianID) values (24, 32);
insert into Sets_Up (EventID, LibrarianID) values (11, 37);
insert into Sets_Up (EventID, LibrarianID) values (16, 24);
insert into Sets_Up (EventID, LibrarianID) values (24, 8);
insert into Sets_Up (EventID, LibrarianID) values (38, 32);
insert into Sets_Up (EventID, LibrarianID) values (28, 23);
insert into Sets_Up (EventID, LibrarianID) values (21, 5);
insert into Sets_Up (EventID, LibrarianID) values (22, 36);
insert into Sets_Up (EventID, LibrarianID) values (25, 12);
insert into Sets_Up (EventID, LibrarianID) values (28, 20);
insert into Sets_Up (EventID, LibrarianID) values (39, 19);
insert into Sets_Up (EventID, LibrarianID) values (26, 19);
insert into Sets_Up (EventID, LibrarianID) values (28, 38);
insert into Sets_Up (EventID, LibrarianID) values (25, 14);
insert into Sets_Up (EventID, LibrarianID) values (26, 12);
insert into Sets_Up (EventID, LibrarianID) values (40, 3);
insert into Sets_Up (EventID, LibrarianID) values (5, 38);
insert into Sets_Up (EventID, LibrarianID) values (23, 5);
insert into Sets_Up (EventID, LibrarianID) values (13, 31);
insert into Sets_Up (EventID, LibrarianID) values (31, 3);
insert into Sets_Up (EventID, LibrarianID) values (19, 35);
insert into Sets_Up (EventID, LibrarianID) values (12, 7);
insert into Sets_Up (EventID, LibrarianID) values (7, 26);

insert into Browses (CustomerID, WebsiteURL) values (26, 12);
insert into Browses (CustomerID, WebsiteURL) values (12, 40);
insert into Browses (CustomerID, WebsiteURL) values (22, 14);
insert into Browses (CustomerID, WebsiteURL) values (12, 29);
insert into Browses (CustomerID, WebsiteURL) values (8, 6);
insert into Browses (CustomerID, WebsiteURL) values (34, 21);
insert into Browses (CustomerID, WebsiteURL) values (36, 36);
insert into Browses (CustomerID, WebsiteURL) values (19, 15);
insert into Browses (CustomerID, WebsiteURL) values (32, 19);
insert into Browses (CustomerID, WebsiteURL) values (15, 29);
insert into Browses (CustomerID, WebsiteURL) values (21, 14);
insert into Browses (CustomerID, WebsiteURL) values (28, 17);
insert into Browses (CustomerID, WebsiteURL) values (10, 26);
insert into Browses (CustomerID, WebsiteURL) values (16, 38);
insert into Browses (CustomerID, WebsiteURL) values (21, 5);
insert into Browses (CustomerID, WebsiteURL) values (28, 25);
insert into Browses (CustomerID, WebsiteURL) values (33, 6);
insert into Browses (CustomerID, WebsiteURL) values (36, 32);
insert into Browses (CustomerID, WebsiteURL) values (8, 3);
insert into Browses (CustomerID, WebsiteURL) values (21, 1);
insert into Browses (CustomerID, WebsiteURL) values (30, 24);
insert into Browses (CustomerID, WebsiteURL) values (27, 9);
insert into Browses (CustomerID, WebsiteURL) values (39, 21);
insert into Browses (CustomerID, WebsiteURL) values (39, 18);
insert into Browses (CustomerID, WebsiteURL) values (37, 4);
insert into Browses (CustomerID, WebsiteURL) values (11, 26);
insert into Browses (CustomerID, WebsiteURL) values (32, 15);
insert into Browses (CustomerID, WebsiteURL) values (10, 12);
insert into Browses (CustomerID, WebsiteURL) values (5, 39);
insert into Browses (CustomerID, WebsiteURL) values (39, 18);
insert into Browses (CustomerID, WebsiteURL) values (3, 22);
insert into Browses (CustomerID, WebsiteURL) values (28, 19);
insert into Browses (CustomerID, WebsiteURL) values (38, 34);
insert into Browses (CustomerID, WebsiteURL) values (38, 15);
insert into Browses (CustomerID, WebsiteURL) values (40, 19);
insert into Browses (CustomerID, WebsiteURL) values (32, 34);
insert into Browses (CustomerID, WebsiteURL) values (5, 6);
insert into Browses (CustomerID, WebsiteURL) values (12, 8);
insert into Browses (CustomerID, WebsiteURL) values (34, 15);
insert into Browses (CustomerID, WebsiteURL) values (35, 18);
insert into Browses (CustomerID, WebsiteURL) values (39, 8);
insert into Browses (CustomerID, WebsiteURL) values (26, 16);
insert into Browses (CustomerID, WebsiteURL) values (33, 14);
insert into Browses (CustomerID, WebsiteURL) values (11, 31);
insert into Browses (CustomerID, WebsiteURL) values (36, 16);
insert into Browses (CustomerID, WebsiteURL) values (27, 5);
insert into Browses (CustomerID, WebsiteURL) values (3, 1);
insert into Browses (CustomerID, WebsiteURL) values (1, 7);
insert into Browses (CustomerID, WebsiteURL) values (22, 5);
insert into Browses (CustomerID, WebsiteURL) values (4, 22);
insert into Browses (CustomerID, WebsiteURL) values (10, 34);
insert into Browses (CustomerID, WebsiteURL) values (6, 5);
insert into Browses (CustomerID, WebsiteURL) values (33, 20);
insert into Browses (CustomerID, WebsiteURL) values (31, 15);
insert into Browses (CustomerID, WebsiteURL) values (13, 38);
insert into Browses (CustomerID, WebsiteURL) values (1, 10);
insert into Browses (CustomerID, WebsiteURL) values (36, 1);
insert into Browses (CustomerID, WebsiteURL) values (7, 31);
insert into Browses (CustomerID, WebsiteURL) values (11, 31);
insert into Browses (CustomerID, WebsiteURL) values (27, 9);
insert into Browses (CustomerID, WebsiteURL) values (20, 1);
insert into Browses (CustomerID, WebsiteURL) values (22, 2);
insert into Browses (CustomerID, WebsiteURL) values (28, 9);
insert into Browses (CustomerID, WebsiteURL) values (6, 4);
insert into Browses (CustomerID, WebsiteURL) values (6, 6);
insert into Browses (CustomerID, WebsiteURL) values (24, 39);
insert into Browses (CustomerID, WebsiteURL) values (25, 30);
insert into Browses (CustomerID, WebsiteURL) values (3, 33);
insert into Browses (CustomerID, WebsiteURL) values (1, 5);
insert into Browses (CustomerID, WebsiteURL) values (7, 19);
insert into Browses (CustomerID, WebsiteURL) values (39, 7);
insert into Browses (CustomerID, WebsiteURL) values (39, 8);
insert into Browses (CustomerID, WebsiteURL) values (39, 36);
insert into Browses (CustomerID, WebsiteURL) values (40, 23);
insert into Browses (CustomerID, WebsiteURL) values (36, 24);
insert into Browses (CustomerID, WebsiteURL) values (25, 2);
insert into Browses (CustomerID, WebsiteURL) values (18, 25);
insert into Browses (CustomerID, WebsiteURL) values (11, 17);
insert into Browses (CustomerID, WebsiteURL) values (2, 20);
insert into Browses (CustomerID, WebsiteURL) values (2, 25);
insert into Browses (CustomerID, WebsiteURL) values (2, 19);
insert into Browses (CustomerID, WebsiteURL) values (32, 20);
insert into Browses (CustomerID, WebsiteURL) values (19, 9);
insert into Browses (CustomerID, WebsiteURL) values (21, 32);
insert into Browses (CustomerID, WebsiteURL) values (1, 27);
insert into Browses (CustomerID, WebsiteURL) values (15, 33);
insert into Browses (CustomerID, WebsiteURL) values (8, 36);
insert into Browses (CustomerID, WebsiteURL) values (2, 29);
insert into Browses (CustomerID, WebsiteURL) values (27, 29);
insert into Browses (CustomerID, WebsiteURL) values (27, 2);
insert into Browses (CustomerID, WebsiteURL) values (30, 1);
insert into Browses (CustomerID, WebsiteURL) values (12, 39);
insert into Browses (CustomerID, WebsiteURL) values (31, 32);
insert into Browses (CustomerID, WebsiteURL) values (34, 9);
insert into Browses (CustomerID, WebsiteURL) values (28, 28);
insert into Browses (CustomerID, WebsiteURL) values (21, 40);
insert into Browses (CustomerID, WebsiteURL) values (1, 39);
insert into Browses (CustomerID, WebsiteURL) values (22, 18);
insert into Browses (CustomerID, WebsiteURL) values (5, 30);
insert into Browses (CustomerID, WebsiteURL) values (8, 2);
insert into Browses (CustomerID, WebsiteURL) values (22, 36);
insert into Browses (CustomerID, WebsiteURL) values (38, 34);
insert into Browses (CustomerID, WebsiteURL) values (6, 16);
insert into Browses (CustomerID, WebsiteURL) values (21, 24);
insert into Browses (CustomerID, WebsiteURL) values (15, 3);
insert into Browses (CustomerID, WebsiteURL) values (25, 7);
insert into Browses (CustomerID, WebsiteURL) values (31, 1);
insert into Browses (CustomerID, WebsiteURL) values (39, 35);
insert into Browses (CustomerID, WebsiteURL) values (7, 3);
insert into Browses (CustomerID, WebsiteURL) values (19, 21);
insert into Browses (CustomerID, WebsiteURL) values (27, 1);
insert into Browses (CustomerID, WebsiteURL) values (3, 31);
insert into Browses (CustomerID, WebsiteURL) values (39, 26);
insert into Browses (CustomerID, WebsiteURL) values (19, 25);
insert into Browses (CustomerID, WebsiteURL) values (12, 7);
insert into Browses (CustomerID, WebsiteURL) values (36, 17);
insert into Browses (CustomerID, WebsiteURL) values (17, 37);
insert into Browses (CustomerID, WebsiteURL) values (25, 4);
insert into Browses (CustomerID, WebsiteURL) values (31, 6);
insert into Browses (CustomerID, WebsiteURL) values (36, 3);
insert into Browses (CustomerID, WebsiteURL) values (9, 27);
insert into Browses (CustomerID, WebsiteURL) values (35, 14);
insert into Browses (CustomerID, WebsiteURL) values (37, 13);
insert into Browses (CustomerID, WebsiteURL) values (2, 17);
insert into Browses (CustomerID, WebsiteURL) values (19, 5);

insert into Manages (WebsiteURL, AdminID) values (39, 34);
insert into Manages (WebsiteURL, AdminID) values (1, 22);
insert into Manages (WebsiteURL, AdminID) values (39, 32);
insert into Manages (WebsiteURL, AdminID) values (23, 31);
insert into Manages (WebsiteURL, AdminID) values (32, 26);
insert into Manages (WebsiteURL, AdminID) values (31, 35);
insert into Manages (WebsiteURL, AdminID) values (15, 21);
insert into Manages (WebsiteURL, AdminID) values (5, 6);
insert into Manages (WebsiteURL, AdminID) values (36, 32);
insert into Manages (WebsiteURL, AdminID) values (21, 37);
insert into Manages (WebsiteURL, AdminID) values (37, 33);
insert into Manages (WebsiteURL, AdminID) values (7, 5);
insert into Manages (WebsiteURL, AdminID) values (12, 38);
insert into Manages (WebsiteURL, AdminID) values (27, 26);
insert into Manages (WebsiteURL, AdminID) values (40, 37);
insert into Manages (WebsiteURL, AdminID) values (38, 6);
insert into Manages (WebsiteURL, AdminID) values (24, 14);
insert into Manages (WebsiteURL, AdminID) values (17, 4);
insert into Manages (WebsiteURL, AdminID) values (18, 13);
insert into Manages (WebsiteURL, AdminID) values (6, 3);
insert into Manages (WebsiteURL, AdminID) values (37, 18);
insert into Manages (WebsiteURL, AdminID) values (1, 6);
insert into Manages (WebsiteURL, AdminID) values (10, 13);
insert into Manages (WebsiteURL, AdminID) values (28, 22);
insert into Manages (WebsiteURL, AdminID) values (30, 10);
insert into Manages (WebsiteURL, AdminID) values (18, 1);
insert into Manages (WebsiteURL, AdminID) values (5, 5);
insert into Manages (WebsiteURL, AdminID) values (15, 35);
insert into Manages (WebsiteURL, AdminID) values (12, 25);
insert into Manages (WebsiteURL, AdminID) values (30, 8);
insert into Manages (WebsiteURL, AdminID) values (10, 36);
insert into Manages (WebsiteURL, AdminID) values (36, 28);
insert into Manages (WebsiteURL, AdminID) values (25, 30);
insert into Manages (WebsiteURL, AdminID) values (2, 17);
insert into Manages (WebsiteURL, AdminID) values (2, 5);
insert into Manages (WebsiteURL, AdminID) values (36, 15);
insert into Manages (WebsiteURL, AdminID) values (7, 38);
insert into Manages (WebsiteURL, AdminID) values (5, 13);
insert into Manages (WebsiteURL, AdminID) values (29, 18);
insert into Manages (WebsiteURL, AdminID) values (8, 20);
insert into Manages (WebsiteURL, AdminID) values (15, 23);
insert into Manages (WebsiteURL, AdminID) values (12, 15);
insert into Manages (WebsiteURL, AdminID) values (37, 40);
insert into Manages (WebsiteURL, AdminID) values (40, 17);
insert into Manages (WebsiteURL, AdminID) values (13, 6);
insert into Manages (WebsiteURL, AdminID) values (37, 13);
insert into Manages (WebsiteURL, AdminID) values (10, 9);
insert into Manages (WebsiteURL, AdminID) values (4, 12);
insert into Manages (WebsiteURL, AdminID) values (40, 39);
insert into Manages (WebsiteURL, AdminID) values (16, 3);
insert into Manages (WebsiteURL, AdminID) values (31, 28);
insert into Manages (WebsiteURL, AdminID) values (13, 7);
insert into Manages (WebsiteURL, AdminID) values (15, 5);
insert into Manages (WebsiteURL, AdminID) values (4, 35);
insert into Manages (WebsiteURL, AdminID) values (12, 29);
insert into Manages (WebsiteURL, AdminID) values (11, 7);
insert into Manages (WebsiteURL, AdminID) values (28, 11);
insert into Manages (WebsiteURL, AdminID) values (36, 12);
insert into Manages (WebsiteURL, AdminID) values (20, 16);
insert into Manages (WebsiteURL, AdminID) values (19, 24);
insert into Manages (WebsiteURL, AdminID) values (24, 38);
insert into Manages (WebsiteURL, AdminID) values (7, 35);
insert into Manages (WebsiteURL, AdminID) values (26, 18);
insert into Manages (WebsiteURL, AdminID) values (29, 3);
insert into Manages (WebsiteURL, AdminID) values (9, 26);
insert into Manages (WebsiteURL, AdminID) values (22, 4);
insert into Manages (WebsiteURL, AdminID) values (39, 28);
insert into Manages (WebsiteURL, AdminID) values (37, 26);
insert into Manages (WebsiteURL, AdminID) values (7, 11);
insert into Manages (WebsiteURL, AdminID) values (24, 8);
insert into Manages (WebsiteURL, AdminID) values (19, 9);
insert into Manages (WebsiteURL, AdminID) values (19, 4);
insert into Manages (WebsiteURL, AdminID) values (12, 17);
insert into Manages (WebsiteURL, AdminID) values (34, 18);
insert into Manages (WebsiteURL, AdminID) values (24, 21);
insert into Manages (WebsiteURL, AdminID) values (8, 31);
insert into Manages (WebsiteURL, AdminID) values (28, 12);
insert into Manages (WebsiteURL, AdminID) values (22, 4);
insert into Manages (WebsiteURL, AdminID) values (25, 23);
insert into Manages (WebsiteURL, AdminID) values (30, 16);
insert into Manages (WebsiteURL, AdminID) values (31, 7);
insert into Manages (WebsiteURL, AdminID) values (27, 13);
insert into Manages (WebsiteURL, AdminID) values (35, 10);
insert into Manages (WebsiteURL, AdminID) values (22, 28);
insert into Manages (WebsiteURL, AdminID) values (13, 38);
insert into Manages (WebsiteURL, AdminID) values (15, 12);
insert into Manages (WebsiteURL, AdminID) values (4, 24);
insert into Manages (WebsiteURL, AdminID) values (21, 5);
insert into Manages (WebsiteURL, AdminID) values (34, 16);
insert into Manages (WebsiteURL, AdminID) values (6, 40);
insert into Manages (WebsiteURL, AdminID) values (3, 7);
insert into Manages (WebsiteURL, AdminID) values (23, 30);
insert into Manages (WebsiteURL, AdminID) values (8, 35);
insert into Manages (WebsiteURL, AdminID) values (7, 27);
insert into Manages (WebsiteURL, AdminID) values (35, 32);
insert into Manages (WebsiteURL, AdminID) values (14, 5);
insert into Manages (WebsiteURL, AdminID) values (25, 38);
insert into Manages (WebsiteURL, AdminID) values (25, 11);
insert into Manages (WebsiteURL, AdminID) values (21, 27);
insert into Manages (WebsiteURL, AdminID) values (36, 19);
insert into Manages (WebsiteURL, AdminID) values (28, 36);
insert into Manages (WebsiteURL, AdminID) values (7, 39);
insert into Manages (WebsiteURL, AdminID) values (6, 38);
insert into Manages (WebsiteURL, AdminID) values (6, 27);
insert into Manages (WebsiteURL, AdminID) values (33, 15);
insert into Manages (WebsiteURL, AdminID) values (22, 40);
insert into Manages (WebsiteURL, AdminID) values (26, 7);
insert into Manages (WebsiteURL, AdminID) values (32, 40);
insert into Manages (WebsiteURL, AdminID) values (32, 21);
insert into Manages (WebsiteURL, AdminID) values (18, 26);
insert into Manages (WebsiteURL, AdminID) values (7, 14);
insert into Manages (WebsiteURL, AdminID) values (18, 20);
insert into Manages (WebsiteURL, AdminID) values (10, 30);
insert into Manages (WebsiteURL, AdminID) values (18, 28);
insert into Manages (WebsiteURL, AdminID) values (17, 29);
insert into Manages (WebsiteURL, AdminID) values (1, 2);
insert into Manages (WebsiteURL, AdminID) values (36, 30);
insert into Manages (WebsiteURL, AdminID) values (14, 27);
insert into Manages (WebsiteURL, AdminID) values (21, 29);
insert into Manages (WebsiteURL, AdminID) values (40, 20);
insert into Manages (WebsiteURL, AdminID) values (25, 24);
insert into Manages (WebsiteURL, AdminID) values (12, 3);
insert into Manages (WebsiteURL, AdminID) values (9, 8);
insert into Manages (WebsiteURL, AdminID) values (37, 35);
insert into Manages (WebsiteURL, AdminID) values (14, 22);
