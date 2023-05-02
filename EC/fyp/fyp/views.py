from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import redirect, render
from django.urls import reverse
import mysql.connector as sql
import users.views


def home(request):
    return render(request, "index.html",{"title": "Home"})

def shop(request):
    return render(request, "shop.html",{"title": "Products"})

def cart(request):
    if "user" in request.session:
        return render(request, "cart.html",{"title": "Cart"})
    else:
        return redirect("/login")

def about(request):
    return render(request, "about.html",{"title": "About Us"})


def getProducts(request):
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        cursor = conn.cursor()
        query = f"SELECT * from products order by id desc"
        cursor.execute(query)
        user = tuple(cursor.fetchall())
        my_list = []
        for item in user:
            my_dict = {'id': item[0], 'name': item[1],'image': item[2],'price': item[3],'cost': item[4],'stock': item[5],'description': item[6],'category': item[7]}
            my_list.append(my_dict)
        response_data = {'result': my_list}
        return JsonResponse(response_data)
    # return render(request, "shop.html",{"title": "Shop", })

def getSingleProduct(request):
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        id = request.GET.get('id')
        conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        cursor = conn.cursor()
        query = f"SELECT * from products where id = {id}"
        cursor.execute(query)
        item = tuple(cursor.fetchone())
        my_dict = {'id': item[0], 'name': item[1],'image': item[2],'price': item[3],'cost': item[4],'stock': item[5],'description': item[6],'category': item[7]}
        response_data = {'product': my_dict}
        return JsonResponse(response_data)

def getProductsByCategory(request):
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        cat = request.GET.get('cat')
        conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        cursor = conn.cursor()
        query = f"SELECT * from products where category = '{cat}' order by id desc"
        cursor.execute(query)
        user = tuple(cursor.fetchall())
        my_list = []
        for item in user:
            my_dict = {'id': item[0], 'name': item[1],'image': item[2],'price': item[3],'cost': item[4],'stock': item[5],'description': item[6],'category': item[7]}
            my_list.append(my_dict)
        response_data = {'result': my_list}
        return JsonResponse(response_data)

def getProductsByQuery(request):
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    if is_ajax:
        q = request.GET.get('q')
        conn = sql.connect(host="localhost", user="root", passwd="", database="ecomdb")
        cursor = conn.cursor()
        query = f"SELECT * from products where name like  '%{q}%' order by id desc"
        cursor.execute(query)
        user = tuple(cursor.fetchall())
        my_list = []
        for item in user:
            my_dict = {'id': item[0], 'name': item[1],'image': item[2],'price': item[3],'cost': item[4],'stock': item[5],'description': item[6],'category': item[7]}
            my_list.append(my_dict)
        response_data = {'result': my_list}
        return JsonResponse(response_data)