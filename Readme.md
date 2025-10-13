# 🏗️ Design Document

By Carlos Tosoratto

Video overview:

[Final Project Presentation](https://youtu.be/bjtHTrzuTDg)

   [![YouTube](https://img.shields.io/badge/YouTube-FC0000?style=flat&logo=youtube&logoColor=white)](https://youtu.be/bjtHTrzuTDg)   

## 🎯 Scope

In this section you should answer the following questions:

#### **What is the purpose of your database?**

The purpose of this database is to manage the operations of an engineering consulting firm, including tracking staff members, clients, project budgets, and the assignment of personnel and equipment to each project. It facilitates administrative control, ensures data integrity, and supports further analysis through tools like Power BI.

#### **Which people, places, things, etc. are you including in the scope of your database?**

**👩‍👩‍👧‍👦 PEOPLE:** 
- Staff: engineers, project managers, welder, etc.
- Clients: companies or individuals hiring engineering services.
- Contacts: specific people linked to each client.

**🕌 PLACES:** 
- Projects: locations, including addresses and cities.

**📋 THINGS:**
- Budgets: quotations for proposed work, including status tracking.
- Equipments: physical tools or machines used in projects.
- Assignments: which staff and equipment are involved in each project.


#### **Which people, places, things, etc. are *outside* the scope of your database?**
- Financial transactions: invoices, payments, and accounting.
- Detailed task-level project management: Gantt charts, deadlines.
- Employee payroll, benefits, or HR performance metrics.
- Inventory control of equipment parts or consumables.
- Client satisfaction.
- Attendance or time-tracking (e.g., clock-in/clock-out).

## 🛠️ Functional Requirements

In this section you should answer the following questions:

#### **What should a user be able to do with your database?**
- Add, update, or deactivate staff members and clients.
- Create projects and assign budgets.
- Assign staff and equipment to projects with dates and hours.
- Query the database for analysis (e.g., staff workload, project progress, budget status).
- Use with analytical tools like **Power BI**

#### **What's beyond the scope of what a user should be able to do with your database?**
- Automated project scheduling or resource optimization.
- Real-time inventory or procurement management.
- Complex financial accounting unrelated to project budgets.
- Equipment maintenance management.

## Representation

<p align="center">
  <img src="Assets/ERD-OFFICE1.png" alt="ERD OFFICE1" width="800"/>
</p>


## 🗂️Entities

In this section you should answer the following questions:

#### **Which entities will you choose to represent in your database?**

Staff, Clients, Contacts, Budgets, Projects, Staff_Project, Equipments, Equipments_Project.

#### **What attributes will those entities have?**

Staff: id, first_name, last_name, position, active (boolean for soft deletion).
Clients: id, name.
Contacts: id, name, email, client_id.
Projects: id, name, client_id, contact_id, budget, address, city, start_date, end_date.
Budgets: id, project_id, amount, status.
Equipments: id, name, type.
Staff_project: staff_id, project_id, assigned_hours.
Equipments_project: equipment_id, project_id, assignment_date, unassignment_date, assigned_hours.

#### **Why did you choose the types you did?**
INTEGER for IDs and numeric quantities.
TEXT for names, positions, and status fields.
DATE for project and assignment dates.
BOOLEAN for soft deletion flags.

#### **Why did you choose the constraints you did?**
Primary keys on all IDs.
Foreign keys for relationships (e.g., staff_project references staff and projects).
Not null constraints for mandatory fields (e.g., assigned_hours).
Default values where appropriate (e.g., activo = TRUE).

## 🔗Relationships

A client can have multiple contacts and multiple projects.
Each project has one budget but may have multiple budget revisions (status tracked).
Staff can be assigned to multiple projects and track hours per project.
Equipment can be assigned to multiple projects with specific assignment periods and hours.

## ⚡Optimizations

In this section you should answer the following questions:

#### **Which optimizations (e.g., indexes, views) did you create? Why?**
- Indexes: Created on foreign key columns and frequently queried fields to speed up joins (e.g., project_id in staff_project).
- Views: Created views such as project_overview to consolidate project, client, staff, and budget information for reporting in Power BI.
These optimizations improve query performance and make reporting easier for end users.


## ⚠️Limitations

In this section you should answer the following questions:

#### ** What are the limitations of your design?**
#### **What might your database not be able to represent very well?**
While this database provides a solid structure for managing an engineering consulting firm, it has some limitations:
Financial operations beyond budgets – The system does not handle payroll, invoices, taxes, or other financial transactions outside of project budgets.
Detailed scheduling and resource conflicts – Assignments of staff and equipment are tracked, but the database cannot automatically detect overlapping schedules or availability conflicts.
Physical tracking of equipment – Equipment is recorded for projects, but real-time location or inventory management is not included.
Complex project dependencies – Dependencies between tasks or phases within a project are not represented.
Historical changes beyond soft deletion – While staff records can be deactivated using a soft delete (activo = FALSE), detailed historical tracking of changes in projects, budgets, or equipment assignments is not fully implemented.
These limitations should be considered when planning extensions, reporting, or automated project management features.


