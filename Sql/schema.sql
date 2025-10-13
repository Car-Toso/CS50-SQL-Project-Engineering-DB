--1 STAFF
CREATE TABLE staff (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    position TEXT,
    hire_date DATE,
    email TEXT,
    active BOOLEAN DEFAULT TRUE
);

--2 CLIENTS
CREATE TABLE clients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT,
    industry TEXT,
    city TEXT
);

--3 CONTACTS
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT,
    email TEXT,
    position TEXT,
    FOREIGN KEY(client_id) REFERENCES clients(id)
);

--4 BUDGETS
CREATE TABLE budgets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    date DATE NOT NULL,
    budget REAL NOT NULL,
    status TEXT CHECK(status IN ('pending', 'accepted', 'rejected')) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

--5 PROJECTS
CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    contact_id INTEGER NOT NULL,
    budget_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    address TEXT,
    city TEXT,
    amount REAL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (contact_id) REFERENCES contacts(id),
    FOREIGN KEY (budget_id) REFERENCES budgets(id)
);

--6 STAFF_PROJECT
CREATE TABLE staff_project (
    staff_id INTEGER,
    project_id INTEGER,
    role TEXT,
    assignment_date DATE,
    unassignment_date DATE,
    assigned_hours INTEGER NOT NULL,
    PRIMARY KEY (staff_id, project_id),
    FOREIGN KEY (staff_id) REFERENCES staff(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

--7 EQUIPMENTS PROJECT
CREATE TABLE equipments_project (
    equipment_id INTEGER,
    project_id INTEGER,
    assignment_date DATE,
    unassignment_date DATE,
    assigned_hours INTEGER NOT NULL,
    PRIMARY KEY (equipment_id, project_id),
    FOREIGN KEY (equipment_id) REFERENCES equipments(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

--8 EQUIPMENTS
CREATE TABLE equipments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    active BOOLEAN DEFAULT TRUE
);

-- TRIGGER: Soft delete for staff
CREATE TRIGGER prevent_staff_delete
BEFORE DELETE ON staff
FOR EACH ROW
BEGIN
    UPDATE staff
    SET activo = FALSE
    WHERE id = OLD.id;
END;

-- INDEXES
-- STAFF
CREATE INDEX idx_staff_last_name ON staff(last_name);

-- CLIENTS
CREATE INDEX idx_clients_name ON clients(name);
CREATE INDEX idx_clients_city ON clients(city);

--CONTACTS
CREATE INDEX idx_contacts_client_id ON contacts(client_id);

--BUDGETS
CREATE INDEX idx_budgets_client_id ON budgets(client_id);
CREATE INDEX idx_budgets_contact_id ON budgets(contact_id);
CREATE INDEX idx_budgets_status ON budgets(status);

--PROJECTS
CREATE INDEX idx_projects_client_id ON projects(client_id);
CREATE INDEX idx_projects_contact_id ON projects(contact_id);
CREATE INDEX idx_projects_budget_id ON projects(budget_id);

--STAFF PROJECT
CREATE INDEX idx_staff_project_project_id ON staff_project(project_id);

--EQUIPMENT PROJECT
CREATE INDEX idx_equipment_project_project_id ON equipment_project(project_id);

--EQUIPMENT
CREATE INDEX idx_equipments_name ON equipments(name);
CREATE INDEX idx_equipments_active ON equipments(active);


-- VIEWS
-- ACTIVE STAFF VIEW
-- Shows all staff members who are currently active in the organization.
CREATE VIEW active_staff_view AS
SELECT
    id,
    first_name,
    last_name,
    position,
    hire_date
FROM staff
WHERE active = TRUE;

-- PROJECT DETAIL VIEW
-- Provides basic project information along with associated client details.
CREATE VIEW project_detail_view AS
SELECT
    p.id AS project_id,
    p.name AS project_name,
    c.name AS client,
    p.amount AS amount,
    p.start_date,
    p.end_date
FROM projects p
JOIN clients c ON p.client_id = c.id;

-- STAFF ASSIGNMENT SUMMARY VIEW
-- Summarizes how many projects each staff member is assigned to and the total hours worked.
CREATE VIEW staff_assignment_summary_view AS
SELECT
    s.id AS staff_id,
    s.first_name || ' ' || s.last_name AS staff_name,
    COUNT(DISTINCT sp.project_id) AS total_projects,
    SUM(sp.assigned_hours) AS total_hours
FROM staff s
JOIN staff_project sp ON s.id = sp.staff_id
GROUP BY s.id;

-- STAFF PROJECTS VIEW
-- Lists the projects assigned to each staff member, including role, hours, and client information.
CREATE VIEW staff_projects_view AS
SELECT
    s.id AS staff_id,
    s.first_name || ' ' || s.last_name AS staff_name,
    p.id AS project_id,
    p.name AS project_name,
    c.name AS client_name,
    sp.role,
    sp.assigned_hours
FROM staff s
JOIN staff_project sp ON s.id = sp.staff_id
JOIN projects p ON sp.project_id = p.id
JOIN clients c ON p.client_id = c.id;

-- PROJECT TEAM VIEW
-- Displays the team composition for each project, including roles and assignment dates.
CREATE VIEW project_team_view AS
SELECT
    p.id AS project_id,
    p.name AS project_name,
    s.first_name || ' ' || s.last_name AS staff_name,
    sp.role,
    sp.assignment_date,
    sp.unassignment_date
FROM staff_project sp
JOIN staff s ON sp.staff_id = s.id
JOIN projects p ON sp.project_id = p.id;

-- BUDGET STATUS VIEW
-- Aggregates budget data by client and status, including the number and total amount of budgets.

CREATE VIEW budget_status_view AS
SELECT
    c.name AS client,
    b.status,
    SUM(b.budget) AS total_amount
FROM budgets b
JOIN clients c ON b.client_id = c.id
GROUP BY c.name, b.status;


-- ACTIVE STAFF SUMMARY
CREATE VIEW active_staff_summary AS
SELECT
    s.id,
    s.first_name,
    s.last_name,
    COUNT(sp.project_id) AS project_count
FROM staff s
LEFT JOIN staff_project sp ON s.id = sp.staff_id
WHERE s.active = TRUE
GROUP BY s.id;

-- PROJECTS WITH CLIENT AND BUDGET INFO
CREATE VIEW project_overview AS
SELECT
    p.id AS project_id,
    p.name AS project_name,
    p.start_date,
    p.end_date,
    p.city,
    p.amount AS amount,
    c.name AS client_name,
    b.budget AS quoted_amount,
    b.status AS quotation_status
FROM projects p
JOIN budgets b ON p.budget_id = b.id
JOIN clients c ON p.client_id = c.id;
