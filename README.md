# vetdatabase

## Login, Appointment and Adding Animal to Database
![1_Trim](https://user-images.githubusercontent.com/70071853/224451296-d70c2538-cff8-4366-999f-17ee7e85a1cb.gif)
## Register
![2](https://user-images.githubusercontent.com/70071853/224447272-e7b9199c-0e8c-479c-a09c-e5fecff67eed.gif)
## Admin Panel
![3](https://user-images.githubusercontent.com/70071853/224447275-5f6ac960-46ec-4006-ab0a-1edcc1e81147.gif)


## Installation Guide:
1- Type the following in your Git Bash
   git clone https://github.com/Ykpckr/BIL-372-Project.git

2- Open Mysql and create a schema, then paste vet-dataouse_queries.sql and run query

3- Open the project folder in your preferred tool

4-Inside __init__.py and run.py, fill the following according to your database:
  app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://User:PassWord@ServiceType/Schema_Name'
  User = Username in mysql, PassWord = Password in mysql, ServiceType = localhost:3306 (or any type of service), Schema_Name = Name of your schema

5-Run the program by running run.py
