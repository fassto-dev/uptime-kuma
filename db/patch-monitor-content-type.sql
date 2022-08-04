-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
BEGIN TRANSACTION;

ALTER TABLE monitor
    ADD http_content_type VARCHAR(255) DEFAULT NULL;

COMMIT;
