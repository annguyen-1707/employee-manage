USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'Manage_employee')
BEGIN
	ALTER DATABASE Manage_employee SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE Manage_employee SET ONLINE;
	DROP DATABASE Manage_employee;
END
--=========================================================================
-- create database

CREATE DATABASE Manage_employee
GO

USE Manage_employee
GO

--=========================================================================
-- create table


create table Department(
  department_id int primary key IDENTITY(1,1),
  name nvarchar(200)
)

create table Role(
  role_id int primary key IDENTITY(1,1),
  name nvarchar(200)
)

create table Employee(
  employee_id int primary key IDENTITY(1,1),
  name nvarchar(200),
  gender varchar(10) check (gender in ('Male', 'Female')),
  phone_number int,
  address nvarchar(500),
  department_id int foreign key references Department(department_id),
  manager_id int foreign key references Employee(employee_id),
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  start_workDate date
)
create table Employee_Role(
  role_id int foreign key references Role(role_id),
  employee_id int foreign key references Employee(employee_id),
  primary key(role_id, employee_id)
)

create table Application(
  application_id int primary key IDENTITY(1,1),
  title nvarchar(500),
  start_date date,
  end_date date,
  reason nvarchar(1000),
  status nvarchar(300) default 'In progress' check (status in ('In progress', 'Approved', 'Rejected')),
  created_by int foreign key references Employee(employee_id),
  processed_by int foreign key references Employee(employee_id),
  note nvarchar(1000),
)

create table Feature(
  feature_id int primary key IDENTITY(1,1),
  name nvarchar(500)
)
create table Feature_Role(
  feature_id int foreign key references Feature(feature_id),
  role_id int foreign key references Role(role_id),
  primary key(feature_id, role_id)
)

INSERT INTO Department ( name)
VALUES 
(N'IT'),
(N'QA'),
(N'Sale');

INSERT INTO Role ( name)
VALUES 
(N'Manager'),               -- Quản lý cấp cao
(N'Division Leader'),       -- Trưởng bộ phận
(N'Trưởng nhóm'),           -- Trưởng nhóm (Team Leader)
(N'Nhân viên');             -- Nhân viên

-- Thêm dữ liệu mẫu mới cho Employee
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password,start_workDate)
VALUES 
(N'Nguyễn Văn A', 'Male', '123456789', N'Hà Nội', 1, NULL, 'nguyenvana@company.com', '123456', '2025-01-01');

-- Trưởng phòng (B, C, D) - manager_id = 1 (A)
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password,start_workDate)
VALUES
(N'Trần Thị B', 'Female', '234567890', N'Hồ Chí Minh', 1, 1, 'tranthib@company.com', '123456', '2025-01-01'),
(N'Lê Văn C', 'Male', '345678901', N'Hà Nội', 2, 1, 'levanc@company.com', '123456', '2025-01-01'),
(N'Phạm Thị D', 'Female', '456789012', N'Đà Nẵng', 3, 1, 'phamthid@company.com', '123456', '2025-01-01');

-- Trưởng ban (E, F, G) - manager_id = trưởng phòng tương ứng
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password,start_workDate)
VALUES
(N'Hoàng Văn E', 'Male', '567890123', N'Hà Nội', 1, 2, 'hoangvane@company.com', '123456', '2025-02-01'),
(N'Ngô Thị F', 'Female', '678901234', N'Hồ Chí Minh', 2, 3, 'ngothif@company.com', '123456','2025-02-01'),
(N'Đặng Văn G', 'Male', '789012345', N'Đà Nẵng', 3, 4, 'dangvang@company.com', '123456','2025-02-01');

-- Nhân viên phòng 1 (manager_id = trưởng ban E)
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password,start_workDate)
VALUES
(N'Bùi Thị H', 'Female', '890123456', N'Hà Nội', 1, 5, 'buithih@company.com', '123456','2025-02-15'),
(N'Vũ Văn I', 'Male', '901234567', N'Hải Phòng', 1, 5, 'vuvani@company.com', '123456','2025-02-15');

