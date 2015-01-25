-- Database: wind

-- DROP DATABASE wind;

CREATE DATABASE wind
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'pl_PL.UTF-8'
       LC_CTYPE = 'pl_PL.UTF-8'
       CONNECTION LIMIT = -1;
GRANT CONNECT, TEMPORARY ON DATABASE wind TO public;
GRANT ALL ON DATABASE wind TO postgres;
GRANT ALL ON DATABASE wind TO admin;


-- Database: wind

-- DROP DATABASE wind;


CREATE TABLE produkt_status
(
id SERIAL NOT NULL unique,
opis text NOT NULL,
aktywna boolean NOT NULL,
widoczna boolean NOT NULL
);

CREATE TABLE dluznik_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE firma_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE dluznik_2_produk_rola
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE list_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE list_status
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE rodzaj_adres
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE zadluzenie_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

-- --------------------------------------------------------------------------------------------------------------------------------------- 


CREATE TABLE adres
(
id  SERIAL NOT NULL unique,
kraj text NOT NULL,
miasto text NOT NULL,
ulica text NOT NULL,
nr_domu text NOT NULL,
nr_lokalu int8,
kod_pozctowy text NOT NULL,
id_rodzaj_adres int8 references rodzaj_adres(id),
PRIMARY KEY ("id"));

CREATE TABLE zleceniodawca
(
id SERIAL NOT NULL unique,
nazwa text NOT NULL,
rachunek text NOT NULL,
id_adres int8 NOT NULL references adres(id),
PRIMARY KEY ("id"));

CREATE TABLE komornik
(
id  SERIAL NOT NULL unique,
imie text NOT NULL,
nazwisko text NOT NULL,
id_adres int8 references adres(id),
nr_konta int8 NOT NULL,
PRIMARY KEY ("id"));

CREATE TABLE sad
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
wydzial text NOT NULL,
PRIMARY KEY ("id"));



CREATE TABLE produkt 
(
id  SERIAL NOT NULL unique,
id_zleceniodawca int8 NOT NULL,
data_start date NOT NULL,
data_stop date NOT NULL,
nr_rachunku_wplat text NOT NULL,
id_komornik int4 references komornik(id),
id_status int4 references produkt_status(id),
id_sad int8 references sad(id),
sygnatura_sadowa text,
PRIMARY KEY (id));

CREATE TABLE dluznik
(
id  SERIAL NOT NULL unique,
dluznik_typ int4 references dluznik_typ(id),
id_adres int8 references adres(id),
PRIMARY KEY ("id"));    

CREATE TABLE dluznik_osoba
(
id  SERIAL NOT NULL unique,
imie text NOT NULL,
nazwisko text NOT NULL,
pesel text NOT NULL,
id_adres int8 references adres(id),
PRIMARY KEY ("id"));

CREATE TABLE dluznik_firma
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
regon text NOT NULL,
krs text NOT NULL,
firma_typ int4 references firma_typ(id),
PRIMARY KEY ("id"),
UNIQUE (regon, krs, nazwa));

CREATE TABLE dluznik_2_produkt
(
id  SERIAL NOT NULL unique,
id_produkt int8 NOT NULL,
id_dluznik int8 NOT NULL,
dluznik_2_produkt_rola int4 references dluznik_2_produkt_rola(id),
PRIMARY KEY ("id"),
UNIQUE (id_produkt));

CREATE TABLE list
(
id  SERIAL NOT NULL unique,
id_dluznik int8 references dluznik(id),
id_typ_list int8 references list_typ(id),
id_list_status int8 references list_status(id),
id_adres int8 NOT NULL,
PRIMARY KEY ("id"));



CREATE TABLE faktura
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
data_platnosci date NOT NULL,
data_wymagalnosci date NOT NULL,
id_produkt int8 references produkt(id),
kwota_calkowita int8 NOT NULL,
kwota_pozostala_do_wplaty int8 NOT NULL,
id_typ_zadluzenia int4 references zadluzenie_typ(id));

CREATE TABLE wplata
(
id  SERIAL NOT NULL unique,
id_produkt int8 references produkt(id),
id_faktura int8 references faktura(id),
data date NOT NULL);



