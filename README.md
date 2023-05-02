# IndividualProject

# Important 

**Readme File**
**The Steps to run the project** 

there are Two ways to run the project there is two folders we have one for the django web framework and one for the Xampp server

the one that has the Django webframework is called EC and to run this folder or project you need to follow the instruction here. 


**These are the instructions to run the EC folder below:**

Make sure XAMPP server is installed and latest version of it because we have connected Django using XAMPP server instead of the database make sure you memorise the location of the XAMPP server and where you have installed it from the beginning. We have not set up any password for the phpMyAdmin database it was default left it blank. Go into  XAMPP server or go into a web browser type in localhost:86 this is just example of a port number depending on whatever port number you have in the machine. Download the project folder from the Moodle upload link then extract it in the desktop open a terminal from the folder directly or cd to Desktop 
 open phpMyAdmin create a new database by the name of ecomdb make sure to use the name we mentioned here in phpMyAdmin web browser. There is a MySQL database inside the project folder called ecomdb.sql import that to phpMyAdmin
these are the commands to run the Django project  
```
Cd Desktop 
Cd EC
Python3 -m venv env
Source env/bin/activate
Pip install -r requirements.txt
Cd fyp
Python manage.py runserver
```


**Step Number 2:** 

to run the Ecomweb folder all you need to do is to download this folder 1. go inside the XAMPP folder
then open the htdocs folder then extract the Ecomweb folder inside the htdocs folder make sure the MYSQL Database, Apache Webserver, ProFTPD  are running and working in the XAMPP server
then open google chrome  web browser at the top on the address bar type in localhost:86 followed by whatever port number you have the port number we provided is just an example
depending on your port number then press enter and the default page of XAMPP server will be displayed at the address bar there is for example localhost:86/dashboard. delete the word dashboard after the forward slash
and type in Ecomweb this should launch the website to view the database open a new tab and run localhost:86 depending on your port number click on phpmyadmin at the top right corner this should bring the database 
it has the default tables that has been created by Django and it has two other tables which we made, the customer and the products, in the customer table it has the login details of customers you can view the custid , the pass and the name you can use it to login inside the website and the product table has all the product infomration
or if you register with new information this will be inserted inside the phpmyadmin. 
