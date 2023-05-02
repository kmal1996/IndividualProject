
#this imports the appconfig module from django.apps which is used to configure the apps sesttings.
from django.apps import AppConfig


#the usersconfig class is created and inherits form the appconfig class
class UsersConfig(AppConfig):
    
    #default auto is set to django.db.models  which is the default auto incrementing primarty key field type in django
    default_auto_field = 'django.db.models.BigAutoField'
    #name is set to users whihc is the name of the django app being configured
    name = 'users'
