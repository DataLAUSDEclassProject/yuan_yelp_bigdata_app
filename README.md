# yuan_yelp_bigdata_app

parse_review_json.pig is used to load the yelp_training_set_review.json file into Pig, then replace all the \n and \r with '*', then store the data into Hdfs and Hbase.

load_review_from_pig.hql is used to create the Hive table (ORC table and non-ORC table), then load the review data(generated above by parse_review_json.pig) first into non-ORC table, then insert into the ORC table to speed up future queries.

synchronize_hive_to_hbase.hql is used to create a table that is shared by Hive and HBase. 
