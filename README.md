# GUIDELINE
## Features of web
* Import data file (csv file)

<img alt="Import data" src="images_git/import_data.png">

* Themes: Dark/Light mode 

| Dark | Light |
| ------- | ------- |
| <img alt="Themes" src="images_git/dashboard_dark.png" width=500> | <img alt="Themes" src="images_git/dashboard_light.png" width=500>|

* Statistics of the number of students with scores in the above 4 levels by subjects.

<img alt="Statistic" src="images_git/statstic_literature.png">

* Check score from registration number

<img alt="Search" src="images_git/search_scores_1.png">

* Filter 10 students having highest score in Group A (math, physics, chemical) 

<img alt="Filter" src="images_git/filter.png">

* Responsive design (desktops, tablets & mobile phones)


| Phone | Tablet | Desktop |
| ------- | ------- | ------- |
| <img src="images_git/modify_screen_phone.png" > | <img src="images_git/modify_screen_tablet.png"> | <img src="images_git/modify_screen_laptop_1.png"> |

## Set up environment & deployement project

* Step 1: clone this repository in Github
``` bash
git clone https://github.com/Khoi1308/student_management.git
```
Then 
``` bash
cd student_management
```
* Step 2: Set up enviroment
Firt, you have installed Docker and Docker compose (link: https://docs.docker.com/engine/install)
Then, create container from Dockerfile
```bash
docker build -t rails_app . 
```
Then, add vite by yarn
```


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
