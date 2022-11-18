import tkinter  as tk 
from tkinter import * 
import mysql.connector
from datetime import date

my_w = tk.Tk()
my_w.geometry("400x400") 
my_w.title("Organ Donation System")

l9 = tk.Label(my_w,  text='Enter User ID to update: ', width=30,anchor="c" )  
l9.grid(row=1,column=1) 

t9 = tk.Text(my_w,  height=1, width=10,bg='white') 
t9.grid(row=1,column=2)

l10 = tk.Label(my_w,  text='Enter New Details: ', width=30,anchor="c" )  

l1 = tk.Label(my_w,  text='Name: ', width=10,anchor="c" )  
l1.grid(row=3,column=1) 

t1 = tk.Text(my_w,  height=1, width=10,bg='white') 
t1.grid(row=3,column=2) 

l2 = tk.Label(my_w,  text='DOB: ', width=10 )  
l2.grid(row=4,column=1) 

t2 = tk.Text(my_w,  height=1, width=10,bg='white') 
t2.grid(row=4,column=2)

l3 = tk.Label(my_w,  text='Medical Insurance: ', width=15 )  
l3.grid(row=10,column=1) 

t3 = tk.Text(my_w,  height=1, width=10,bg='white') 
t3.grid(row=10,column=2)

l4 = tk.Label(my_w,  text='Medical History: ', width=10 )  
l4.grid(row=12,column=1) 

t4 = tk.Text(my_w,  height=1, width=10,bg='white') 
t4.grid(row=12,column=2)

l5 = tk.Label(my_w,  text='Street: ', width=10 )  
l5.grid(row=14,column=1) 

t5 = tk.Text(my_w,  height=1, width=10,bg='white') 
t5.grid(row=14,column=2)

l6 = tk.Label(my_w,  text='City: ', width=10 )  
l6.grid(row=16,column=1) 

t6 = tk.Text(my_w,  height=1, width=10,bg='white') 
t6.grid(row=16,column=2)

l7 = tk.Label(my_w,  text='State: ', width=10 )  
l7.grid(row=18,column=1) 

t7 = tk.Text(my_w,  height=1, width=10,bg='white') 
t7.grid(row=18,column=2)

l8 = tk.Label(my_w,  text='Phno: ', width=10 )  
l8.grid(row=20,column=1) 

t8 = tk.Text(my_w,  height=1, width=10,bg='white') 
t8.grid(row=20,column=2)

b1 = tk.Button(my_w,  text='Update Record', width=10, 
               command=lambda: update_data())  
b1.grid(row=22,column=2) 
my_str = tk.StringVar()
l5 = tk.Label(my_w,  textvariable=my_str, width=10 )  
l5.grid(row=3,column=3) 

def update_data():
    my_id = t9.get("1.0")
    my_name=t1.get("1.0", END) # read name
    my_DOB=t2.get("1.0",END)    # read class
    my_DOB = my_DOB.split('-')
    year, month, day = [int(item) for item in my_DOB]
    my_DOB = date(year, month, day)



    my_insurance=t3.get("1.0",END) # read mark
    my_history=t4.get("1.0",END)   # read gender 
    my_Street = t5.get("1.0",END)
    my_city = t6.get("1.0",END)
    my_state = t7.get("1.0",END)
    my_phno = t8.get("1.0",END)
    my_str.set("Update data...")
    try:
        from sqlalchemy import create_engine
        from sqlalchemy.exc import SQLAlchemyError
        engine = create_engine("mysql+mysqldb://root:@localhost/dbms_proj_final")
        query="UPDATE user SET `name`=%s ,`Date_of_birth`=%s ,`Medical_insurance`=%s, `medical_history`=%s, `street`=%s, `city`=%s, `state`=%s, `phno_user`=%s\
        WHERE user_id=%s;"
        my_data=(my_name,  my_DOB, my_insurance, my_history, my_Street, my_city, my_state, my_phno, my_id)
        id=engine.execute(query,my_data) # insert data
        t1.delete('1.0',END)  # reset the text entry box
        t2.delete('1.0',END)
        t3.delete('1.0',END)  # reset the text entry box
        t4.delete('1.0',END)
        t5.delete('1.0',END)
        t6.delete('1.0',END)
        t7.delete('1.0',END)
        t8.delete('1.0',END)
        t9.delete('1.0',END)
        l5.grid() 
        l5.config(fg='green') # foreground color 
        l5.config(bg='white') # background color 
        my_str.set("ID:" + str(id.lastrowid))
        l5.after(3000,lambda:l5.config(fg='white',bg='white',text=''))
            
    except SQLAlchemyError as e:
        error = str(e.__dict__['orig'])
        l5.grid() 
        #return error
        l5.config(fg='red')   # foreground color
        l5.config(bg='yellow') # background color
        print(error)
        my_str.set(error)
my_w.mainloop()

