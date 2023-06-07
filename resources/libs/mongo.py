from pymongo import MongoClient
import bcrypt

client = MongoClient('mongodb+srv://edivaldofaria:esf456123@cluster0.t3mqqzm.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users'] 
    users.delete_many({'email': user_email})
    print('Removendo email' + user_email)


def insert_user(user):
   users = db['users'] 
   
   hashed = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))

   doc = {
       'name': user['name'],
       'email': user['email'],
       'password': hashed
       
   }
   
   users.insert_one(doc)
   print(doc)
