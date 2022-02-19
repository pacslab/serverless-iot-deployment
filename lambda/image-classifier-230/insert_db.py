import os

import mysql.connector

mydb = mysql.connector.connect(
  host=os.environ.get("IP_MYSQL"),
  user=os.environ.get("USER_MYSQL"),
  password='password',
  database="cat"
)

def commitData(requestId, prediction):
  mycursor = mydb.cursor()

  sql = "INSERT INTO prediction (requestId, prediction) VALUES (%s, %s)"
  val = (requestId, prediction)
  mycursor.execute(sql, val)

  mydb.commit()
