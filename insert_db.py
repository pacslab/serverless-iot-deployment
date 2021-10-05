import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password='password',
  database="cat"
)

def commitData(requestId, prediction):
  mycursor = mydb.cursor()

  sql = "INSERT INTO prediction (requestId, prediction) VALUES (%s, %s)"
  val = (requestId, prediction)
  mycursor.execute(sql, val)

  mydb.commit()
