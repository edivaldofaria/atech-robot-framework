from pymongo import MongoClient

client = MongoClient('mongodb+srv://edivaldofaria:esf456123@cluster0.t3mqqzm.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users'] 
    users.delete_many({'email': user_email})