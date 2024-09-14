USE AmazonMusic;
 
INSERT INTO AmazonMusic.ArtistType (Code, Description) VALUES ('IND','Independent');
INSERT INTO AmazonMusic.ArtistType (Code, Description) VALUES ('SOL','Solist');
INSERT INTO AmazonMusic.ArtistType (Code, Description) VALUES ('BAN','Band');
INSERT INTO AmazonMusic.ArtistType (Code, Description) VALUES ('PRO','Project');
INSERT INTO AmazonMusic.ArtistType (Code, Description) VALUES ('ORC','Orchestra');

INSERT INTO AmazonMusic.Genre (Code,Description) VALUES ('POP','Pop');
INSERT INTO AmazonMusic.Genre (Code,Description) VALUES ('ROC','Rock');
INSERT INTO AmazonMusic.Genre (Code,Description) VALUES ('CON','Country');
INSERT INTO AmazonMusic.Genre (Code,Description) VALUES ('IND','Indie');
INSERT INTO AmazonMusic.Genre (Code,Description) VALUES ('ALT','Alternative');

INSERT INTO AmazonMusic.Artist(GenreCode,ArtistTypeCode,Name) VALUES('ALT','IND','Candice Warner');
INSERT INTO AmazonMusic.Artist(GenreCode,ArtistTypeCode,Name) VALUES('ALT','IND','Neha Bangia');
INSERT INTO AmazonMusic.Artist(GenreCode,ArtistTypeCode,Name) VALUES('ROC','BAN','Slipknot');
INSERT INTO AmazonMusic.Artist(GenreCode,ArtistTypeCode,Name) VALUES('ALT','BAN','Mr Bungle');
INSERT INTO AmazonMusic.Artist(GenreCode,ArtistTypeCode,Name) VALUES('ROC','BAN','Faith No More');

INSERT INTO AmazonMusic.Label (Code,Name,Address) VALUES ('AMR','Amazon Records','565 Amazon St, California, US');
INSERT INTO AmazonMusic.Label (Code,Name,Address) VALUES ('EAR','Earchache Records','136 Hart Ridge Road, Jacksonville, US');
INSERT INTO AmazonMusic.Label (Code,Name,Address) VALUES ('IPE','Ipecac Records','3645 Edwards Street, Saginaw, US');
INSERT INTO AmazonMusic.Label (Code,Name,Address) VALUES ('WAR','Warner Bros Records','2818 Lynn Ogden Lane, Albany, US');
INSERT INTO AmazonMusic.Label (Code,Name,Address) VALUES ('IND','Independent','4481 Arrowood Drive, California, US');

INSERT INTO AmazonMusic.Album(LabelCode,Title,Description,Year) VALUES ('IND','My First Podcast','Podcast about business and lifestyle',2024);
INSERT INTO AmazonMusic.Album(LabelCode,Title,Description,Year) VALUES ('IND','Meditation','Podcast about how to begin on meditation',2020);
INSERT INTO AmazonMusic.Album(LabelCode,Title,Description,Year) VALUES ('EAR','SLIPKNOT ".5: THE GRAY CHAPTER','5th Skipnot iconic album ',2014);
INSERT INTO AmazonMusic.Album(LabelCode,Title,Description,Year) VALUES ('WAR','Mr Bungle','1st Self title Album',1991);
INSERT INTO AmazonMusic.Album(LabelCode,Title,Description,Year) VALUES ('IPE','Sol Invictus','After their breakup the band releasing this astonoshing Album',2015);

INSERT INTO AmazonMusic.Content(ArtistId,AlbumId,Title,Duration,Format) VALUES(1,1,'How to be succeful in your first online buinesss',600,'Mp3');
INSERT INTO AmazonMusic.Content(ArtistId,AlbumId,Title,Duration,Format) VALUES(2,2,'Meditation for Beginners',900,'Wav');
INSERT INTO AmazonMusic.Content(ArtistId,AlbumId,Title,Duration,Format) VALUES(3,3,'The Negative One',325,'Ac3');
INSERT INTO AmazonMusic.Content(ArtistId,AlbumId,Title,Duration,Format) VALUES(4,4,'Carousel',315,'Mp3');
INSERT INTO AmazonMusic.Content(ArtistId,AlbumId,Title,Duration,Format) VALUES(5,5,'Sol Invictus',156,'Mp3');

INSERT INTO AmazonMusic.PaymentMethod(Code,Description,Details) VALUES('PAY','Paypal','Paypal Australia');
INSERT INTO AmazonMusic.PaymentMethod(Code,Description,Details) VALUES('CRE','Credit Card','Visa/Mastercard/Amex');
INSERT INTO AmazonMusic.PaymentMethod(Code,Description,Details) VALUES('BIT','Bitcoins','Crypto Currency');
INSERT INTO AmazonMusic.PaymentMethod(Code,Description,Details) VALUES('DIR','Direct Debit','Bank Direct Debit');
INSERT INTO AmazonMusic.PaymentMethod(Code,Description,Details) VALUES('APP','ApplePay','Apple Payment System');

INSERT INTO AmazonMusic.Member (Email,FirstName,SureNames,Password) VALUES ('jduarte@gmail.com','Jasmin','Duarte','123456');
INSERT INTO AmazonMusic.Member (Email,FirstName,SureNames,Password) VALUES ('bchang@yahoo.com','Baron ','Chang','abc456');
INSERT INTO AmazonMusic.Member (Email,FirstName,SureNames,Password) VALUES ('mrussell@hotmail.com','Michael','Russell','mr4456');
INSERT INTO AmazonMusic.Member (Email,FirstName,SureNames,Password) VALUES ('egallegos@ymail.com','Edgar','Gallegos','rd0011');
INSERT INTO AmazonMusic.Member (Email,FirstName,SureNames,Password) VALUES ('mellis@gmail.com','Makenzie','Ellis','mk0489');

