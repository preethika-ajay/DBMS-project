import tkinter  as tk 
from tkinter import * 
import mysql.connector
from datetime import date

my_w = tk.Tk()
my_w.geometry("400x400") 
my_w.title("Organ Donation System")

l1 = tk.Label(my_w,  text='Enter query: ', width=30,anchor="c" )  
l1.grid(row=1,column=1) 

t1 = tk.Text(my_w,  height=1, width=80,bg='white') 
t1.grid(row=1,column=2) 

l2 = tk.Label(my_w,  text='Table: ', width=30,anchor="c" )  
l2.grid(row=2,column=1) 

t2 = tk.Text(my_w,  height=1, width=80,bg='white') 
t2.grid(row=2,column=2) 

b1 = tk.Button(my_w,  text='Enter', width=10, 
               command=lambda: exec_data())  
b1.grid(row=22,column=2) 
my_str = tk.StringVar()
l5 = tk.Label(my_w,  textvariable=my_str, width=10 )  
l5.grid(row=3,column=3) 
# my_str.set("Output")
def exec_data():
    # flag_validation=True # set the flag 
    query = t1.get("1.0",END)
    table = t2.get("1.0",END)
    my_str.set("Executing...")
    try:
        from sqlalchemy import create_engine
        from sqlalchemy.exc import SQLAlchemyError
        
        # add your mysql userid, password and db name here ##
        engine = create_engine("mysql+mysqldb://root:@localhost/dbms_proj_final")
        # engine = mysql.connector.connect(
        # host="localhost",user="root",passwd="",
        # database="dbms_proj_final"
        # )
                    
        # query="DELETE FROM  user WHERE user_id=%s"
        # my_data=(my_user)

        id=engine.execute(query) # insert data
        t1.delete('1.0',END)  # reset the text entry box
    
        # l5.grid() 
        # l5.config(fg='green') # foreground color 
        # l5.config(bg='white') # background color 
        # my_str.set("ID:" + str(id.lastrowid))
        # l5.after(3000,lambda:l5.config(fg='white',bg='white',text=''))
            
    except SQLAlchemyError as e:
        error = str(e.__dict__['orig'])
        # l5.grid() 
        # #return error
        # l5.config(fg='red')   # foreground color
        # l5.config(bg='yellow') # background color
        print(error)
        my_str.set(error)
        query="SELECT * FROM  %s"
        my_data=(table)
        r_set=engine.execute(query, my_data)
        i=0 
        for user in r_set: 
            for j in range(len(user)):
                e = Entry(my_w, width=10, fg='blue') 
                e.grid(row=i+25, column=j) 
                e.insert(END, user[j])
            i=i+1
        my_w.mainloop()
        
        
    #  else:
    #     l5.grid() 
    #     l5.config(fg='red')   # foreground color
    #     l5.config(bg='yellow') # background color
    #     my_str.set("check inputs.")
    #     l5.after(3000,lambda:l5.config(fg='white',bg='white',text=''))
my_w.mainloop()


