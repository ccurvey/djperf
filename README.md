# djperf

This is a sample project that is used for demonstrations.  Please don't use it as an example of coding
style -- there are many things in here that are intentionally done strangely or incorrectly for demonstration
purposes.

In order to get a copy of the application for your use:

1) clone the repository

    git clone git@github.com:ccurvey/djperf.git


2) install the required software.  Good idea to use virtualenv

    cd djperf
    pip install -r requirements.txt
    
This will install django.  You'll need the Postgres client development libraries to install psycopg2.  (If you're on Windows, you'll probably just want to find a binary distribution of psycopg2.)

3) You'll also need a Postgres database server.   (I will provide one for presentations.)  On your server, create a database and load it from the dbdump.sql script

    psql my-database-name < dbdump.sql
    
4)  Fire up a Django server and try to connect to it.