INSERT INTO `adres` (`kraj`,`miasto`,`ulica`,`nr_domu`,`nr_lokalu`,`kod_pozctowy`,`id_rodzaj_adres`) VALUES ("Senegal","Dehri","9712 At, Street",40,83,"MR3K 4TM",1),("Chad","Neunkirchen","9067 Varius. Street",57,5,"64-549",1),("Burundi","Vico del Gargano","Ap #338-3131 Lectus, Avenue",8,59,"11101",2),("Ukraine","Clauzetto","284-5493 Posuere Rd.",37,101,"473416",1),("Estonia","Hassan","809-8812 Sem. Road",11,30,"135348",1),("Saint Vincent and The Grenadines","Yellowknife","3342 A, Ave",74,111,"10907",2),("Martinique","Mabompr�","121-2231 Porttitor Ave",61,126,"8723",1),("Senegal","Saint-Martin","2857 Vel, Av.",65,104,"11012",1),("Antarctica","Cerami","210-8839 Vestibulum Avenue",28,36,"1955CH",2),
("Thailand","Izmir","5867 Sollicitudin Rd.",32,94,"720121",1),("Kyrgyzstan","Valda","P.O. Box 929, 2277 Etiam Rd.",26,75,"79375",1),("Malta","Bandırma","Ap #796-7617 Pede. St.",30,115,"9958",2),("Bonaire, Sint Eustatius and Saba","Fort Resolution","P.O. Box 883, 350 Faucibus. Avenue",43,109,"64561-076",2),("New Zealand","Goes","605-197 Porttitor Av.",10,105,"364224",1),("Belgium","Mobile","P.O. Box 675, 2684 Ut, St.",36,116,"23156",1),("Colombia","Worthing","4108 Suspendisse Road",3,49,"GO8 1FO",1),("Christmas Island","Gebze","8745 Dictum Street",20,98,"5574",2),("Tokelau","Cavaion Veronese","3630 Nonummy St.",25,23,"20023",1),("Northern Mariana Islands","Bansberia","Ap #798-6146 Gravida Road",57,50,"61321",1),("Norway","Grado","5874 Leo. St.",66,15,"46138",1),("Pakistan","Tourinnes-Saint-Lambert","P.O. Box 644, 7956 Arcu. St.",59,91,"9972KD",1),("United Arab Emirates","Leke","P.O. Box 766, 7107 Vestibulum St.",16,3,"89130",1),("Cook Islands","Sens","116-9707 Nunc St.",2,134,"97-545",2),("San Marino","Kapuskasing","686-8241 Suspendisse St.",2,68,"7849",1),("Sweden","San Pedro","Ap #283-7436 Ac Rd.",1,47,"78-287",2),
("Uzbekistan","Karnal","682-3824 Quam St.",6,2,"8770RC",1),("Macao","Luttre","Ap #485-3832 Tempus Rd.",24,97,"Y3G 4B1",2),("Croatia","Estevan","Ap #958-7675 Magna Street",74,131,"62460",1),("Saint Pierre and Miquelon","Anzegem","7048 Ligula. St.",73,23,"29198",1),("Saudi Arabia","Ceyhan","Ap #374-7102 Phasellus Street",35,65,"83751",1),("Equatorial Guinea","Avennes","416-5805 Nulla St.",1,57,"52391",1),("Qatar","Aurangabad","P.O. Box 320, 4239 Non Rd.",3,146,"6955",1),("Mauritania","Barddhaman","146-5375 Pede Road",52,68,"6461",2),("Oman","Alcorcón","Ap #913-5635 Ut St.",44,49,"74147",1),("Bermuda","Sint-Lambrechts-Herk","Ap #163-2795 Tincidunt St.",66,3,"BO4 9OR",2),("Solomon Islands","Edinburgh","876-1380 Ipsum Avenue",61,113,"70811",2),("Malawi","Wetaskiwin","2802 Euismod Rd.",59,60,"3029",1),("Cayman Islands","Nicolosi","7058 Parturient Rd.",53,127,"10434",2),("Pitcairn Islands","Balfour","7052 Imperdiet Av.",77,27,"1500",1),("Maldives","Strausberg","108-9509 Tortor. St.",61,93,"94-554",1),("Reunion","Jasper","7781 Magna. Ave",22,38,"91483",1),("Micronesia","Hof","725-7830 Accumsan Ave",6,69,"549433",2),
("Lesotho","Market Drayton","745-3459 Turpis Ave",44,132,"32615",1),("Mali","Smoky Lake","5447 Bibendum Av.",73,65,"59942",1),("Mauritania","Mount Isa","811-4762 Cum Rd.",75,80,"1044VG",2),("Mongolia","Valleyview","Ap #446-7194 Euismod Av.",25,142,"31511",1),("Tanzania","Weyburn","Ap #337-5121 Orci, Avenue",34,122,"466634",2),("Honduras","Attimis","8050 Ut Avenue",38,139,"3006",2),("Uruguay","Penrith","931-5931 Mauris St.",12,83,"89951-756",1),("Virgin Islands, United States","Dehradun","2441 Nec St.",48,141,"94218",1),("Cocos (Keeling) Islands","Launceston","P.O. Box 404, 3503 Neque. Rd.",3,66,"0845",1),("Iran","Shawinigan","3541 Dapibus Ave",30,104,"11002",1),("Thailand","Mesoraca","521-1642 Quis Av.",59,30,"73-580",1),("San Marino","Dutse","9323 Nunc Avenue",34,107,"00858",2),("Samoa","Grande Cache","P.O. Box 830, 6579 Sodales. St.",63,145,"3281",2),("Virgin Islands, United States","Urbe","P.O. Box 277, 6782 Ligula Av.",51,145,"71654",1),("Moldova","Kempten","Ap #597-3236 Eget Ave",53,8,"X3S 4P8",2),("Indonesia","Saint-Rhémy-en-Bosses","P.O. Box 453, 9282 Luctus Rd.",51,112,"03-800",2),
("Guinea","Glabais","941-7907 Habitant Road",72,36,"78-651",1),("Bahrain","Sart-Dames-Avelines","Ap #672-7679 Mauris St.",75,101,"3644NB",2),("Timor-Leste","East Gwillimbury","766-7225 Purus. St.",72,126,"0620",1),("Slovenia","Daly","P.O. Box 939, 4105 Arcu. Av.",49,145,"6631",1),("Mauritius","Ponoka","872-1572 Gravida Ave",42,27,"87927",2),("Namibia","Miramichi","9255 Aliquet Road",72,100,"95722",1),("Belarus","Jamshedpur","Ap #843-9674 Mauris St.",63,133,"10308",2),("Hong Kong","Tezze sul Brenta","P.O. Box 345, 1993 Cursus. Road",45,130,"30111",1),("Guernsey","Créteil","Ap #188-2648 Et Road",33,76,"11210",2),("Mongolia","Blind River","2120 Vivamus Avenue",2,6,"WD8F 7KT",1),("India","Tulita","Ap #645-2982 Venenatis Road",26,94,"31845",1),("Virgin Islands, British","Landau","Ap #292-9005 Curae; Rd.",65,20,"82605",1),("Argentina","Gistel","6720 Ut Ave",36,45,"303832",1),("Bahamas","Tillet","999-2699 Non Avenue",76,74,"32445",2),("Chile","Blue Mountains","2461 Cras Av.",14,63,"285876",1),("Barbados","Veraval","2632 Faucibus Street",42,73,"379233",1),("Guinea","Radicofani","269-8659 Ornare Avenue",51,147,"1673",2),
("Namibia","Birmingham","Ap #855-3273 Vel Rd.",75,146,"82378",2),("Bahamas","Dudley","6800 Montes, Avenue",64,145,"32781",2),("Nicaragua","Saint-G�ry","537-850 Quis St.",38,10,"66-357",1),("Holy See (Vatican City State)","Bihar Sharif","8820 Pharetra, Road",65,38,"86512-248",1),("Virgin Islands, British","Neustadt am R�benberge","1942 Sodales Avenue",40,50,"9209",2),("India","Villers-la-Bonne-Eau","Ap #943-785 Dictum St.",11,42,"71259",1),("Japan","Compiano","Ap #109-9376 Ligula Rd.",4,57,"K30 4TW",1),("Uzbekistan","Roxburgh","Ap #526-3380 Nisi Ave",40,140,"B5D 4CL",1),("Angola","Hartford","P.O. Box 503, 2265 Porttitor Ave",37,86,"79795",1),("Norfolk Island","Barbania","Ap #628-9105 Purus St.",78,117,"826984",1),("Kazakhstan","Kobbegem","Ap #448-815 Dolor. Ave",8,104,"1645",1),("Reunion","Wichelen","1537 Dictum Street",49,70,"22502",1),("Pakistan","Souvret","P.O. Box 711, 5894 Donec Avenue",7,17,"716027",2),("Martinique","Bard","Ap #916-9302 Pharetra. St.",4,115,"885963",1),("Faroe Islands","Miami","Ap #342-9214 Nunc Street",51,136,"8562",1),("Turkmenistan","Chippenham","P.O. Box 665, 6164 Quam Ave",27,111,"5952",1),
("Netherlands","Warspite","Ap #561-4872 Dolor Rd.",14,102,"38-278",2),("Algeria","Vico del Gargano","P.O. Box 723, 8127 Dictum. Av.",60,128,"1671VZ",2),("Burundi","Spiere","9881 Praesent Rd.",73,74,"40964-625",1),("Viet Nam","Thames","Ap #630-9735 Ut Road",58,64,"85432",1),("Argentina","Solapur","Ap #389-4788 Risus. Road",10,98,"13544",2),("Norway","Anantapur","P.O. Box 182, 8773 Fusce Avenue",54,94,"19239-902",1),("Svalbard and Jan Mayen Islands","Tarsia","Ap #260-7445 Mauris Road",10,57,"7221",1),("Sweden","Purnea","9711 Nulla Street",68,146,"7891",2),("South Sudan","Cairns","4238 Adipiscing. Road",63,60,"2521",1);