-- Nhân viên phòng 2 (manager_id = trưởng ban F)
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password,start_workDate)
VALUES
(N'Nguyễn Thị K', 'Female', '123123123', N'Cần Thơ', 2, 6, 'nguyenthik@company.com', '123456','2025-02-15'),
(N'Lê Văn L', 'Male', '234234234', N'Huế', 2, 6, 'levanl@company.com', '123456','2025-03-01');

-- Nhân viên phòng 3 (manager_id = trưởng ban G)
INSERT INTO Employee (name, gender, phone_number, address, department_id, manager_id, email, password, start_workDate)
VALUES
(N'Trần Thị M', 'Female', '345345345', N'Bắc Giang', 3, 7, 'tranthim@company.com', '123456','2025-03-01'),
(N'Hoàng Văn N', 'Male', '456456456', N'Hà Nội', 3, 7, 'hoangvann@company.com', '123456','2025-03-01');


-- Dữ liệu mẫu Employee_Role (Mỗi nhân viên có thể có nhiều vai trò)

-- Giám đốc hoặc trưởng phòng
INSERT INTO Employee_Role (role_id, employee_id) VALUES (1, 1); -- Nguyễn Văn A là Manager IT

INSERT INTO Employee_Role (role_id, employee_id) VALUES (2, 2); -- Trần Thị B là Trưởng nhóm IT
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 2); -- Trần Thị B là nhân viên IT

INSERT INTO Employee_Role (role_id, employee_id) VALUES (2, 3); -- Lê Văn C là Division Leader QA
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 3); -- Lê Văn C là nhan vien QA

INSERT INTO Employee_Role (role_id, employee_id) VALUES (2, 4); -- Phạm Thị D là Division Leader Sale
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 4); -- Phạm Thị D là nhan vien Sale

-- Trưởng nhóm
INSERT INTO Employee_Role (role_id, employee_id) VALUES (3, 5);  -- Hoàng Văn E - Trưởng nhóm IT
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 5);  -- Hoàng Văn E - nhan vien IT

INSERT INTO Employee_Role (role_id, employee_id) VALUES (3, 6);  -- Ngô Thị F - Trưởng nhóm QA
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 6);  -- Ngô Thị F - nhan vien QA

INSERT INTO Employee_Role (role_id, employee_id) VALUES (3, 7);  -- Đặng Văn G - Trưởng nhóm SALE
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 7);  -- Đặng Văn G - nhan vien SALE

-- Nhân viên
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 8); -- Bùi Thị H là nhan vien IT
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 9);  -- Vũ Văn I - Nhân viên IT

INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 10); -- Nguyễn Thị K - Nhân viên QA
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 11); -- Lê Văn L là Nhân viên qa

INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 12); -- Trần Thị M - Nhân viên Sale
INSERT INTO Employee_Role (role_id, employee_id) VALUES (4, 13); -- Hoàng Văn N - Nhân viên Sale


