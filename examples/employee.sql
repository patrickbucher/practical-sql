create table if not exists employee (
    id serial,
    first_name varchar(50),
    last_name varchar(50),
    born date,
    hired date,
    salary numeric
);

insert into employee
(first_name, last_name, born, hired, salary)
values
('Bertram', 'Gilfoyle', '1983-05-13', '2012-04-01', 120000),
('Erlich', 'Bachmann', '1975-01-31', '2012-01-01', 250000),
('Jared', 'Dunn', '1978-11-20', '2012-08-01', 80000);
