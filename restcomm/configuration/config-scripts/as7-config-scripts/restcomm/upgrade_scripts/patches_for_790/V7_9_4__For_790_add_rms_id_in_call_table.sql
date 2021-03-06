-- SQL Script for MySQL/MariaDB to update DB with the schema changes for issue #1104
-- #Author: Maria Farooq

-- #To run the script use mysql client:
-- #mysql -u yourusername -p yourpassword yourdatabase < sql_update_script.sql

USE ${RESTCOMM_DBNAME};
DELIMITER //
CREATE PROCEDURE updateProcedure()
 BEGIN
 SELECT IFNULL(column_name, '') INTO @colName794
 FROM information_schema.columns
 WHERE table_schema='${RESTCOMM_DBNAME}'
 AND table_name = 'restcomm_call_detail_records'
 AND column_name = 'ms_id';

IF @colName794 IS NULL THEN
CREATE TABLE temp_table LIKE restcomm_call_detail_records;
ALTER TABLE temp_table ADD ms_id VARCHAR(34);
INSERT INTO temp_table
  (
    sid,
    parent_call_sid,
    date_created,
    date_updated,
    account_sid,
    sender,
    recipient,
    phone_number_sid,
    status,
    start_time,
    end_time,
    duration,
    price,
    direction,
    answered_by,
    api_version,
    forwarded_from,
    caller_name,
    uri,
    call_path,
    ring_duration,
    instanceid,
    conference_sid,
    muted,
    start_conference_on_enter,
    end_conference_on_exit,
    on_hold
  ) SELECT
  sid as sid,
  parent_call_sid as parent_call_sid,
  date_created as date_created,
  date_updated as date_updated,
  account_sid as account_sid,
  sender as sender,
  recipient as recipient,
  phone_number_sid as phone_number_sid,
  status as status,
  start_time as start_time,
  end_time as end_time,
  duration as duration,
  price as price,
  direction as direction,
  answered_by as answered_by,
  api_version as api_version,
  forwarded_from as forwarded_from,
  caller_name as caller_name,
  uri as uri,
  call_path as call_path,
  ring_duration as ring_duration,
  instanceid as instanceid,
  conference_sid as conference_sid,
  muted as muted, 
  start_conference_on_enter as start_conference_on_enter,
  end_conference_on_exit as end_conference_on_exit,
  on_hold as on_hold
  FROM restcomm_call_detail_records;
  DROP TABLE restcomm_call_detail_records;
  ALTER TABLE temp_table RENAME restcomm_call_detail_records;
END IF;
END //

DELIMITER ;
CALL updateProcedure();
drop procedure updateProcedure;
