CREATE TABLE departments (
    dept_no varchar(70),
    dept_name varchar(70)  NOT NULL ,
    PRIMARY KEY (
        dept_no
	)
);

CREATE TABLE dept_emp (
    emp_no int,
    dept_no varchar(70)  NOT NULL ,
    PRIMARY KEY (
        emp_no, dept_no
    )
);

CREATE TABLE dept_manager (
    dept_no varchar(70)  NOT NULL ,
    emp_no int 
);

CREATE TABLE employees (
    emp_no int,
    title_id varchar(15)  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name varchar(30)  NOT NULL ,
    last_name varchar(30)  NOT NULL ,
    sex varchar(10)  NOT NULL ,
    hire_date date  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE salaries (
    emp_no int,
    salary float,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE titles (
    title_id varchar(15)  NOT NULL ,
    title varchar(25)  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_title_id FOREIGN KEY(title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);