INSERT INTO `zleceniodawca` (`nazwa`,`rachunek`,`id_adres`) VALUES ("Montes Corporation","IS747435457249193976442933",2),("Ridiculus Mus Donec LLP","LU316808653543064830",5),("Dictum Eu LLP","CY89601535047803837823450337",2),("Nibh Dolor Corporation","GB90FJNA04702724620810",1),("At Egestas A Associates","LV09SCEK8131216405249",4);

INSERT INTO `komornik` (`imie`,`nazwisko`,`id_adres`,`nr_konta`) VALUES ("Courtney","Burke",81,"DO81364907245270117443167262"),("Ashton","Duran",65,"KW7441065339543671038655609247"),("Hamish","Bates",36,"SK7724347296058311923491"),("Jermaine","Donovan",59,"CH0929449980182911213"),("Chadwick","Mullen",60,"SE4413951663057564785082"),("Alec","Carpenter",32,"CH5681428309328530055"),("Orlando","Yates",89,"BE45111730536756"),("George","Fowler",94,"KW8428800164013921395995705525"),("Brett","Byers",66,"IL498911575924901986326"),("Jaquelyn","Burnett",11,"PT91825618399942289457689"),("Samson","Sampson",20,"DO23742821396534317680236784"),("Jeremy","Buckley",42,"NO8376876586805"),("Kirk","Wells",45,"RO46TVGN8558048260718719"),("Yoko","Mueller",67,"VG6699766361391922210906"),("Edan","Meyer",77,"TN9082654079196425846702"),("Justin","Solomon",9,"VG4433490690515865245583"),("Sybil","Oliver",35,"PT87257511720996677594085"),("Darrel","Hawkins",34,"VG6227135745484307659258"),("Autumn","Long",10,"IE33EHMA60253545267743"),("Elmo","Deleon",36,"IE19UUJO86285413219536"),("Veda","Doyle",96,"DK7137366562918723"),
("Henry","Carey",67,"SK3842059797611102848842"),("Lysandra","Miller",50,"GL5681581688449641"),("Kiayada","Figueroa",71,"GI85NNDF356937048078298"),("Shana","Hart",83,"SI63485979661468565"),("Hope","Mayer",19,"MD5561292811348543286577"),("Uta","Merritt",100,"BH02436397218864802497"),("Tatum","Tyler",41,"PK1745748897924558194900"),("Hoyt","Preston",27,"BA277988055216233703"),("Noah","Summers",32,"RO09QFIC8505415657048357"),("Blair","Hurst",21,"NO4558078084586"),("Jasper","Martinez",68,"BG15HKPG85859817108537"),("Georgia","Klein",27,"PS050755580432880561143156202"),("Signe","Jones",84,"AD5175795798660515600927"),("Quemby","Hendrix",65,"MK61164557999526239"),("Elijah","Meadows",63,"TR207880058223320529808945"),("Zahir","Perry",13,"MD6139092996279634240439"),("Rooney","Ware",53,"AL20846475286190169101127602"),("Margaret","Palmer",92,"PS711459430286546940867318266"),("Cameron","Rivers",22,"IE70NRYN82573111148793"),("Alfreda","Mckinney",27,"KW9819325313839754705812817808"),("Rinah","Burks",60,"NO4021685598389"),("Ifeoma","Pope",18,"HR0614458417709863839"),
("Christine","Lester",49,"CY73290596671038180878567546"),("Roanna","Hale",41,"GE04528939199056644043"),("Ezekiel","Hahn",33,"BE17143416349583"),("Candice","Matthews",47,"GB45HFOV07246976553157"),("Ryan","Dillon",51,"IL752508435133230970984"),("Kareem","Strong",76,"CY58554664697132500712623235"),("Nyssa","Ferguson",34,"CR8560301672077822596"),("Sylvester","Bradford",61,"NL47NLEY4083183649"),("Stone","Puckett",22,"KW6958906487386721557218089288"),("Dakota","Sampson",29,"BH88684476622970171721"),("Justina","Robbins",59,"KW8333420346680432853127326238"),("Madaline","Farrell",33,"MK78083251979003838"),("Gail","Robbins",22,"GL3950779562780877"),("Lewis","David",31,"IL038294923176148360111"),("Ali","Sargent",30,"PL38965032556694333212353522"),("Dorothy","Tyson",13,"CH3936711389833290518"),("Alika","Taylor",88,"GR6737277846545385478688214"),("Carolyn","Stephens",15,"SI91457524178404270"),("Isabella","Melendez",44,"FR7428609406207234065369736"),("Lenore","Buckley",33,"MU6577082511784606736920133281"),("Kylan","Guthrie",20,"SM6476935757450569738907090"),
("Karyn","Kline",96,"IS486462284536327882471654"),("Katell","Mendez",58,"BG64GOSJ58693256685075"),("Nerea","Sweeney",92,"GL4077217094320336"),("Ethan","Francis",76,"CZ5338657057416918797286"),("Gareth","Brady",48,"MR0796686849593399854486272"),("Tanek","Petty",16,"PK5817557220842685073849"),("Charlotte","Hurley",68,"BE44383837565959"),("Kimberly","Keith",95,"BA068530312669428221"),("Kuame","Porter",31,"AD6695832357291170538594"),("Rachel","Faulkner",40,"LB24761057727028998035146166"),("Kimberly","Mcintyre",43,"DE87260622605112402362"),("Kirsten","Reyes",53,"NL88VYQZ0662620801"),("Kaye","Carson",32,"AZ73478934421764449554243999"),("Ina","Hayes",9,"MR5033377306608632251333207"),("Bertha","Sears",35,"AZ71146836626955550743758514"),("Linda","Washington",14,"MR4493476234997816852236676"),("Steel","Jacobson",42,"FR1117347802804965375147209"),("Maxine","Underwood",57,"GI25NMVZ505303692341473"),("Scarlet","Summers",24,"DK8852630662355225"),("Howard","Powers",89,"MT62PKMT19027094166617580360907"),("Mercedes","Oneal",43,"CY36004474431358553169289755"),
("Basil","Howard",53,"TR477467595228918966349939"),("Tad","Riggs",29,"SI22914699665259482"),("September","Rhodes",77,"SE2916281741657305652234"),("Camille","Rivas",60,"LT865023349621171559"),("Martina","Huff",19,"PL26056389506902087836502428"),("Flynn","Vasquez",23,"CH9495241681056742598"),("Hamish","Mason",19,"TN5259771069449999722889"),("Sandra","Dyer",76,"MR0435036899810611437586641"),("Emily","Brennan",37,"SE2085244598174016111845");

