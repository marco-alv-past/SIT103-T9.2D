CREATE DATABASE AmazonMusic;

USE AmazonMusic;


CREATE TABLE AdvertisementMedia
(
  Id         INT     NOT NULL AUTO_INCREMENT,
  CampaignId INT     NOT NULL,
  Title      VARCHAR(255) NOT NULL,
  Duration   INT     NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE AdvertisementMediaPlays
(
  Id                   INT      NOT NULL AUTO_INCREMENT,
  MemberId             INT      NOT NULL,
  AdvertisementMediaId INT      NOT NULL,
  Date                 DATETIME NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Advertiser
(
  Id            INT     NOT NULL AUTO_INCREMENT,
  Name          VARCHAR(255) NOT NULL,
  Address       VARCHAR(255) NOT NULL,
  Country       VARCHAR(255) NOT NULL,
  ContactPerson VARCHAR(255) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Album
(
  Id          INT     NOT NULL AUTO_INCREMENT,
  LabelCode   VARCHAR(255) NULL    ,
  Title       VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NULL    ,
  Year        INT     NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Artist
(
  Id        INT     NOT NULL AUTO_INCREMENT,
  GenreCode VARCHAR(255) NOT NULL,
  ArtistTypeCode VARCHAR(255) NOT NULL,
  Name      VARCHAR(255) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE ArtistType
(
  Code        VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NULL    ,
  PRIMARY KEY (Code)
);

CREATE TABLE Campaign
(
  Id            INT      NOT NULL AUTO_INCREMENT,
  AdvertiserId  INT      NOT NULL,
  Name          VARCHAR(255)  NOT NULL,
  MonthlyBudget DECIMAL(10,2)  NOT NULL,
  StartDate     DATETIME NOT NULL,
  EndDate       DATETIME NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Content
(
  Id       INT     NOT NULL AUTO_INCREMENT,
  ArtistId INT     NOT NULL,
  AlbumId  INT     NOT NULL,
  Title    VARCHAR(255) NOT NULL,
  Duration int     NOT NULL,
  Format   VARCHAR(255) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Genre
(
  Code        VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)
);

CREATE TABLE Label
(
  Code    VARCHAR(255) NOT NULL,
  Name    VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NULL    ,
  PRIMARY KEY (Code)
);

CREATE TABLE Member
(
  Id        INT     NOT NULL AUTO_INCREMENT,
  Email     VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  SureNames VARCHAR(255) NOT NULL,
  Password  VARCHAR(255) NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Membership
(
  Id                INT      NOT NULL AUTO_INCREMENT,
  PaymentMethodCode VARCHAR(255)  NULL    ,
  MemberId          INT      NOT NULL,
  IsFree            BOOLEAN  NOT NULL,
  RenewDate         DATETIME NULL    ,
  MonthlyFee         DECIMAL(10,2)  NULL    ,
  PRIMARY KEY (Id)
);

CREATE TABLE MontlyPlays
(
  Id        INT      NOT NULL AUTO_INCREMENT,
  ContentId INT      NOT NULL,
  MemberId  INT      NOT NULL,
  Date      DATETIME NULL    ,
  PRIMARY KEY (Id)
);

CREATE TABLE PaymentMethod
(
  Code        VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Details     VARCHAR(255) NULL    ,
  PRIMARY KEY (Code)
);

ALTER TABLE Artist
  ADD CONSTRAINT FK_Genre_TO_Artist
    FOREIGN KEY (GenreCode)
    REFERENCES Genre (Code);

ALTER TABLE Artist
  ADD CONSTRAINT FK_ArtistType_TO_Artist
    FOREIGN KEY (ArtistTypeCode)
    REFERENCES ArtistType (Code);

ALTER TABLE Content
  ADD CONSTRAINT FK_Artist_TO_Content
    FOREIGN KEY (ArtistId)
    REFERENCES Artist (Id);

ALTER TABLE Album
  ADD CONSTRAINT FK_Label_TO_Album
    FOREIGN KEY (LabelCode)
    REFERENCES Label (Code);

ALTER TABLE Content
  ADD CONSTRAINT FK_Album_TO_Content
    FOREIGN KEY (AlbumId)
    REFERENCES Album (Id);

ALTER TABLE Membership
  ADD CONSTRAINT FK_PaymentMethod_TO_Membership
    FOREIGN KEY (PaymentMethodCode)
    REFERENCES PaymentMethod (Code);

ALTER TABLE Membership
  ADD CONSTRAINT FK_Member_TO_Membership
    FOREIGN KEY (MemberId)
    REFERENCES Member (Id);

ALTER TABLE MontlyPlays
  ADD CONSTRAINT FK_Content_TO_MontlyPlays
    FOREIGN KEY (ContentId)
    REFERENCES Content (Id);

ALTER TABLE MontlyPlays
  ADD CONSTRAINT FK_Member_TO_MontlyPlays
    FOREIGN KEY (MemberId)
    REFERENCES Member (Id);

ALTER TABLE Campaign
  ADD CONSTRAINT FK_Advertiser_TO_Campaign
    FOREIGN KEY (AdvertiserId)
    REFERENCES Advertiser (Id);

ALTER TABLE AdvertisementMedia
  ADD CONSTRAINT FK_Campaign_TO_AdvertisementMedia
    FOREIGN KEY (CampaignId)
    REFERENCES Campaign (Id);

ALTER TABLE AdvertisementMediaPlays
  ADD CONSTRAINT FK_Member_TO_AdvertisementMediaPlays
    FOREIGN KEY (MemberId)
    REFERENCES Member (Id);

ALTER TABLE AdvertisementMediaPlays
  ADD CONSTRAINT FK_AdvertisementMedia_TO_AdvertisementMediaPlays
    FOREIGN KEY (AdvertisementMediaId)
    REFERENCES AdvertisementMedia (Id);