from flask import Flask, jsonify
from flask_pymongo import PyMongo



app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://mongo:27017/stepik"
mongo = PyMongo(app)

@app.route('/users')
def users():
    users = [doc for doc in mongo.db.users.find({}, {'_id': False})]

    return jsonify(users)
    

if __name__ == '__main__':
    app.run(debug = True, host = '0.0.0.0', port = 3000)