INSERT INTO `sad` (`nazwa`,`wydzial`) VALUES ("Non LLP","424-3826 Sit Avenue"),("Risus Nulla Eget Ltd","Ap #475-5581 Neque. Road"),("Ornare Elit Elit Institute","586-6149 Vehicula St."),("Egestas Company","3222 In Street"),("Integer Id Magna Corp.","214-4018 Urna Rd."),
("Urna Vivamus Molestie Inc.","2907 Magna. Av."),("Gravida Molestie Ltd","216-9288 Velit Street"),("Lorem Fringilla Institute","P.O. Box 198, 4122 Semper Av."),("Aliquam Inc.","4041 Risus, St."),("Dapibus Gravida Associates","Ap #548-1565 Libero Avenue"),
("Tincidunt Institute","Ap #390-6969 Magna Av."),("Lorem Semper Auctor Consulting","240-6957 Nec Av."),("Arcu Foundation","699-3403 Malesuada St."),("Et PC","946-8058 Non St."),("At Velit Inc.","1241 Aliquam Avenue"),("Tempor Diam Industries","641-4890 Quis, St."),
("Sit Ltd","1069 Dolor Avenue"),("Sem Nulla Limited","Ap #801-7265 Non Ave"),("Imperdiet Nec Associates","766-4220 Non St."),("Quisque Ornare Tortor Limited","Ap #959-3636 A, Road");

