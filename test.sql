/*
-- Testing stuff
SELECT * FROM mysqltutorial.test100;

INSERT INTO mysqltutorial.test100 (grade, school) VALUES ('11', 'x high school');
*/





-- Create a new database MicrosoftFormTable. Column name/field name needs to be the same as mysql while the order that it is
-- ...created does not matter
/* -- do not run again unless 
CREATE TABLE mysqltutorial.MicrosoftFormTable (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    School VARCHAR(255),
    Grade VARCHAR(50), -- possibly change this to int and change Microsoft Forms to require Grade to be INT/number
    Feedback TEXT, -- 3.Do you have any feedback on the Computer Science A course? 
    Suggestion TEXT, -- 4.Please provide any further suggestions, comments, or ideas you have for your school
    SubmissionTime DATETIME,
    ResponderEmail VARCHAR(255)
);
*/
-- table is populated/filled with responses real time but this is done outside of vscode.
-- Select this table to show that the raw data is stored in this table
select * from mysqltutorial.MicrosoftFormTable;
/*
CREATE TABLE mysqltutorial.surveytable (
  _id VARCHAR(50) NOT NULL PRIMARY KEY,
  _createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  _updatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  _owner VARCHAR(50),
  llmTask VARCHAR(1000),
  llmAnswers VARCHAR(2000)
);
*/

DESCRIBE mysqltutorial.surveytable;


ALTER TABLE mysqltutorial.surveytable
MODIFY llmAnswers VARCHAR(8000);

-- Show a new table to store the processed data/output of LLM with new field names.
select _id AS id, _createdDate AS 'Created Date',
_updatedDate AS 'Updated Date', llmTask,
llmAnswers
from mysqltutorial.surveytable
order by _createdDate asc; 

SELECT * FROM mysqltutorial.surveytable;




DESCRIBE mysqltutorial.surveytable;


-- llmTask: (a) sentiment analysis; (b) topic modeling 
-- llmAnswers: 




DESCRIBE mysqltutorial.MicrosoftFormTable;

ALTER TABLE mysqltutorial.MicrosoftFormTable ADD COLUMN Feedback TEXT;
ALTER TABLE mysqltutorial.MicrosoftFormTable ADD COLUMN Suggestion TEXT;
ALTER TABLE mysqltutorial.MicrosoftFormTable DROP COLUMN Question;

select * from mysqltutorial.MicrosoftFormTable; 



