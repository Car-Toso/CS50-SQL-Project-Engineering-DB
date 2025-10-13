-- INSERT SAMPLE DATA
INSERT INTO staff (first_name, last_name, position, hire_date, email)
VALUES
-- Engineers (3)
('Lucas', 'Fernandez', 'Engineer', '2022-03-15', 'lucas.fernandez@example.com'),
('Sophia', 'Gonzalez', 'Engineer', '2021-07-01', 'sophia.gonzalez@example.com'),
('Matias', 'Romero', 'Engineer', '2023-01-20', 'matias.romero@example.com'),
-- Drafter (1)
('Camila', 'Vargas', 'Drafter', '2022-11-05', 'camila.vargas@example.com'),
-- Machinists / Lathe Operators (2)
('Diego', 'Martinez', 'Lathe Operator', '2020-06-10', 'diego.martinez@example.com'),
('Marcos', 'Lopez', 'Machinist', '2021-09-12', 'marcos.lopez@example.com'),
-- Welders and Assemblers (4)
('Andres', 'Rojas', 'Welder', '2022-02-18', 'andres.rojas@example.com'),
('Lucia', 'Herrera', 'Assembler', '2023-03-22', 'lucia.herrera@example.com'),
('Javier', 'Sanchez', 'Welder', '2021-08-30', 'javier.sanchez@example.com'),
('Valentina', 'Perez', 'Assembler', '2022-12-14', 'valentina.perez@example.com');

INSERT INTO clients (name, address, industry, city)
VALUES
('GreenTech Industries', '123 Green St', 'Renewable Energy', 'Rosario'),
('AgroPlus Corp', '456 Farm Rd', 'Agriculture', 'Santa Fe'),
('MetalWorks Ltd', '789 Industrial Ave', 'Manufacturing', 'Rosario'),
('UrbanBuild Co', '321 City Blvd', 'Construction', 'Córdoba'),
('Foodies Inc', '654 Gourmet Ln', 'Food & Beverage', 'Buenos Aires');

INSERT INTO contacts (client_id, first_name, last_name, phone, email, position)
VALUES
-- GreenTech Industries (2 contacts)
(1, 'Alice', 'Johnson', '+541123456789', 'alice.johnson@greentech.com', 'Project Manager'),
(1, 'Robert', 'Smith', '+541198765432', 'robert.smith@greentech.com', 'Technical Lead'),
-- AgroPlus Corp (2 contacts)
(2, 'Maria', 'Lopez', '+541112233445', 'maria.lopez@agroplus.com', 'Agronomy Manager'),
(2, 'Juan', 'Gomez', '+541155667788', 'juan.gomez@agroplus.com', 'Operations Coordinator'),
-- MetalWorks Ltd (2 contacts)
(3, 'Emma', 'Davis', '+541122334455', 'emma.davis@metalworks.com', 'Production Manager'),
(3, 'Liam', 'Brown', '+541177889900', 'liam.brown@metalworks.com', 'Quality Supervisor'),
-- UrbanBuild Co (1 contact)
(4, 'Olivia', 'Wilson', '+541199887766', 'olivia.wilson@urbanbuild.com', 'Site Manager'),
-- Foodies Inc (1 contact)
(5, 'Ethan', 'Taylor', '+541144556677', 'ethan.taylor@foodies.com', 'Supply Chain Manager');

INSERT INTO budgets (client_id, contact_id, date, budget, status)
VALUES
-- GreenTech Industries
(1, 1, '2024-01-15', 50000.00, 'pending'),
(1, 2, '2024-02-20', 75000.00, 'accepted'),
-- AgroPlus Corp
(2, 3, '2024-03-05', 120000.00, 'accepted'),
(2, 4, '2024-03-18', 90000.00, 'rejected'),
-- MetalWorks Ltd
(3, 5, '2024-01-30', 60000.00, 'pending'),
(3, 6, '2024-02-25', 85000.00, 'accepted'),
-- UrbanBuild Co
(4, 7, '2024-04-01', 110000.00, 'pending'),
-- Foodies Inc
(5, 8, '2024-03-10', 45000.00, 'accepted'),
(5, 8, '2024-03-25', 50000.00, 'rejected'),
(5, 8, '2024-04-05', 47000.00, 'pending');