-- Application Data (Đơn nghỉ phép)
-- Đơn xin nghỉ từ nhân viên (cần được duyệt bởi trưởng nhóm, trưởng phòng và giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ nhân viên IT (Bùi Thị H)
(N'Xin nghỉ phép ốm', '2024-03-20', '2024-03-21', N'Bị ốm nặng', 'In progress', 8, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-03-25', '2024-03-26', N'Có việc gia đình', 'In progress', 8, NULL, NULL),

-- Đơn từ nhân viên IT (Vũ Văn I)
(N'Xin nghỉ phép năm', '2024-04-01', '2024-04-05', N'Nghỉ phép năm', 'In progress', 9, NULL, NULL),
(N'Xin nghỉ phép ốm', '2024-04-10', '2024-04-11', N'Bị ốm', 'In progress', 9, NULL, NULL),

-- Đơn từ nhân viên QA (Nguyễn Thị K)
(N'Xin nghỉ phép ốm', '2024-03-22', '2024-03-23', N'Bị ốm', 'In progress', 10, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-04-02', '2024-04-03', N'Có việc gia đình', 'In progress', 10, NULL, NULL),

-- Đơn từ nhân viên QA (Lê Văn L)
(N'Xin nghỉ phép năm', '2024-04-15', '2024-04-19', N'Nghỉ phép năm', 'In progress', 11, NULL, NULL),
(N'Xin nghỉ phép ốm', '2024-04-20', '2024-04-21', N'Bị ốm', 'In progress', 11, NULL, NULL),

-- Đơn từ nhân viên Sale (Trần Thị M)
(N'Xin nghỉ phép ốm', '2024-03-24', '2024-03-25', 'Bị ốm', N'In progress', 12, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-04-05', '2024-04-06', N'Có việc gia đình', 'In progress', 12, NULL, NULL),

-- Đơn từ nhân viên Sale (Hoàng Văn N)
(N'Xin nghỉ phép năm', '2024-04-10', '2024-04-14', N'Nghỉ phép năm', 'In progress', 13, NULL, NULL),
(N'Xin nghỉ phép ốm', '2024-04-15', '2024-04-16', N'Bị ốm', 'In progress', 13, NULL, NULL);

-- Đơn xin nghỉ từ trưởng nhóm (cần được duyệt bởi trưởng phòng và giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ trưởng nhóm IT (Hoàng Văn E)
(N'Xin nghỉ phép ốm', '2024-03-21', '2024-03-22', N'Bị ốm nặng', 'In progress', 5, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-03-26', '2024-03-27', N'Có việc gia đình', 'In progress', 5, NULL, NULL),

-- Đơn từ trưởng nhóm QA (Ngô Thị F)
(N'Xin nghỉ phép năm', '2024-04-02', '2024-04-06', N'Nghỉ phép năm', 'In progress', 6, NULL, NULL),
(N'Xin nghỉ phép ốm', '2024-04-11', '2024-04-12', N'Bị ốm', 'In progress', 6, NULL, NULL),

-- Đơn từ trưởng nhóm Sale (Đặng Văn G)
(N'Xin nghỉ phép ốm', '2024-03-23', '2024-03-24', N'Bị ốm', 'In progress', 7, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-04-03', '2024-04-04', N'Có việc gia đình', 'In progress', 7, NULL, NULL);

-- Đơn xin nghỉ từ trưởng phòng (cần được duyệt bởi giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ trưởng phòng IT (Trần Thị B)
(N'Xin nghỉ phép ốm', '2024-03-22', '2024-03-23', N'Bị ốm nặng', 'In progress', 2, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-03-27', '2024-03-28', N'Có việc gia đình', 'In progress', 2, NULL, NULL),

-- Đơn từ trưởng phòng QA (Lê Văn C)
(N'Xin nghỉ phép năm', '2024-04-03', '2024-04-07', N'Nghỉ phép năm', 'In progress', 3, NULL, NULL),
(N'Xin nghỉ phép ốm', '2024-04-12', '2024-04-13', N'Bị ốm', 'In progress', 3, NULL, NULL),

-- Đơn từ trưởng phòng Sale (Phạm Thị D)
(N'Xin nghỉ phép ốm', '2024-03-24', '2024-03-25', N'Bị ốm', 'In progress', 4, NULL, NULL),
(N'Xin nghỉ phép gia đình', '2024-04-04', '2024-04-05', N'Có việc gia đình', 'In progress', 4, NULL, NULL);

-- Đơn xin nghỉ từ giám đốc (không cần duyệt)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ giám đốc (Nguyễn Văn A)
(N'Xin nghỉ phép ốm', '2024-03-25', '2024-03-26', N'Bị ốm nặng', 'Approved', 1, 1, N'Tự duyệt'),
(N'Xin nghỉ phép gia đình', '2024-04-05', '2024-04-06', N'Có việc gia đình', 'Approved', 1, 1, N'Tự duyệt'),
(N'Xin nghỉ phép năm', '2024-04-15', '2024-04-19', N'Nghỉ phép năm', 'Approved', 1, 1, N'Tự duyệt');


                                                SELECT MIN(er.role_id) AS min_role_id
select * FROM Employee e
FULL JOIN Employee_Role er 
    ON e.employee_id = er.employee_id
WHERE e.employee_id = 2
GROUP BY e.employee_id, e.name;

												
 select * from Application where status='approved'
