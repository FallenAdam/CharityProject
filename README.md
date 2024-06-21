Charity Management System
This project is a Charity Management System, built using Spring Boot and MySQL. The system allows administrators and users to manage donations, users, and roles. It also handles user authentication and authorization using Spring Security.

Table of Contents
Features
Technologies Used
Database Schema
Getting Started
Prerequisites
Installation
Running the Application
Usage
Contributing
License
Features
User registration and authentication.
Role-based access control (Admin and User roles).
CRUD operations for users and donations.
Secure password storage using BCrypt.
Technologies Used
Java
Spring Boot
Spring Security
MySQL
Thymeleaf (for views)
Maven
Database Schema
The database schema consists of the following tables:

ROLE

ID (Primary Key)
ROLE_NAME (Unique)
USER

ID (Primary Key)
ADDRESS
EMAIL (Unique)
FULL_NAME
NOTE
PASSWORD
PHONE_NUMBER
STATUS
USER_NAME (Unique)
CREATED
ROLE_ID (Foreign Key to ROLE)
DONATION

ID (Primary Key)
CODE (Unique)
CREATED
DESCRIPTION
START_DATE
END_DATE
MONEY
NAME
ORGANIZATION_NAME
PHONE_NUMBER (Unique)
STATUS
USER_DONATION

ID (Primary Key)
CREATED
MONEY
NAME
DATE_DONATION
STATUS
TEXT
DONATION_ID (Foreign Key to DONATION)
USER_ID (Foreign Key to USER)
Getting Started
Prerequisites
Java Development Kit (JDK) 11 or later
Maven
MySQL Server
Installation
Clone the repository:

sh
Copy code
git clone https://github.com/FallenAdam/CharityProject.git
cd CharityProject
Create a MySQL database:

sql
Copy code
CREATE DATABASE funix_charity;
Update the application properties:
Open src/main/resources/application.properties and update the MySQL connection settings:

properties
Copy code
spring.datasource.url=jdbc:mysql://localhost:3306/funix_charity
spring.datasource.username=your-username
spring.datasource.password=your-password
spring.jpa.hibernate.ddl-auto=update
