https://postgis.net/workshops/postgis-intro/geometries.html
https://postgis.net/docs/ST_Collect.html
https://postgis.net/docs/using_postgis_dbmanagement.html
https://stackoverflow.com/questions/6961705/vim-delete-the-first-2-spaces-for-multiple-lines

my home: 34 01 41 N   118 17 42 W
CS dep:  34 01 10 N   118 17 22 W
CS585:	 34 01 16 N	  118 17 20 W
THH:	 34 01 19 N	  118 17 04 W
Leavy    34 01 18 N   118 16 59 W
village  34 01 31 N   118 17 05 W
marshall 34 01 07 N   118 17 08 W
Lyon     34 01 28 N   118 17 18 W
Fisher museum of art    34 01 07 N   118 17 15 W
Cromwell track field    34 01 19 N   118 17 16 W
Cinema of Arts    34 01 24 N   118 17 11 W
Doheny Memorial lib    34 01 12 N   118 17 01 W
Ogasawara plaza    34 01 09 N   118 17 26 W

<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://earth.google.com/kml/2.2">
<Document>
<Style id="z1">
<IconStyle><Icon><href>http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png</href></Icon></IconStyle>
</Style>
<Placemark>
<name>home</name>
<styleUrl>#z1</styleUrl>
<Point>
<coordinates>-118.1742,34.0141</coordinates>
</Point>
</Placemark>
<Placemark>
<name>CS dept</name>
<styleUrl>#z1</styleUrl>
<Point>
<coordinates>-118.1722,34.0110</coordinates>
</Point>
</Placemark>
<Placemark>
<name>CS585</name>
<styleUrl>#z1</styleUrl>
<Point>
<coordinates>-118.1720,34.0116</coordinates>
</Point>
</Placemark>
<Placemark>
<name>TTH</name>
<styleUrl>#z1</styleUrl>
<Point>
	<coordinates>-118.1704,34.0119</coordinates>
</Point>
</Placemark>
<Placemark><name>Leavy Lib</name>
<styleUrl>#z1</styleUrl>
<Point>
	<coordinates>-118.1659,34.0118</coordinates>
</Point>
</Placemark>
<Placemark>
<name>USC Village</name>
<styleUrl>#z1</styleUrl>
<Point>
	<coordinates>-118.1705,34.0131</coordinates>
</Point>
</Placemark>
<Placemark>
<name>Marshall</name>
<styleUrl>#z1</styleUrl>
<Point>
	<coordinates>-118.1708,34.0107</coordinates>
</Point>
</Placemark>
<Placemark><name>Lyon recreattion</name>
<styleUrl>#z1</styleUrl>
<Point>
	<coordinates>-118.1718,34.0128</coordinates>
</Point>
</Placemark>
<Placemark><name>Fisher musemum</name>
<styleUrl>#z1</styleUrl><Point><coordinates>-118.1715,34.0107</coordinates></Point>
</Placemark>
<Placemark><name>Cromwell track field</name>
<styleUrl>#z1</styleUrl><Point><coordinates>-118.1716,34.0119</coordinates></Point>
</Placemark>
<Placemark><name>Cinema of Art</name>
<styleUrl>#z1</styleUrl><Point><coordinates>-118.1711,34.0124</coordinates></Point>
</Placemark>
<Placemark><name>Doheny Memorial lib</name>
<styleUrl>#z1</styleUrl><Point><coordinates>-118.1701,34.0112</coordinates></Point>
</Placemark>
<Placemark>
<name>Ogasawara plaza</name>
<styleUrl>#z1</styleUrl>
<Point>
<coordinates>-118.1726,34.0109</coordinates>
</Point>
</Placemark>
</Document>
</kml>


--SELECT ST_AsText(ST_ConvexHull(
--
--            ST_GeomFromText('MULTIPOINT(
--							-118.2875889621171 34.02195096639696,
--							-118.2950497 34.0281516,
--							-118.2854769 34.0187152,
--							-118.2893380332525 34.02384467881572,
--							-118.2888755145379 34.02130831755486,
--							-118.2904828991954 34.0193122745498,
--							-118.2853664885601 34.02491355288966,
--							-118.2861790231339 34.02323439582364,
--							-118.2827866544105 34.02150385452134,
--							-118.2871407406807 34.01890301514963,
--							-118.2835739053385 34.02028984848046,
--							-118.2892501652446 34.01976498803835,
--							-118.2843549662237 34.0224166104442
--						   )')            )
--				);
--

create table school (name varchar, geom geometry);
insert into school values
	('cromwell field','POINT(-118.2875889621171 34.02195096639696)'),
	('home','POINT(-118.2950497 34.0281516)'),
	('Marshall business','POINT(-118.2854769 34.0187152)'),
	('Lyon recreation','POINT(-118.2893380332525 34.02384467881572)'),
	('CS585','POINT(-118.2888755145379 34.02130831755486)'),
	('Ogasawara plaza','POINT(-118.2904828991954 34.0193122745498)'),
	('USC village','POINT(-118.2853664885601 34.02491355288966)'),
	('Cinema Arts','POINT(-118.2861790231339 34.02323439582364)'),
	('Leavey lib','POINT(-118.2827866544105 34.02150385452134)'),
	('Fisher museum','POINT(-118.2871407406807 34.01890301514963)'),
	('Doheny Lib','POINT(-118.2835739053385 34.02028984848046)'),
	('CS dept','POINT(-118.2892501652446 34.01976498803835)'),
	('THH','POINT(-118.2843549662237 34.0224166104442)');

CREATE TABLE t (id TEXT, geom GEOMETRY);
INSERT INTO t VALUES
	('cromwell field','SRID=26910;POINT(-118.2875889621171 34.02195096639696)'),
	('Marshall business','SRID=26910;POINT(-118.2854769 34.0187152)'),
	('Lyon recreation','SRID=26910;POINT(-118.2893380332525 34.02384467881572)'),
	('CS585','SRID=26910;POINT(-118.2888755145379 34.02130831755486)'),
	('Ogasawara plaza','SRID=26910;POINT(-118.2904828991954 34.0193122745498)'),
	('USC village','SRID=26910;POINT(-118.2853664885601 34.02491355288966)'),
	('Cinema Arts','SRID=26910;POINT(-118.2861790231339 34.02323439582364)'),
	('Leavey lib','SRID=26910;POINT(-118.2827866544105 34.02150385452134)'),
	('Fisher museum','SRID=26910;POINT(-118.2871407406807 34.01890301514963)'),
	('Doheny Lib','SRID=26910;POINT(-118.2835739053385 34.02028984848046)'),
	('CS dept','SRID=26910;POINT(-118.2892501652446 34.01976498803835)'),
	('THH','SRID=26910;POINT(-118.2843549662237 34.0224166104442)');

CREATE TABLE grid_sampl (data TEXT, geom GEOMETRY);
INSERT INTO grid_sampl VALUES ('home','SRID=26910;POINT(-118.2950497 34.0281516)');

SELECT id,ST_Distance(t.geom,grid_sampl.geom)
FROM t,grid_sampl
order by st_distance
limit 4
