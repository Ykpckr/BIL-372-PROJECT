#app.py
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:admin@localhost:3306/proje'

db=SQLAlchemy(app)
class Student(db.Model):
    __tablename__='students'
    id=db.Column(db.Integer,primary_key=True)
    fname=db.Column(db.String(40))
    lname=db.Column(db.String(40))
    email=db.Column(db.String(40))
    
    def __init__(self,fname,lname,email):
        self.fname=fname
        self.lname=lname
        self.email=email
        
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    fname= request.form['fname']
    lname=request.form['lname']
    email=request.form['email']

    student=Student(fname,lname,email)
    db.session.add(student)
    db.session.commit()

#fetch a certain student
    studentResult=db.session.query(Student).filter(Student.id==1)
    for result in studentResult:
        print(result.fname)
        
    return render_template('success.html', data=fname)

if __name__ == "__main__":
    app.run(debug=True)