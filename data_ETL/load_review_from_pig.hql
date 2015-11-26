CREATE EXTERNAL TABLE yuan_yelp_review_not_orc(
    review_id String,
    business_id String,
    user_id String,
    review_stars int, 
    review_date String, 
    review_text String,
    type String,
    votes_funny int,
    votes_useful int,
    votes_cool int
    )
COMMENT 'intermediate non orc table, DATA ABOUT reviews on yelp'
ROW FORMAT
DELIMITED FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n';

LOAD DATA INPATH 'hdfs:///user/xiaomaogy/output/json_review_table' OVERWRITE INTO TABLE yuan_yelp_review_not_orc;


CREATE EXTERNAL TABLE yuan_yelp_review(
    review_id String,
    business_id String,
    user_id String,
    review_stars int, 
    review_date String, 
    review_text String,
    type String,
    votes_funny int,
    votes_useful int,
    votes_cool int
    )
COMMENT 'DATA ABOUT reviews on yelp'
ROW FORMAT
DELIMITED FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
STORED AS ORC;

INSERT OVERWRITE TABLE yuan_yelp_review SELECT * FROM yuan_yelp_review_not_orc;
