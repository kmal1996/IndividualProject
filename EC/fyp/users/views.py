from django.shortcuts import redirect, render
#import mysql.connector as sql
from fyp.views import home
from django.db import connection

# Create your views here.
name = ""
id = ""
passwd = ""
        
def signup(request):
    if request.method == 'POST':
        #conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        #cursor = conn.cursor()
        data = request.POST
        global name, id, passwd
        for key, value in data.items():
            if key == "name":
                name = value
            elif key == "ID":
                id = value
            elif key == "pass":
                passwd = value
        
        #query = f"INSERT into customer(custid, pass, name) values({id},'{passwd}','{name}')"
        sql = "INSERT INTO customer(custid, pass, name) VALUES (%s, %s, %s)"
        values = (id, passwd, name)
        
        #cursor.execute(query)
        #conn.commit()
        with connection.cursor() as cursor:
            cursor.execute(sql, values)

        return redirect('/?msg=success')
    else:
        return render(request,"register.html")


def signin(request):
    if request.method == 'POST':
        #conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        #cursor = conn.cursor()
        data = request.POST
        global id, passwd
        for key, value in data.items():
            if key == "ID":
                id = value
            elif key == "pass":
                passwd = value
        
        sql = "SELECT * from customer where custid = %s and pass = %s"
        values = (id, passwd)
        
        with connection.cursor() as cursor:
            cursor.execute(sql, values)
            user = tuple(cursor.fetchone())
            print(user)
            if user == ():
                return render(request,"customer.html", {"error": "Invalid ID or Password"})
            else:
                request.session["user"] = user[2]
                return redirect("/")
    else:
        return render(request,"customer.html")
    
def logout(request):
    # Remove the session key from the client's browser
    request.session.clear()
    return redirect(home)

