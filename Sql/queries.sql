-- INSERT SAMPLE DATA
INSERT INTO staff (first_name, last_name, position, hire_date, email, active)
VALUES
-- Engineers (3)
('Lucas', 'Fernandez', 'Engineer', '2022-03-15', 'lucas.fernandez@example.com', TRUE),
('Sophia', 'Gonzalez', 'Engineer', '2021-07-01', 'sophia.gonzalez@example.com', TRUE),
('Matias', 'Romero', 'Engineer', '2023-01-20', 'matias.romero@example.com', TRUE),
-- Drafter (1)
('Camila', 'Vargas', 'Drafter', '2022-11-05', 'camila.vargas@example.com', TRUE),
-- Machinists / Lathe Operators (2)
('Diego', 'Martinez', 'Lathe Operator', '2020-06-10', 'diego.martinez@example.com', FALSE),
('Marcos', 'Lopez', 'Machinist', '2021-09-12', 'marcos.lopez@example.com', TRUE),
-- Welders and Assemblers (4)
('Andres', 'Rojas', 'Welder', '2022-02-18', 'andres.rojas@example.com', FALSE),
('Lucia', 'Herrera', 'Assembler', '2023-03-22', 'lucia.herrera@example.com', TRUE),
('Javier', 'Sanchez', 'Welder', '2021-08-30', 'javier.sanchez@example.com', TRUE),
('Valentina', 'Perez', 'Assembler', '2022-12-14', 'valentina.perez@example.com', TRUE);

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

INSERT INTO projects (client_id, contact_id, budget_id, name, address, city, amount, start_date, end_date, status)
VALUES

-- Wind Turbine Setup → presupuesto_id 2
(1, 2, 2, 'Wind Turbine Setup', '125 Green St', 'Rosario', 70000.00, '2024-03-01', '2024-07-15', 'completed'),

-- Irrigation System Upgrade → presupuesto_id 3
(2, 3, 3, 'Irrigation System Upgrade', '456 Farm Rd', 'Santa Fe', 130000.00, '2024-04-01', '2024-08-30', 'completed'),

-- New Production Line Setup → presupuesto_id 6
(3, 6, 6, 'New Production Line Setup', '790 Industrial Ave', 'Rosario', 85000.00, '2024-03-10', '2024-07-20', 'completed'),

-- Supply Chain Optimization → presupuesto_id 10
(5, 8, 10, 'Supply Chain Optimization', '658 Gourmet Ln', 'Buenos Aires', 48000.00, '2025-08-01', NULL, 'in_progress');


INSERT INTO staff_project (staff_id, project_id, role, assignment_date, unassignment_date, assigned_hours)
VALUES
-- Completed Projects
-- Wind Turbine Setup → project_id 2
(2, 2, 'Engineer', '2024-03-01', '2024-07-15', 90),
(6, 2, 'Machinist', '2024-03-05', '2024-07-10', 70),
(8, 2, 'Assembler', '2024-03-10', '2024-07-05', 60),

-- Irrigation System Upgrade → project_id 3
(3, 3, 'Engineer', '2024-04-01', '2024-08-30', 110),
(5, 3, 'Lathe Operator', '2024-04-05', '2024-08-25', 75),
(9, 3, 'Welder', '2024-04-10', '2024-08-20', 65),

-- New Production Line Setup → project_id 6
(3, 6, 'Engineer', '2024-03-10', '2024-07-20', 105),
(6, 6, 'Machinist', '2024-03-15', '2024-07-15', 75),
(8, 6, 'Assembler', '2024-03-20', '2024-07-10', 65),

-- Supply Chain Optimization → project_id 8 (en curso / pending)
(1, 8, 'Engineer', '2025-08-01', NULL, 60),
(5, 8, 'Lathe Operator', '2025-08-05', NULL, 50),
(9, 8, 'Welder', '2025-08-10', NULL, 50);


INSERT INTO equipments_project (equipment_id, project_id, assignment_date, unassignment_date, assigned_hours)
VALUES
-- Completed Projects
-- Wind Turbine Setup → project_id 2
(1, 2, '2024-03-01', '2024-07-15', 75),
(3, 2, '2024-03-05', '2024-07-10', 65),

-- Irrigation System Upgrade → project_id 3
(2, 3, '2024-04-01', '2024-08-30', 85),
(4, 3, '2024-04-05', '2024-08-25', 70),

-- New Production Line Setup → project_id 6
(2, 6, '2024-03-10', '2024-07-20', 80),
(3, 6, '2024-03-15', '2024-07-15', 70),

-- Supply Chain Optimization → project_id 8 (en curso / pending)
(1, 8, '2025-08-01', NULL, 50),
(2, 8, '2025-08-05', NULL, 45);


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

--CLIENTS WITH THE NUMBER OF PROJECTS
SELECT c.name AS client, COUNT(p.id) AS projects_count
FROM clients c
LEFT JOIN projects p ON c.id = p.client_id
GROUP BY c.id;

--OVERBUDGET
SELECT p.name AS project, b.budget AS budgeted, p.amount AS actual, (p.amount - b.budget) AS variance
FROM projects p
JOIN budgets b ON p.budget_id = b.id
WHERE p.amount > b.budget
ORDER BY variance DESC;
