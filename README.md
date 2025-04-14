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