INSERT INTO projects (client_id, contact_id, budget_id, name, address, city, amount, start_date, end_date)
VALUES
-- Completed Projects
(1, 1, 1, 'Solar Panel Installation', '123 Green St', 'Rosario', 52000.00, '2024-02-01', '2024-06-01'),
(1, 2, 2, 'Wind Turbine Setup', '125 Green St', 'Rosario', 70000.00, '2024-03-01', '2024-07-15'),
(2, 3, 3, 'Irrigation System Upgrade', '456 Farm Rd', 'Santa Fe', 125000.00, '2024-04-01', '2024-08-30'),
(2, 4, 4, 'Greenhouse Expansion', '458 Farm Rd', 'Santa Fe', 85000.00, '2024-05-01', '2024-09-15'),
(3, 5, 5, 'Factory Equipment Maintenance', '789 Industrial Ave', 'Rosario', 62000.00, '2024-02-15', '2024-06-15'),
(3, 6, 6, 'New Production Line Setup', '790 Industrial Ave', 'Rosario', 83000.00, '2024-03-10', '2024-07-20'),

-- Ongoing Projects
(4, 7, 7, 'Office Building Construction', '321 City Blvd', 'Córdoba', 115000.00, '2025-01-01', '2025-12-31'),
(5, 8, 10, 'Supply Chain Optimization', '658 Gourmet Ln', 'Buenos Aires', 48000.00, '2025-08-01', '2025-12-01'),

-- Pending Projects
(5, 8, 8, 'Food Packaging Automation', '654 Gourmet Ln', 'Buenos Aires', 44000.00, '2025-09-01', '2025-12-01'),
(5, 8, 9, 'New Warehouse Setup', '656 Gourmet Ln', 'Buenos Aires', 53000.00, '2025-10-01', '2026-01-15');

INSERT INTO staff_project (staff_id, project_id, role, assignment_date, unassignment_date, assigned_hours)
VALUES
-- Completed Projects (1–6)
(1, 1, 'Engineer', '2024-02-01', '2024-06-01', 100),
(5, 1, 'Lathe Operator', '2024-02-05', '2024-05-30', 80),
(7, 1, 'Welder', '2024-02-10', '2024-05-25', 60),
(2, 2, 'Engineer', '2024-03-01', '2024-07-15', 90),
(6, 2, 'Machinist', '2024-03-05', '2024-07-10', 70),
(8, 2, 'Assembler', '2024-03-10', '2024-07-05', 60),
(3, 3, 'Engineer', '2024-04-01', '2024-08-30', 110),
(5, 3, 'Lathe Operator', '2024-04-05', '2024-08-25', 75),
(9, 3, 'Welder', '2024-04-10', '2024-08-20', 65),
(1, 4, 'Engineer', '2024-05-01', '2024-09-15', 85),
(6, 4, 'Machinist', '2024-05-05', '2024-09-10', 70),
(10, 4, 'Assembler', '2024-05-10', '2024-09-05', 60),
(2, 5, 'Engineer', '2024-02-15', '2024-06-15', 95),
(5, 5, 'Lathe Operator', '2024-02-20', '2024-06-10', 70),
(7, 5, 'Welder', '2024-02-25', '2024-06-05', 60),
(3, 6, 'Engineer', '2024-03-10', '2024-07-20', 105),
(6, 6, 'Machinist', '2024-03-15', '2024-07-15', 75),
(8, 6, 'Assembler', '2024-03-20', '2024-07-10', 65),

-- Ongoing Projects (7–8)
(1, 7, 'Engineer', '2025-01-01', '2025-12-31', 120),
(9, 7, 'Welder', '2025-01-05', '2025-12-15', 80),
(10, 7, 'Assembler', '2025-01-10', '2025-12-01', 70),
(1, 8, 'Engineer', '2025-08-01', '2025-12-01', 60),
(5, 8, 'Lathe Operator', '2025-08-05', '2025-12-01', 50),
(9, 8, 'Welder', '2025-08-10', '2025-12-01', 50),

-- Pending Projects (9–10)
(2, 9, 'Engineer', '2025-09-01', '2025-12-01', 0),
(6, 9, 'Machinist', '2025-09-01', '2025-12-01', 0),
(8, 9, 'Assembler', '2025-09-01', '2025-12-01', 0),
(3, 10, 'Engineer', '2025-10-01', '2026-01-15', 0),
(5, 10, 'Lathe Operator', '2025-10-01', '2026-01-15', 0),
(9, 10, 'Welder', '2025-10-01', '2026-01-15', 0);