INSERT INTO AmazonMusic.Membership (PaymentMethodCode,MemberId,IsFree,RenewDate,MonthlyFee) VALUES (null,1,true,null,null);
INSERT INTO AmazonMusic.Membership (PaymentMethodCode,MemberId,IsFree,RenewDate,MonthlyFee) VALUES (null,2,true,null,null);
INSERT INTO AmazonMusic.Membership (PaymentMethodCode,MemberId,IsFree,RenewDate,MonthlyFee) VALUES ('CRE',3,false,'2024-12-01 00:00:00',5.99);
INSERT INTO AmazonMusic.Membership (PaymentMethodCode,MemberId,IsFree,RenewDate,MonthlyFee) VALUES ('CRE',4,false,'2024-11-01 00:00:00',5.99);
INSERT INTO AmazonMusic.Membership (PaymentMethodCode,MemberId,IsFree,RenewDate,MonthlyFee) VALUES ('PAY',5,false,'2024-10-01 00:00:00',5.99);

INSERT INTO AmazonMusic.MontlyPlays (ContentId,MemberId,Date) VALUES(1,1,NOW());
INSERT INTO AmazonMusic.MontlyPlays (ContentId,MemberId,Date) VALUES(2,1,NOW());
INSERT INTO AmazonMusic.MontlyPlays (ContentId,MemberId,Date) VALUES(4,3,NOW());
INSERT INTO AmazonMusic.MontlyPlays (ContentId,MemberId,Date) VALUES(5,3,NOW());
INSERT INTO AmazonMusic.MontlyPlays (ContentId,MemberId,Date) VALUES(2,5,NOW());

INSERT INTO AmazonMusic.Advertiser(Name,Address,Country,ContactPerson)VALUES('Play Planet','4043 Eagle Street','USA','Dixie Todd');
INSERT INTO AmazonMusic.Advertiser(Name,Address,Country,ContactPerson)VALUES('Joy Zone','219 Walnut Avenue','Australia','Gerardo Petty');
INSERT INTO AmazonMusic.Advertiser(Name,Address,Country,ContactPerson)VALUES('Excite Escape','85 Shobe Lane','New Zealand','Siena Chung');
INSERT INTO AmazonMusic.Advertiser(Name,Address,Country,ContactPerson)VALUES('Adventura','158 Matthews Street','USA','Abraham Shelton');
INSERT INTO AmazonMusic.Advertiser(Name,Address,Country,ContactPerson)VALUES('Bliss Bazaar','3362 Pringle Drive','Canada','Nikolas Green');

INSERT INTO AmazonMusic.Campaign(AdvertiserId,Name,MonthlyBudget,StartDate,EndDate) VALUES (1,'Winter Campaing',1000.00,'2024-12-01 00:00:00','2024-12-15 23:59:59');
INSERT INTO AmazonMusic.Campaign(AdvertiserId,Name,MonthlyBudget,StartDate,EndDate) VALUES (2,'School Holidays Campaing',4990.00,'2024-11-01 00:00:00','2024-11-15 23:59:59');
INSERT INTO AmazonMusic.Campaign(AdvertiserId,Name,MonthlyBudget,StartDate,EndDate) VALUES (3,'Bootcamp Campaing',599.00,'2024-01-01 00:00:00','2024-01-15 23:59:59');
INSERT INTO AmazonMusic.Campaign(AdvertiserId,Name,MonthlyBudget,StartDate,EndDate) VALUES (4,'End of Year Camping',699.00,'2024-03-01 00:00:00','2024-03-15 23:59:59');
INSERT INTO AmazonMusic.Campaign(AdvertiserId,Name,MonthlyBudget,StartDate,EndDate) VALUES (5,'End of Financial Year',9999.99,'2024-06-01 00:00:00','2024-06-15 23:59:59');

INSERT INTO AmazonMusic.AdvertisementMedia (CampaignId,Title,Duration) VALUES (1,'Mid Winter Sales',20);
INSERT INTO AmazonMusic.AdvertisementMedia (CampaignId,Title,Duration) VALUES (2,'Closing Sales',15);
INSERT INTO AmazonMusic.AdvertisementMedia (CampaignId,Title,Duration) VALUES (3,'Bootcamp learning',10);
INSERT INTO AmazonMusic.AdvertisementMedia (CampaignId,Title,Duration) VALUES (4,'Christmas Sale',16);
INSERT INTO AmazonMusic.AdvertisementMedia (CampaignId,Title,Duration) VALUES (5,'Tax Discounts',18);

INSERT INTO AmazonMusic.AdvertisementMediaPlays(MemberId,AdvertisementMediaId,Date) VALUES (1,1,NOW());
INSERT INTO AmazonMusic.AdvertisementMediaPlays(MemberId,AdvertisementMediaId,Date) VALUES (1,2,NOW());
INSERT INTO AmazonMusic.AdvertisementMediaPlays(MemberId,AdvertisementMediaId,Date) VALUES (2,1,NOW());
INSERT INTO AmazonMusic.AdvertisementMediaPlays(MemberId,AdvertisementMediaId,Date) VALUES (2,2,NOW());
INSERT INTO AmazonMusic.AdvertisementMediaPlays(MemberId,AdvertisementMediaId,Date) VALUES (2,3,NOW());
