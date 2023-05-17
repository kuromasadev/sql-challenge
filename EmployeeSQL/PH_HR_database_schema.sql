
        
CREATE TABLE PH_depts
(
  dept_no   VARCHAR NOT NULL,
  dept_name TEXT    NOT NULL    ,
  PRIMARY KEY (dept_no)
);

CREATE TABLE PH_depts_emp
(
  dept_no VARCHAR NOT NULL,
  emp_no  INT     NOT NULL
);

CREATE TABLE PH_depts_mgr
(
  dept_no VARCHAR NOT NULL,
  emp_no  INT     NOT NULL
);

CREATE TABLE PH_emp
(
  emp_no       INT     NOT NULL,
  emp_title_id VARCHAR NOT NULL,
  birth_date   DATE    NOT NULL,
  first_name   VARCHAR NOT NULL,
  last_name    VARCHAR NOT NULL,
  sex          VARCHAR NOT NULL,
  hire_date    DATE    NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE PH_salaries
(
  emp_no INT    NOT NULL,
  salary MONEY NOT NULL
);

CREATE TABLE PH_titles
(
  title_id VARCHAR NOT NULL,
  title    TEXT    NOT NULL,
  PRIMARY KEY (title_id)
);

ALTER TABLE PH_depts_emp
  ADD CONSTRAINT FK_PH_depts_TO_PH_depts_emp
    FOREIGN KEY (dept_no)
    REFERENCES PH_depts (dept_no);

ALTER TABLE PH_depts_mgr
  ADD CONSTRAINT FK_PH_depts_TO_PH_depts_mgr
    FOREIGN KEY (dept_no)
    REFERENCES PH_depts (dept_no);

ALTER TABLE PH_salaries
  ADD CONSTRAINT FK_PH_emp_TO_PH_salaries
    FOREIGN KEY (emp_no)
    REFERENCES PH_emp (emp_no);

ALTER TABLE PH_depts_emp
  ADD CONSTRAINT FK_PH_emp_TO_PH_depts_emp
    FOREIGN KEY (emp_no)
    REFERENCES PH_emp (emp_no);

ALTER TABLE PH_depts_mgr
  ADD CONSTRAINT FK_PH_emp_TO_PH_depts_mgr
    FOREIGN KEY (emp_no)
    REFERENCES PH_emp (emp_no);

ALTER TABLE PH_emp
  ADD CONSTRAINT FK_PH_titles_TO_PH_emp
    FOREIGN KEY (emp_title_id)
    REFERENCES PH_titles (title_id);

        
      