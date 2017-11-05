set debug 'on'
set job.name 'crossjoin job'
set default_parallel 60

DEFINE DUPLICATE(in) RETURNS out
{
        $out = FOREACH $in GENERATE *;
};

A1 = LOAD '/hive/warehouse/hivesampletable' AS (clientid:chararray,querytime:chararray,market:chararray,deviceplatform:chararray,devicemake:chararray,devicemodel:chararray,state:chararray,country:chararray,querydwelltime:double,sessionid:long,sessionpagevieworder:long);

A2 = DUPLICATE(A1);

B = CROSS A1, A2;

STORE B INTO '/tmp/crossjoin' USING PigStorage(',');
