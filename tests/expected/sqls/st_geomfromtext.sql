drop table if exists test_table;
create table test_table (geo text);
copy test_table from '@path@/data/geomfromtext.csv' DELIMITER '|' csv header;

\o @path@/expected/results/st_geomfromtext.out
select st_astext(st_geomfromtext(geo)) from test_table;
\o
