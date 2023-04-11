START TRANSACTION;

DROP TABLE IF EXISTS landmark CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS itinerary;

CREATE TABLE landmark (
landmark_id serial,
landmark_img_url varchar (10000) NOT NULL,
landmark_description varchar (100000) NOT NULL,
landmark_name varchar (1000) NOT NULL,
landmark_type varchar (1000) NOT NULL,
landmark_latitude decimal (16,14) NOT NULL,
landmark_longitude decimal (16,14) NOT NULL,
hours_of_operations varchar (1000) NOT NULL,
kid_friendly boolean NOT NULL,
admission boolean NOT NULL,
restaurant_type varchar (1000),
is_outdoor boolean NOT NULL,
landmark_rating numeric (6,2),
CONSTRAINT PK_landmark_id PRIMARY KEY (landmark_id)
);

CREATE TABLE users (
user_id SERIAL,
username varchar(50) NOT NULL UNIQUE,
password_hash varchar(200) NOT NULL,
role varchar(50) NOT NULL,
CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE itinerary (
itinerary_id serial,
user_id int,
landmark_id int,
sequence_id int,

CONSTRAINT PK_itinerary_id PRIMARY KEY (itinerary_id),
CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users (user_id),
CONSTRAINT FK_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark (landmark_id)
);

COMMIT;


INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t2_cleveland_museum_of_art_5447_mobi.jpg','The Cleveland Museum of Art is an art museum in Cleveland, Ohio, located in the Wade Park District, in the University Circle neighborhood on the citys east side.', 'The Cleveland Museum of Art', 'Museum', 41.508143000791016, -81.61199376059822,'10AM - 9PM', 'true','true','','false', 4.9);
		
INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t3_what_to_do_in_cleveland_west_s_5447_mobi.jpg','The West Side Market is the oldest operating indoor/outdoor market space in Cleveland, Ohio. It is located at the corner of West 25th Street and Lorain Avenue in the Ohio City neighborhood. On December 18, 1973, it was added to the National Register of Historic Places.', 'West Side Market', 'Market', 41.48533470793714 ,-81.70288231534131,'10AM - 5PM', 'true','false','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t4_cleveland_cultural_gardens_5447_mobi.jpg','The Cleveland Cultural Gardens are a collection of public gardens located in Rockefeller Park in Cleveland, Ohio. The gardens are situated along East Boulevard & Martin Luther King Jr. Drive within the 276 acre of wooded parkland on the citys East Side', 'Cleveland Cultural Gardens', 'Garden', 41.51945951614276 ,-81.61814498465867,'8AM - 10PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t5_greater_cleveland_aquarium_5447_mobi.jpg','The Greater Cleveland Aquarium is an aquarium in Cleveland, Ohio. Occupying the historic FirstEnergy Powerhouse building located on the west bank of the Cuyahoga River in the citys Flats district', 'Greater Cleveland Aquarium','Aquarium', 41.49668286311162,-81.70384523099891,'10AM - 5PM', 'true','true','','false', 4.3);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t6_international_women''s_air_and__5447_mobi.jpg','The International Womens Air & Space Museum, Inc. is a museum in Cleveland, Ohio, that preserves the history of women in aviation and space and documents their continuing contributions', 'International Womens Air & Space Museum','Museum', 41.512290954837155,-81.69015016136527,'8AM - 8PM', 'true','true','','false', 4.4);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t7_museum_of_contemporary_art_(mo_5447_mobi.jpg','The Museum of Contemporary Art Cleveland is a contemporary art museum in Cleveland, Ohio, United States. It is the only contemporary art venue of its kind in Metropolitan Cleveland.', 'Museum of Contemporary Art','Museum', 41.50950503674985,-81.60460208465868,'11AM - 5PM','true','false','','false', 4.3);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t9_cleveland_institute_of_art_(ci_5447_mobi.jpg','The Cleveland Institute of Art, previously Cleveland School of Art, is a private college focused on art and design and located in Cleveland, Ohio', 'Cleveland Institue of Arts','Museum',41.51070901485761,-81.60240532915118,'9AM - 5PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t10_rock_and_roll_hall_of_fame_and_5447_mobi.jpg','The Rock and Roll Hall of Fame, sometimes simply referred to as the Rock Hall, is a museum and hall of fame located in downtown Cleveland, Ohio, United States, on the shore of Lake Erie', 'Rock and Roll Hall of Fame','Museum',41.50939303688708,-81.69545433068262,'10AM - 9PM','true','true','','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t11_what_to_do_in_cleveland_james__5447_mobi.jpg','The James A. Garfield Memorial is a memorial for and the final resting place of assassinated President James A. Garfield, located in Lake View Cemetery in Cleveland, Ohio.', 'James A. Garfield Monument','Monument',41.510639763042875,-81.59134931534133,'10AM - 10PM','true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/t-t12_playhouse_square,_cleveland,_o_5447_mobi.jpg','Playhouse Square is a theater district in downtown Cleveland, Ohio, United States. It is the largest performing arts center in the US outside of New York City. Constructed in a span of 19 months in the early 1920s, the theaters were subsequently closed down, but were revived through a grassroots effort', 'Playhouse Square','cultural center',41.50185149489846, -81.68063865397605,'10AM - 10PM','true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g15_mobi.jpg','Progressive Field is a Major League Baseball baseball park located in the downtown area of Cleveland, Ohio, United States. It is the home field of the Cleveland Guardians and, together with Rocket Mortgage FieldHouse, is part of the Gateway Sports and Entertainment Complex', 'Progressive Field','Entertainment',41.49699851273636, -81.68565805341318,'10AM - 12AM','true','true','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g16_mobi.jpg','A Christmas Story House is an attraction and museum in the Tremont neighborhood of Cleveland, Ohio. The 19th-century Victorian, which was used in the exterior and some interior scenes of Ralphie Parkers film A Christmas Story.', 'A Christmas Story House','Museum',41.46933330551983,-81.68733938465867,'9AM - 5PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g18_mobi.jpg','Cleveland Play House is a professional regional theater company located in Cleveland, Ohio. It was founded in 1915 and built its own noted theater complex in 1927. Currently the company performs at the Allen Theatre in Playhouse Square where it has been based since 2011.', 'Cleveland Play House','Entertainment',41.51407423517911, -81.68251443425575,'10AM - 10PM','false','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g19_mobi.jpg','Modest small plates go with craft cocktails in a loungey space featuring live jazz.', 'Velvet Tango Room','Music Venue',41.48454486525938,-81.70058385341318,'4:40PM - 1AM','false','true','','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g20_mobi.jpg','The Cleveland Museum of Natural History is a natural history museum located approximately five miles east of downtown Cleveland, Ohio in University Circle, a 550-acre concentration of educational, cultural and medical institutions.', 'Cleveland Museum of Natural History','Museum',41.51208637706378, -81.61279776931737,'10AM - 5PM','true','true','','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g22_mobi.jpg','The SS William G. Mather is a retired Great Lakes bulk freighter now restored as a museum ship in Cleveland, Ohio, one of five in the Great Lakes region', 'Steamship William G. Mather Museum','Museum',41.509466811709125, -81.69745732329342,'9AM - 5PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g23_mobi.jpg','Pub featuring a menu of traditional Irish & American fare plus live music & a patio with lake views.','The Harp','Music Venue',41.48873649950637,-81.71697891534133,'11:30AM - 10PM','false','true','','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g24_mobi.jpg','The Cleveland Orchestra, based in Cleveland, is one of the five American orchestras informally referred to as the "Big Five". Founded in 1918 by the pianist and impresario Adella Prentiss Hughes, the orchestra plays most of its concerts at Severance Hall.','The Cleveland Orchestra','Music Venue',41.5063008896062, -81.60936100031599,'5PM - 9PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/destinations/best-things-to-do-in-cleveland_g25_mobi.jpg','The Cleveland Metroparks Zoo aka Cleveland Zoological Park is a 183-acre zoo in Cleveland, Ohio. The Zoo is divided into several areas: Australian Adventure; African Savanna; Northern Wilderness Trek, The Primate, Cat & Aquatics Building, Waterfowl Lake, The RainForest, and the newly added Asian Highlands','Cleveland Metroparks Zoo','Zoo',41.44663841916885, -81.7126246,'10AM - 5PM','true','true','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipNRBozNC4zSKM8lcjej3o-1oFdRqKVngQ1uCHhC=w640-h240-k-no','Rocket Mortgage FieldHouse is a multi-purpose arena in Cleveland, Ohio. The building is the home of the Cleveland Cavaliers of the National Basketball Association and the Cleveland Monsters of the American Hockey League. It also serves as a secondary arena for Cleveland State Vikings mens and womens basketball.','Rocket Mortgage FieldHouse','Stadium',41.497109907152876, -81.68801448465868,'10AM - 12AM','true','true','','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipMCsx-nOH2z8ZfkHhcwjHM0U0BQufLMqB4AdBMc=w408-h272-k-no','The Childrens Museum of Cleveland was established in 1981 and is located in the Midtown neighborhood of Cleveland, Ohio','The Childrens Museum of Cleveland','Museum',41.50554136349363, -81.66042738409581,'9AM - 5PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipP01y6E58LHWjAqK_zaL0YNPriy8CA0e6HOJMGq=w408-h306-k-no','In Little Italy, the main strip Mayfield Road is full of old-school Italian cafes, bakeries and pizzerias, as well as elegant trattorias where singers perform opera arias. Indie art galleries and Italian food and wine shops are also dotted around the area. Colorful murals depict the stories of Italian immigrants.','Little Italy','Historical Neighborhood',41.50908068638288, -81.5987891105193,'10AM - 10AM','true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://s3.amazonaws.com/crowdriff-media/full/444ce9873a6db9733147ac68ffddae654cc6e6cc3b7aa267536a64ae61b07678.jpg','University Circle is a busy cultural hub with institutions like the Cleveland Natural History Museum and the Museum of Contemporary Art, a modern mirrored structure with regularly changing exhibitions. Severance Hall hosts performances by the Cleveland Orchestra, and paths wind past roses and maple trees at the Cleveland Botanical Garden. Casual college bars, ramen joints and Asian fusion eateries dot the area.','University Circle','Cultural Hub',41.50922602862502,-81.60886420872895, '10AM - 10AM','true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipObsIGLADn5qZKNlVl74b4BMA_58UaNR8PQliI-=w408-h541-k-no','The Cleveland Botanical Garden, located in the University Circle neighborhood of Cleveland, Ohio, in the United States.','Cleveland Botanical Gardens','Garden',41.51170068041453, -81.60959720000001, '10AM - 5PM','true','true','','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipP5mID8GHQ250_Swvqy9KuEnuRjKsSLEdlNf1ys=w408-h271-k-no','Old-school ballroom, live music destination & American restaurant emphasizing locally sourced fare.','Beachland Ballroom & Tavern','Music Venue',41.5719009759708, -81.57027223863474, '7PM - 12AM','false','true','','false', 4.6);



INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/articles/t-c1_acacia_reservation_155444_mobi.jpg','Passive park of 155 acres with a paved loop trail, a clubhouse & a regular schedule of guided walks.', 'Acacia Reservation', 'Park', 41.50228444391652, -81.48984306136526,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipOtxnZSWnjDCvvUC6aTaqHXnlrcAYo1QjnBz2-w=s680-w680-h510','This forested recreation area with a creek & a gorge features hiking trails, picnic sites & golf.', 'Bedford Reservation', 'Park',41.379147238107606, -81.54265033863473,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.google.com/maps/uv?pb=!1s0x8830eb1cb31372ef:0x5ed6713561c6117f!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipOqKIaudaWzu0MTx7AEyqld0h3kHtTUbzpmKXoa%3Dw260-h175-n-k-no!5sBig+Creek+Reservation+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipOqKIaudaWzu0MTx7AEyqld0h3kHtTUbzpmKXoa&hl=en&sa=X&ved=2ahUKEwi_jr3d9KH-AhUKj4kEHZmADvIQ7ZgBKAB6BAgUEAI','Scenic 175-acre area featuring a multiuse lake-to-lake trail, playground, fishing & picnic space.', 'Big Creek Reservation', 'Park', 41.35515336585686, -81.82657781534134,'6AM - 11PM', 'true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRyZ7uEYFix6vIqPqQafvjdlJi8hR9G6nmRyo2Y82Tow&s','Woodland park atop a sandstone quarry featuring a fishing lake & dense forest that hosts many deer.', 'Bradley Woods Reservation', 'Park', 41.412919978469034, -81.9562091,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipNGIGiyeaKfY1PYmvfhabfQljqk8Cnq9GigjSs-=w141-h101-n-k-no-nu','Brecksville Reservation is the largest urban park in the U.S. state of Ohio. Chippewa Creek flows through the 3,026-acre reservation, which is home to a section of the Buckeye Trail. The park supports a diverse set of ecosystems, featuring fields, a river plain, gorges, and a variety of forested areas', 'Brecksville Reservation', 'Park', 41.32200314607469, -81.61822898465867,'6AM - 11PM', 'true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipMTG-t-TFwx_PxvjnJMWxQvo7XTGcBgAdYYjFru=w141-h176-n-k-no-nu','Brookside Reservation was one of the City of Cleveland''s oldest neighborhood parks before its acquisition by Cleveland Metroparks in 1993.', 'Brookside Reservation', 'Park', 41.45025828052311, -81.72542266931738,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipNup1cID9DehKsqlxJHZQW-76YgUMt_f1aNFumz=w141-h118-n-k-no-nu','City-managed parks on & near Lake Erie, featuring a beach, fishing, trails & seasonal sports.', 'Euclid Creek Reservation', 'Park', 41.5623727840942, -81.53101496136527,'6AM - 10PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh5.googleusercontent.com/p/AF1QipNGvBjXThp3RN8RaaOWzCZMEy7e5cs15zPQuHST=w141-h101-n-k-no-nu','Wetland habitat offering walking trails, a nature center, picnic areas & bird-watching.','Garfield Park Reservation', 'Park', 41.43113677975311, -81.6048765,'6AM - 11PM', 'true','false','','true', 4.5);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.google.com/maps/uv?pb=!1s0x8830c3574cde8403%3A0x282c0e379b7d7411!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMhgzvbJgCS-9BRxWa29p0MwU2EoGWQCnHqQ4PL%3Dw130-h87-n-k-no!5sHinckley%20Reservation%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipMhgzvbJgCS-9BRxWa29p0MwU2EoGWQCnHqQ4PL&hl=en&sa=X&ved=2ahUKEwibt4iv96H-AhUokIkEHTM3AugQ7ZgBKAF6BAgUEAM#','At the southern end of Cleveland Metroparks is Hinckley Reservation, the site of the nationally-known annual Return of the Buzzards.','Hinckley Reservation', 'Park', 41.22788105299173, -81.70110085397604,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPyc8QW63h1HUnO-Wt93OiF7aMMnN-BiRNQ6725Htxag&s','103-acre park on Lake Erie offers fishing, swimming, trails, picnic areas & an old water tower.','Huntington Reservation', 'Park',41.48667394919134, -81.93556837672118,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS7oyhI7TdYch4tDE1DJXfgQBOEmfrwKkvc8TXJUa_x4Sp1wTrT','From beaches to boat ramps, fitness trails to fishing piers, Lakefront Reservation is a true gem in the “Emerald Necklace”','Lakefront Reservation', 'Park',41.58490088797798, -81.56945743216576,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1pd1XZYff5y73VLpn-iivoJqWYdu3Z8eUGtIgbXXFsQ&s','Year-round destination for outdoor recreation, including hiking, swimming, boating & sledding.','Mill Stream Run Reservation', 'Park',41.312243219970995, -81.79313539261078,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNLtpidmVxf-Vq0zIQ0NitPHl1u0dCHxpsJe-up=s680-w680-h510','Wildlife-rich area with woodland & wetland trails to Buttermilk Falls Preserve & Squire''s Castle.','North Chagrin Reservation','Park', 41.56823603777238, -81.42993244602395,'6AM - 11PM', 'true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.google.com/maps/uv?pb=!1s0x8830e519b43b3193:0xbd3cd98c20e326ca!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipNx0NuKrxvY3iNJ0bPrECGDT91dIrqorE1YTunm%3Dw260-h175-n-k-no!5sOhio+Erie+Canal+Reservation+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipNx0NuKrxvY3iNJ0bPrECGDT91dIrqorE1YTunm&hl=en&sa=X&ved=2ahUKEwjYhJ_LgaL-AhXpjYkEHWdgAHUQ7ZgBKAB6BAgWEAI','The Ohio & Erie Canal Reservation stretches through the villages of Cuyahoga Heights and Valley View and other surrounding communities.','Ohio & Erie Canal Reservation','Park', 41.45127721424245, -81.68395711190773,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.google.com/maps/uv?pb=!1s0x8830ecbaae14c8b5%3A0xffa0aa168e564b57!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipN2Yr84vz_g6vpogil_y5PN3MABnqk4igvThbya%3Dw260-h175-n-k-no!5sRocky%20River%20Reservation%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipN2Yr84vz_g6vpogil_y5PN3MABnqk4igvThbya&hl=en&sa=X&ved=2ahUKEwi--7XjgqL-AhWvtYkEHbklBlcQ7ZgBKAB6BAgaEAI#','Woodland park split by the Rocky River, offering hiking trails with bird & deer sightings.','Rocky River Reservation','Park', 41.413009411322115, -81.88359894094437,'6AM - 11PM', 'true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://vacationidea.com/pix/img25Hy8R/articles/cleveland-parks_g16_mobi.jpg','South Chagrin Reservation is an expansive reservation in Cleveland''s Moreland Hills, Bentleyville, and Solon suburbs, located along the banks of the Chagrin River, a designated National Scenic River.','South Chagrin Reservation','Park', 41.42362578576614, -81.42152405767065,'6AM - 11PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.clevelandmetroparks.com/getmedia/64298c7c-068c-4b36-b08b-3b4633e313ac/Washington_Res_Carousel_03.ashx?h=200&w=200&mode=crop&scale=both','Located in Newburgh Heights the 59-acre Washington Reservation is Cleveland Metroparks 15th reservation','Washington Reservation','Park',41.456715538790064, -81.66035021534424,'6AM - 11PM', 'true','false','','true', 4.5);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipOzy8ZabCmsD2X6IcnI-8shkyueA49vsUibhYzB=s680-w680-h510','Upland & wetland landscape offers trails, picnic areas & a building with water management workshops.','West Creek Reservation','Park',41.390972108310834, -81.69410836932029,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://upload.wikimedia.org/wikipedia/commons/a/a6/Gordon_Park_01_-_Cleveland.jpg','A grand bathhouse catered to the multitudes who crowded onto the park''s beach, and the city also provided facilities for boaters, fishermen, and picnickers.','Gordon Park','Park',41.53631274117859, -81.63462181534132,'6AM - 11PM', 'true','false','','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipO7DND26iw0hPlt-WA2XnBwOk9DwIxbNe_qEEVN=s680-w680-h510','The Cleveland Mall is a landscaped public park in downtown Cleveland, Ohio. One of the most complete examples of City Beautiful design in the United States, the park is a historic site listed on the National Register of Historic Places.','The Cleveland Mall','Park',41.503535931803825, -81.69390698465868,'6AM - 6AM', 'true','false','','true', 4.3);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.universitycircle.org/files/locations/slider/cleveland-cultural-gardens-rockefeller-park-82.jpg','Rockefeller Park is a city park named in honor of oil magnate John D. Rockefeller Sr., located in Cleveland, Ohio. Part of the Cleveland Public Parks District, Rockefeller Park is immediately adjacent Wade Park to the southeast, and across Euclid Ave on its northwest border.','Rockefeller Park & Greenhouse','Park',41.52479521515105,-81.62351059261077,'10AM - 4PM', 'true','false','','true', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://www.fieldoperations.net/fileadmin/fo_uploads/projects/Public_Square/FO_PUBLIC_SQUARE_25_Aerial_at_Night_Aerial_Agents.jpg','Cleveland Public Square is downtown Cleveland''s premier outdoor venue. The Square is host site to hundreds of events that happen year round.','Cleveland Public Square','Park',41.499937278506565, -81.69356890839835,'6AM - 11PM', 'true','false','','true', 4.5);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://live.staticflickr.com/1052/1463448807_4b96462eb0_b.jpg','Willard Park is the home of the “Free Stamp” and otherwise just something you pass through on the way to the Browns Stadium or the Rock Hall','Willard Park','Park',41.515641838491774, -81.69460627186443,'6AM - 6AM', 'true','false','','true', 4.4);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNyn88VznEXrEtOfDLNK_YhX_HaW6uBFzUVZjo4=s680-w680-h510','Cuyahoga Valley National Park lies along the Cuyahoga River between the Ohio cities of Cleveland and Akron. The Ohio and Erie Canal Towpath Trail is a restored section of the canal''s original towpath. In the park’s north, the Canal Exploration Center details the 19th-century waterway’s history. Towering Brandywine Falls is one of several waterfalls. The Cuyahoga Valley Scenic Railroad runs through the park.','Cuyahoga Valley National Park','Park',41.28533967682155, -81.56918529092219,'6AM - 6AM', 'true','false','','true', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNe975Q08bgvZ6G6KkXBL4pVcKeRcKJtl2Y1NHn=s680-w680-h510','31-acre lakefront park featuring a seasonal pool, bandshell, skatepark, plus sport courts & fields.','Lakewood Park','Park',41.49549989808099, -81.79724143068263,'6AM - 11PM', 'true','false','','true', 4.8);



INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipODUzkhOXfdTQa_WX2JEbJBktSMYjOs-X4tD93i=s680-w680-h510','Fine Dining · Cuisines. Contemporary Italian, Seafood, Mediterranean','Acqua Di Luca','Restaurant',41.500479861381834, -81.69815119261078,'5PM - 10PM', 'true','false','Seafood','false', 4.3);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNMJQ3GlGgipcguALfbiHt42k7duoDVFnboy5ii=s680-w680-h510','Sleek Mediterranean market/eatery for gourmet meats & cheeses, plus tapas, wine & cocktails.','Astoria Cafe and Market','Restaurant',41.485755960751725, -81.72495220738922,'11AM - 9PM', 'true','false','Mediterranean','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNNemLedWSk9d2WBe4HvLuJ2nEVZaGDqVnptGj-=s680-w680-h510','Cleveland Bagel Co. bagels are chewy, delicious, Cleveland-style bagels. Pair them with one of our schmears for the perfect breakfast, lunch or snack.','Cleveland Bagel Co.','Restaurant',41.502340580135446, -81.63527486931737,'6AM - 1PM', 'true','false','Bagel Shop','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipP81ywuqpI74y6me5rtyfMSe5EtTMWypWMaoHDK=s680-w680-h510','Buzzy, gothic bar filled with antiques & books, offering ambitious cocktails & vegan bites.','Cloak & Dagger','Restaurant',41.47997780783351, -81.68907091534132,'4PM - 12AM', 'false','false','Cocktail Bar','false', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipOysT_1LfvcDUFknSh2X4UCfCUiBRVyThFGW38i=s680-w680-h510','High-end French plates including meat & seafood options with upscale drinks served amid luxe decor.','Edwins Restaurant and Leadership Institute','Restaurant',41.484877361877444, -81.59179003807186,'5PM - 9PM', 'false','false','French Cuisine','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNHRTz7EbYY2jaMs-DK3CgigBQCC6l7cFZXmcya=s680-w680-h510','Funky hangout serving global small & large plates plus weekend brunch in a converted house.','Fat Cats','Restaurant',41.48437531773824, -81.68762236136527,'11AM - 9PM', 'true','false','Bar and Eatery','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNXe___phS8apLFf048wnbbPp3m2Q2x1V7Q9zOb=s680-w680-h510','Modern spot with colorful mosaic wall for specialty sushi & shabu-shabu, plus cocktails & beer.','Ginko','Restaurant',41.48234494004621, -81.68652703068263,'4PM - 10PM', 'true','false','Japanese Cuisine','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipP_gjHogxgphF5OhnWexDL-ImOt6_gzKQMCytnO=s680-w680-h510','Authentic Ethiopian and Eritrean cuisine made fresh and enhanced with seasonings native to Africa, using homemade recipes passed down for generations.','Habesha Ethiopian and Eritrean Restaurant','Restaurant',41.45154289745254, -81.8150753767066, '11AM - 8:30PM', 'true','false','East African Cuisine','false', 4.8);
		
INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNY06t14kNu8TT8ziAgSVW-J587Bq_U6a9VloBy=s680-w680-h510','Rustic-chic pizzeria serving NYC-style pies with inventive toppings in a renovated 1917 pub space.','II Rione','Restaurant',41.48745948041153, -81.73002483068264, '4PM - 10PM', 'true','false','Pizzaria','false', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNY06t14kNu8TT8ziAgSVW-J587Bq_U6a9VloBy=s680-w680-h510','Rustic-chic pizzeria serving NYC-style pies with inventive toppings in a renovated 1917 pub space.','II Rione','Restaurant',41.48745948041153, -81.73002483068264, '4PM - 10PM', 'true','false','Pizzaria','false', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipP27FrDa0H0XsBl79n5AcRdbOVt51Mp4pz_fhEI=s680-w680-h510','Upscale, contemporary French destination with patio seating, cheese courses & wine.','L''Albatros Brasserie & Bar','Restaurant',41.512140032944565, -81.60631536931736, '4PM - 10PM', 'true','false','French Cuisine','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNFR-qa_uAXLAPcnj2WY_-fZ1r7_Y1mlhEFz6VK=s680-w680-h510','La Plaza Taqueria, is your place to gather with your friends and enjoy some of the best Mexican Food around.','La Plaza Taqueria','Restaurant',41.47091354744581, -81.78581909261078, '8AM - 9PM', 'true','false','Supermarket Bakery','false', 4.5);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipOjlQzExPnffGq81CabVNUSRfgjqddCvf-tVeHZ=s680-w680-h510','We are an Eastern European delicatessen and bakery located in the Ohio City Firehouse in Cleveland''s Hingetown neighborhood.','Larder Delicatessen and Bakery','Restaurant',41.48997144523936, -81.71031348465866, '11AM - 6PM', 'true','false','Deli','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipP5ykBNvEqQgHnBvxHN_6ojoy5hcVEvKBB0y5mq=s680-w680-h510','Straightforward restaurant preparing handmade dumplings, classic soups & meatballs.','LJ Shanghai','Restaurant',41.512074172543485, -81.66898123068263, '11:15AM - 8PM', 'true','false','Chinese Cuisine','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipOutgHrneBFqO5s3Ln8BHRcYzWKeFlvvKK1In8K=s680-w680-h510','Cool, bi-level, industrial-chic BBQ spot with communal tables & a long bar with many bourbons.','Mabel''s BBQ','Restaurant',41.49965525374262, -81.69037568465868, '11:30AM - 9PM', 'false','false','BBQ Restaurant','true', 4.4);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipPp8afZ21rUVdZD5AkG2Mg8SkVnbhKIdSVItn1m=s680-w680-h510', 'Upscale chophouse for steaks, seafood & cocktails in an opulent historic bank building.','Marble Room Steaks and Raw Bar','Restaurant',41.500912623521394, -81.68876026931737, '5PM - 11PM', 'false','false','Steak house','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipPZc0cDZdpYTWxeYNXL7fwZV_C4fNRhaXxCEW4j=s680-w680-h510','Housemade ice cream in classic & unique flavors served in snug digs with counter & patio seats.','Mason''s Creamery','Restaurant',41.48095529601906, -81.71696937670659, '4PM - 9PM', 'true','false','Ice Cream','true', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNquIpgpw1K9pCTQGdns-eakuVYTbRPBGAgD2gR=s680-w680-h510','Italian fare & some Mediterranean dishes are presented in a quaint, muraled space with a full bar.','Mia Bella','Restaurant',41.509232788994936, -81.59788553068263, '4:30PM - 9:30PM', 'true','false','Italian Cuisine','false', 4.5);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipPug7jKpjk-PPg7MbaH7AzstSKPDO7AXqIDmpw_=s680-w680-h510','Hip, dimly lit cantina with wrestler decor, patio seating & creative, modern Mexican dishes.','Momocho','Restaurant',41.48461896523441, -81.70993114602395, '4PM - 9PM', 'true','false','Mexixan Cuisine','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipMTzZchjYcmiB9WWEmK5hcSgCTBYQArx2IlL0Eu=s680-w680-h510','Welcome to The Pompadour, a small plates restaurant and cocktail bar located two blocks from the beach in historic downtown Fairport Harbor','The Pompadour','Restaurant',41.75579083234098, -81.27689181534133, '5PM - 10PM', 'true','false','Small Plate Restaurant','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipML_aqMIIlKqLuoYWYX0zS-t8E-G89dqwR-hbel=s680-w680-h510','Sabor Miami Café. Caribbean, Mayan, Garifuna and Latin Eats! Cafe and Art Gallery Home of the TropChop and Cuban Colada. Find your flavor!','Sabor Miami Cafe and Gallery','Restaurant',41.424853730642724, -81.69753677670658, '11:30AM - 6PM', 'true','false','Cafe and Galleria','false', 4.7);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipMl7ZEkkDcqbfFMxmj9EwP0cblkIxkUgfB3RomD=s680-w680-h510','A casual, rustic-chic destination for globally inspired small plates plus cocktails, beer & wine.','Salt','Restaurant',41.48530615892665, -81.81963359204791,'5PM - 10PM', 'true','false','Small Plates Restaurant','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipPcnXlPY90EbzjElZ6EwIFbRxR-Jk2YZSSW0K4T=s680-w680-h510','Low-key spot specializing in pho noodle soups & other traditional Vietnamese fare, plus bubble tea.','Superior Pho','Restaurant',41.51100783259005, -81.66975673068264,'10:30AM - 8PM', 'true','false','Vietnamese Cuisine','false', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipPiZ6BjievFpjszr_P1lqfZ38B0WLm4CADB3pzr=s680-w680-h510','We''re Thyme X Table. A sweet little spot tucked away in Bay Village. Our motto is simple: Good food. Good drinks. Good friends','Thyme Table','Restaurant',41.47994981999478, -81.92057095397604,'5PM - 9PM', 'true','false','Fine Cuisine','false', 4.8);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipM-oxDGrnLet9C6TgJ10H5s8tcxESxQwiL_Hl_8=s680-w680-h510','Bi-level, contemporary eatery serving inventive pizzas made with seasonal ingredients.','Vero Pizza Napoletana','Restaurant',41.5016933440239, -81.59380566136527,'5PM - 9PM', 'true','false','Pizzaria','false', 4.6);

INSERT INTO landmark (landmark_img_url, landmark_description, landmark_name, landmark_type, landmark_latitude, landmark_longitude, hours_of_operations, kid_friendly, admission, restaurant_type, is_outdoor, landmark_rating)
VALUES ('https://lh3.googleusercontent.com/p/AF1QipNvNs2Ht3vMGOX2VRE04zXxEPyzqcSfKKq9v5yE=s680-w680-h510','Quirky tea shop with beverages such as smoothies & shakes, plus Mediterranean-inspired nibbles.','Algebra Tea House','Restaurant',41.50591026976114, -81.59983844602397,'10AM - 9PM', 'true','false','Mediterranean Restaurant','false', 4.6);