INSERT INTO equipments_project (equipment_id, project_id, assignment_date, unassignment_date, assigned_hours)
VALUES
-- Completed Projects
(1, 1, '2024-02-01', '2024-06-01', 80),
(2, 1, '2024-02-05', '2024-05-30', 70),
(1, 2, '2024-03-01', '2024-07-15', 75),
(3, 2, '2024-03-05', '2024-07-10', 65),
(2, 3, '2024-04-01', '2024-08-30', 85),
(4, 3, '2024-04-05', '2024-08-25', 70),
(3, 4, '2024-05-01', '2024-09-15', 80),
(5, 4, '2024-05-05', '2024-09-10', 65),
(1, 5, '2024-02-15', '2024-06-15', 75),
(4, 5, '2024-02-20', '2024-06-10', 65),
(2, 6, '2024-03-10', '2024-07-20', 80),
(3, 6, '2024-03-15', '2024-07-15', 70),

-- Ongoing Projects
(5, 7, '2025-01-01', '2025-12-31', 90),
(1, 8, '2025-08-01', '2025-12-01', 50),
(2, 8, '2025-08-05', '2025-12-01', 45),

-- Pending Projects
(3, 9, '2025-09-01', '2025-12-01', 0),
(4, 9, '2025-09-01', '2025-12-01', 0),
(1, 10, '2025-10-01', '2026-01-15', 0),
(5, 10, '2025-10-01', '2026-01-15', 0);

INSERT INTO equipments (name, description, active)
VALUES
('CNC Milling Machine', 'High precision milling machine for metal components', TRUE),
('Welding Machine', 'Industrial welding equipment for assembly and fabrication', TRUE),
('Lathe Machine', 'Lathe for machining cylindrical parts', TRUE),
('3D Printer', 'Industrial 3D printer for prototyping', TRUE),
('Laser Measurement System', 'Laser equipment for precise dimensional measurements', TRUE),
('Scissor Lift', 'Mobile scissor lift for working at height', TRUE),
('Hydraulic Press', 'Press for forming metal parts', TRUE),
('Surface Grinder', 'Machine for surface finishing of metal pieces', TRUE),
('Old Lathe', 'Out of service, sold to another company', FALSE),
('Portable Welding Kit', 'Small welding kit, temporarily out of service', FALSE);


--PROJECT AND STATUS
SELECT p.name, p.start_date, p.end_date,
       CASE
           WHEN p.end_date < DATE('now') THEN 'Completed'
           WHEN p.start_date > DATE('now') THEN 'Pending'
           ELSE 'Ongoing'
       END AS status
FROM projects p;

--BUDGET DEVIATION VS ACTUAL EXPENDITURE
SELECT p.name, b.budget, p.amount,
       p.amount - b.budget AS variance
FROM projects p
JOIN budgets b ON p.budget_id = b.id;

--TOP 5 HOURS ASSIGNED BY STAFF
SELECT s.first_name || ' ' || s.last_name AS staff_name,
       SUM(sp.assigned_hours) AS total_hours
FROM staff s
JOIN staff_project sp ON s.id = sp.staff_id
GROUP BY s.id
ORDER BY total_hours DESC
LIMIT 5;

--TEAMS ASSIGNED TO ACTIVE PROJECTS
SELECT e.name AS equipment, p.name AS project, ep.assigned_hours
FROM equipments e
JOIN equipments_project ep ON e.id = ep.equipment_id
JOIN projects p ON p.id = ep.project_id
WHERE p.end_date >= DATE('now');

--CLIENTS WITH THE NUMBER OF PROJECTS
SELECT c.name AS client, COUNT(p.id) AS projects_count
FROM clients c
LEFT JOIN projects p ON c.id = p.client_id
GROUP BY c.id;

--STAFF WITH SIMULTANEOUS PROJECTS
SELECT s.first_name || ' ' || s.last_name AS staff_name,
       COUNT(sp.project_id) AS active_projects
FROM staff s
JOIN staff_project sp ON s.id = sp.staff_id
JOIN projects p ON p.id = sp.project_id
WHERE DATE('now') BETWEEN p.start_date AND p.end_date
GROUP BY s.id
HAVING active_projects > 1
ORDER BY active_projects DESC;

--OVERBUDGET
SELECT p.name AS project, b.budget AS budgeted, p.amount AS actual, (p.amount - b.budget) AS variance
FROM projects p
JOIN budgets b ON p.budget_id = b.id
WHERE p.amount > b.budget
ORDER BY variance DESC;