INSERT INTO `produkt` (`id_zleceniodawca`,`data_start`,`data_stop`,`nr_rachunku_wplat`,`id_komornik`,`id_status`,`id_sad`,`sygnatura_sadowa`) VALUES (9,"29am31am","03pm31pm","ES1841296849119931270189",14,3,5,"Proin"),(6,"16pm30pm","31am31am","IS816907528576273120234081",5,1,9,"ante"),(7,"01am30am","05am30am","RS17986824938004570582",11,1,4,"turpis"),(10,"13pm31pm","24am28am","DE71922263188565535056",10,3,8,"augue"),(9,"08am31am","18pm31pm","NO1876991389609",1,3,9,"luctus"),
(5,"02am28am","30pm30pm","EE840857234426934602",10,2,7,"eu,"),(6,"08pm30pm","12pm31pm","ME69894975412806469457",20,2,3,"nunc"),(3,"23pm31pm","10pm30pm","PK4101464690009342142056",6,2,6,"nulla."),(9,"30am31am","11pm29pm","AE920746907836484971480",6,1,1,"sapien"),(8,"29pm30pm","05am30am","IE95OCUE67255634389495",11,2,10,"interdum."),
(9,"25pm31pm","22am30am","SK2964922802649445768211",8,1,5,"iaculis"),(7,"29am30am","27am31am","AL22798387821068077487971124",10,1,2,"convallis"),(9,"15pm31pm","24pm31pm","LI7369471245083674904",13,1,6,"Etiam"),(6,"15pm30pm","01am28am","BG17OTDM94269286363304",20,1,7,"lacus"),(8,"02pm30pm","14pm30pm","GR1562743447057890225267719",6,3,8,"amet"),
(5,"12am28am","10pm31pm","GR0964274570787941982724341",12,2,8,"interdum"),(5,"11pm31pm","23pm29pm","MD0919348126186745266279",13,2,9,"senectus"),(10,"04pm30pm","19pm30pm","NO4606893864581",12,3,5,"fermentum"),(6,"05am31am","24am31am","TR774896610550350168169002",10,2,9,"mi."),(5,"06am30am","01am28am","KZ753487984379677987",5,3,1,"dignissim");
odukt` (`id_zleceniodawca`,`data_start`,`data_stop`,`nr_rachunku_wplat`,`id_komornik`,`id_status`,`id_sad`,`sygnatura_sadowa`) VALUES (1,"17pm31pm","22pm31pm","SK3114198731935075597658",9,3,6,"Duis"),(2,"29am30am","27pm31pm","GR6444321863103999120724675",10,3,9,"aliquam"),(8,"04pm31pm","13pm30pm","MC8962468749420678899743543",19,3,10,"a,"),(8,"04am31am","22am31am","KZ708476311513805530",6,2,1,"vestibulum"),(8,"08am31am","31pm31pm","MT14WZFZ57093624534906210802849",17,1,8,"ipsum");




