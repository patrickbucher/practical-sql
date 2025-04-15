# Practical SQL

- Book: [Practical SQL, 2nd Edition](https://github.com/anthonydb/practical-sql-2/)
- Repository: [anthonydb/practical-sql-2](https://github.com/anthonydb/practical-sql-2/)

## Setup

### Arch Linux

Install PostgreSQL:

    sudo pacman -S postgresql

Initialize the database cluster as `postgres` with proper locale and encoding:

    sudo -u postgres initdb --locale en_US.UTF-8 --encoding UTF8 -D /var/lib/postgres/data

Enable and start the service:

    sudo systemctl enable --now postgresql.service

### Debian GNU/Linux

Install PostgreSQL (version 15 on Debian 12 "Bookworm"):

    sudo apt install -y postgresql

The service `postgresql@15-main.service` is started automatically.

### Basic Configuration

Connect to the database `postgres` using the `postgres` user:

    sudo -u postgres psql postgres

Check version:

    # select version();

Set a password for the `postgres` user:

    # \password postgres

Create an additional user (same as the operating system user), e.g. `debian`:

    # create user debian superuser;

Connect to the database `postgres` using the `debian` user:

    psql postgres debian

By default, PostgreSQL uses _peer authentication_, i.e. the user information
provided by the operating system. The authentication method can be switched
from `peer` to `md5` in `pg_hba.conf`. Its path can be obtained as follows:

    # show hba_file;

### Create Databases and Tables

Create a database `company`:

```sql
create database company;
```

Create a table `employee`:

```sql
create table employee (
    id serial,
    first_name varchar(50),
    last_name varchar(50),
    born date,
    hired date,
    salary numeric
);
```

Insert some records:

```sql
insert into employee
    (first_name, last_name, born, hired, salary)
values
    ('Bertram', 'Gilfoyle', '1983-05-13', '2012-04-01', 120000),
    ('Erlich', 'Bachmann', '1975-01-31', '2012-01-01', 250000),
    ('Jared', 'Dunn', '1978-11-20', '2012-08-01', 80000);
```

## Using `psql`

Execute query from a script (`employee.sql`) on a particular database (`company`):

    psql company -f employee.sql
