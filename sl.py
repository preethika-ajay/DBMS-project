import tkinter  as tk 
from tkinter import * 
my_w = tk.Tk()
my_w.geometry("800x400") 
from sqlalchemy import create_engine
my_conn = create_engine("mysql+mysqldb://root:@localhost/dbms_proj_final")
####### end of connection ####
r_set=my_conn.execute("SELECT * FROM user")
i=0 
for user in r_set: 
    for j in range(len(user)):
        e = Entry(my_w, width=10, fg='blue') 
        e.grid(row=i, column=j) 
        e.insert(END, user[j])
    i=i+1
my_w.mainloop()