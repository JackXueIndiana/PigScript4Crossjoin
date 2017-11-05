CREATE TABLE if not exists `crossjointable_orc`(
  `clientid` string,
  `querytime` string,
  `market` string,
  `deviceplatform` string,
  `devicemake` string,
  `devicemodel` string,
  `state` string,
  `country` string,
  `querydwelltime` double,
  `sessionid` bigint,
  `sessionpagevieworder` bigint,
  `tclientid` string,
  `tquerytime` string,
  `tmarket` string,
  `tdeviceplatform` string,
  `tdevicemake` string,
  `tdevicemodel` string,
  `tstate` string,
  `tcountry` string,
  `tquerydwelltime` double,
  `tsessionid` bigint,
  `tsessionpagevieworder` bigint
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t'
STORED AS ORC
tblproperties ("orc.compress"="SNAPPY", "orc.stripe.size"="67108864","orc.row.index.stride"="50000");

INSERT OVERWRITE TABLE crossjointable_orc SELECT * from crossjoin_ext;
