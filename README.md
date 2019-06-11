Introduction

Every office environment faces the problem of salary management of its employees. Through
this mini-project, we have provided a minimalistic solution to that problem. Our solution
assumes that every manager is responsible for the salary management of the employees in
his/her department. Our system allows managers to register themselves to add/delete
employees and update the salaries of the employees.

Working

For a manager to use the system, he/she must make a registration. From there on, the same
credentials are used for logging in to the system. The login credentials of a manager are
stored in a table within a database.
Once the manager is authenticated with the proper credentials, he/she can begin using the
system. It allows:

  1. Addition of employees
  
   This takes in the details about the name, email and salary of the employee.
    
    b. This scenario captures the idea of newly joined employees.
    
  2. Deletion of employees
  
    a. Upon pressing the delete button against an employee, the portal gets redirected
    to an intermediate page that performs the delete operation on the database and
    reflects the changes on the portal.
    
    b. This idea is relevant in cases where employees are no longer working in the
    manager's department.
    
  3. Updation of salary of an employee
  
    a. Similar to the delete button, the update operation is carried out in an
    intermediate page to reflect the changes in both the database and the portal.
    
    b. This scenario is relevant to the cases where the employees are given a hike or
    promotion or demotion.
    
    The employee details are stored in a separate table within the same database. The table
    additionally stores the manager of each employee in a separate column.
    Each such operation results in changes to the database, which is reflected dynamically on the
    management page. This dynamic reflection is a result of the use of JavaServer Page with a
    connection to the MySQL database.

Modules Identified

The solution that we have developed makes use of the following modules:

  1. JavaServer Page together with HTML.
  
    a. Used for both front-end and back-end operations. It was also used to facilitate
    intermediate stages of an operation.
    
  2. MySQL as the Database Management System.
  
    b. The manager details and the employee details are stored in two separate
    
