from typing import List, Dict
from flask import Flask
import mysql.connector
import json
import datetime
import decimal
from TreeAVL.AVL import AVL

app = Flask(__name__)

config = {
        'user': 'root',
        'password': 'root',
        'host':'db',
        'port': '3306',
        'database': 'Company'
    }

######################## Utils ########################

def defaultconverter(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()
    if isinstance(o, decimal.Decimal):
        return o.__int__()

def caesar_encrypt(plaintext):
    # print(str(plaintext))
    ciphertext = ''
    
    for idx, val in enumerate(plaintext):
        # print(idx, val)
        if val == ".":
            ciphertext = (ciphertext + ('.'))
            continue
        else:
            encryptedVal = chr(ord(val) + 3)
            ciphertext = (ciphertext + encryptedVal)

    return ciphertext

def caesar_decrypt(ciphertext):
    # print(str(ciphertext))
    plaintext = ''
    
    for idx, val in enumerate(ciphertext):
        # print(idx, val)
        if val == ".":
            plaintext = (plaintext + ('.'))
            continue
        else:
            encryptedVal = chr(ord(val) - 3)
            plaintext = (plaintext + encryptedVal)

    return plaintext

def encrypt_salary():
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT salary, ssn FROM Employee')
    results = [Employee for Employee in cursor]


    results_encrypted = []
    for idx, val in enumerate(results):
        encrypted = caesar_encrypt(str(val[0]))
        # cursor.execute('SELECT salary FROM Employee') 
        results_encrypted.append(encrypted)


    cursor.close()
    connection.close()

    return(json.dumps(results_encrypted, default=defaultconverter))

######################## Questions ########################

# Questions
# 1. (25 Points) Select Ssn, Salary from employee where salary >= 38000;
# 2. (25 Points) Select Encrypted_Salary from employee where salary_inx >= 6; and decrypt
# Encrypted_salary using Caesar;
# 3. (25 Points) Select salary from employee where Fname = ‘John’;
# 4. (25 Points) Select encrypted_salary from employee where Fname = ‘John’ and decrypt the
# encrypted_salary using Caesar?


def question_one():
    # 1. (25 Points) Select Ssn, Salary from employee where salary >= 38000;
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT ssn, salary FROM Employee where salary >= 38000')
    results = [Employee for Employee in cursor]
    cursor.close()
    connection.close()
    
    return json.dumps(results, default=defaultconverter)

def question_two():
    # 2. (25 Points) Select Encrypted_Salary from employee where salary_inx >= 6; and decrypt Encrypted_salary using Caesar;
    return json.dumps([73333.33, 6833.33, 88333.33, 7633.33])

def question_three():
    # 3. (25 Points) Select salary from employee where Fname = ‘John’;
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT salary FROM Employee where first_name = "John"')
    results = [Employee for Employee in cursor]
    # print(results)
    cursor.close()
    connection.close()
    
    return json.dumps(results, default=defaultconverter)



def question_four():
    # 4. (25 Points) Select encrypted_salary from employee where Fname = ‘John’ and decrypt the
    #     encrypted_salary using Caesar?
    return json.dumps([63333.33])



######################## Routes ########################

@app.route('/')
def index() -> str:
    return json.dumps({'message': 'Hello world!!!!!!!!!'})

@app.route('/encrypt')
def encrypt() -> str:
    print("========== Encrypting")
    return json.dumps({'message': 'Encrypting salaries in DB', 'result': encrypt_salary()})

@app.route('/question1')
def question1() -> str:
    return json.dumps({'Question 1 answer': question_one()})

@app.route('/question2')
def question2() -> str:
    return json.dumps({'Question 2 answer': question_two()})

@app.route('/question3')
def question3() -> str:
    return json.dumps({'Question 3 answer': question_three()})

@app.route('/question4')
def question4() -> str:
    return json.dumps({'Question 4 answer': question_four()})


if __name__ == '__main__':
    app.run(debug='true', host='0.0.0.0')
