0 - the working directory is tf-Pro-A

    terraform init --var-file=tf-Q/tf-Q-D.tfvars
    terraform plan --var-file=tf-Q/tf-Q-D.tfvars
    terraform apply --var-file=tf-Q/tf-Q-D.tfvars
    terraform destroy --var-file=tf-Q/tf-Q-D.tfvars

1 - in the provider file, remove the profile line or pass your profile there

2 - adjust the backend

3 - you'll have to run the code twice.
    - run the code the first time to create the resources.
    - copy the ip addresses from the terminal output and paste in the security groups module accordingly and run it again



####
### Prerequisites
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later

### Technologies 
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL
### Database
Here,we used Mysql DB 
MSQL DB Installation Steps for Linux ubuntu 14.04:
- $ sudo apt-get update
- $ sudo apt-get install mysql-server

Then look for the file :
- /src/main/resources/accountsdb
- accountsdb.sql file is a mysql dump file.we have to import this dump to mysql db server
- > mysql -u <user_name> -p accounts < accountsdb.sql


