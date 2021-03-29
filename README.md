# Project Management Tool

This is an open source project management tool that allow hierarchical activities.

## Backlog

- [ ] Separate leaf tasks from composed tasks
    - [ ] A leaf task should be automatically transformed in a composed task when a subtask is created.
    - [ ] Attributes from composed tasks should be derived from leaf tasks.
    - [ ] Only leaf tasks should be shown in the activity list.
- [ ] Improve visualization of tasks as a list 
    - [ ] Search, filter and sort by all atributes.
    - [ ] Current scheduling strategy: closest deadline first.
    - [ ] Scheduling strategy: Critical first.
    - [ ] Scheduling strategy: Quicks/Easies first.
    - [ ] Scheduling strategy: Funs first.
    - [ ] Creation of custom scheduling for advanced users
- [ ] Notifications of deadlines, changes in activities, etc.- [ ] Multitask operations (delete, etc.)
- [ ] Add a nice search tool for tasks, users, tags, etc.
- [ ] Compute critical tasks based on dependencies and duration.
- [ ] Compute the predicted date to finish the project in the best and worst case scenarios considering the current status of tasks.
- [ ] Make stuff pretty
- [ ] Add task dependencies
- [ ] Add gant chart visualization
- [ ] Activity/Project progress bar
- [ ] Assigning users to tasks
- [ ] Add interested users to tasks (besides the main responsible for executing the task)
- [ ] Send remainder e-mails
- [ ] Push notifications.
- [ ] Synchronize with google calendar
- [ ] Dashboard
    - [ ] Worked hours by users
    - [ ] User performance (predicted task duration vs. effective duration)
    - [ ] Completed tasks by user
    - [ ] Users' allocation by period of time (if an user needs more hours to finish the tasks than his daily working hours, the tasks will be delayed)
- [ ] Allow users to download their data (task lists, etc).
- [ ] Security mechanisms so that users' information cannot be viewed neither by other users nor by the development team. 


## Installation Instructions

Install apache, mysql, and php

    sudo apt-get install apache2 mysql-server php \
    php-{bcmath,bz2,intl,gd,mbstring,mcrypt,mysql,zip} \
    libapache2-mod-php phpmyadmin php-mbstring php-gettext

When asked which server do you like to use choose apache by pressing space. 
When asked if phpMyAdmin should create a database using dbconfig, choose no. 

Starting Apache and MySQL on boot

    sudo systemctl enable apache2.service
    sudo systemctl enable mysql.service

Restart apache service:

    systemctl restart apache2.service

The installation process add a phpMyAdmin configuration file called phpmyadmin.config to /etc/apache2/conf-enabled/. If the file do not exists, edit the file /etc/apache2/apache2.conf, and add the following line to the end:

    Include /etc/phpmyadmin/apache.conf

Enable some php extensions: 

    sudo phpenmod mcrypt
    sudo phpenmod mbstring
  
Restart apache:

    sudo systemctl restart apache2

Clone the repository to the directory /var/www/html. 

Create a new database using phpMyAdmin called todolist_db. 
Import the tables' structures from sql/todolist_db.sql to the database.

Access the site http://localhost/todolist_app .


