START TRANSACTION;

DROP TABLE IF EXISTS landmark CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS itinerary;

CREATE TABLE landmark (
landmark_id serial,
landmark_img_url varchar (10000)
landmark_description varchar (100000) NOT NULL,
landmark_name varchar (1000) NOT NULL,
landmark_type varchar (1000) NOT NULL,
landmark_latitude decimal (16,14) NOT NULL,
landmark_longitude numeric (16,14) NOT NULL,
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



