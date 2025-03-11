-- Đơn xin nghỉ từ nhân viên (cần được duyệt bởi trưởng nhóm, trưởng phòng và giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ nhân viên IT (Bùi Thị H)
('Xin nghỉ phép ốm', '2024-03-20', '2024-03-21', 'Bị ốm nặng', 'Pending', 8, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-03-25', '2024-03-26', 'Có việc gia đình', 'Pending', 8, NULL, NULL),

-- Đơn từ nhân viên IT (Vũ Văn I)
('Xin nghỉ phép năm', '2024-04-01', '2024-04-05', 'Nghỉ phép năm', 'Pending', 9, NULL, NULL),
('Xin nghỉ phép ốm', '2024-04-10', '2024-04-11', 'Bị ốm', 'Pending', 9, NULL, NULL),

-- Đơn từ nhân viên QA (Nguyễn Thị K)
('Xin nghỉ phép ốm', '2024-03-22', '2024-03-23', 'Bị ốm', 'Pending', 10, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-04-02', '2024-04-03', 'Có việc gia đình', 'Pending', 10, NULL, NULL),

-- Đơn từ nhân viên QA (Lê Văn L)
('Xin nghỉ phép năm', '2024-04-15', '2024-04-19', 'Nghỉ phép năm', 'Pending', 11, NULL, NULL),
('Xin nghỉ phép ốm', '2024-04-20', '2024-04-21', 'Bị ốm', 'Pending', 11, NULL, NULL),

-- Đơn từ nhân viên Sale (Trần Thị M)
('Xin nghỉ phép ốm', '2024-03-24', '2024-03-25', 'Bị ốm', 'Pending', 12, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-04-05', '2024-04-06', 'Có việc gia đình', 'Pending', 12, NULL, NULL),

-- Đơn từ nhân viên Sale (Hoàng Văn N)
('Xin nghỉ phép năm', '2024-04-10', '2024-04-14', 'Nghỉ phép năm', 'Pending', 13, NULL, NULL),
('Xin nghỉ phép ốm', '2024-04-15', '2024-04-16', 'Bị ốm', 'Pending', 13, NULL, NULL);

-- Đơn xin nghỉ từ trưởng nhóm (cần được duyệt bởi trưởng phòng và giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ trưởng nhóm IT (Hoàng Văn E)
('Xin nghỉ phép ốm', '2024-03-21', '2024-03-22', 'Bị ốm nặng', 'Pending', 5, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-03-26', '2024-03-27', 'Có việc gia đình', 'Pending', 5, NULL, NULL),

-- Đơn từ trưởng nhóm QA (Ngô Thị F)
('Xin nghỉ phép năm', '2024-04-02', '2024-04-06', 'Nghỉ phép năm', 'Pending', 6, NULL, NULL),
('Xin nghỉ phép ốm', '2024-04-11', '2024-04-12', 'Bị ốm', 'Pending', 6, NULL, NULL),

-- Đơn từ trưởng nhóm Sale (Đặng Văn G)
('Xin nghỉ phép ốm', '2024-03-23', '2024-03-24', 'Bị ốm', 'Pending', 7, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-04-03', '2024-04-04', 'Có việc gia đình', 'Pending', 7, NULL, NULL);

-- Đơn xin nghỉ từ trưởng phòng (cần được duyệt bởi giám đốc)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ trưởng phòng IT (Trần Thị B)
('Xin nghỉ phép ốm', '2024-03-22', '2024-03-23', 'Bị ốm nặng', 'Pending', 2, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-03-27', '2024-03-28', 'Có việc gia đình', 'Pending', 2, NULL, NULL),

-- Đơn từ trưởng phòng QA (Lê Văn C)
('Xin nghỉ phép năm', '2024-04-03', '2024-04-07', 'Nghỉ phép năm', 'Pending', 3, NULL, NULL),
('Xin nghỉ phép ốm', '2024-04-12', '2024-04-13', 'Bị ốm', 'Pending', 3, NULL, NULL),

-- Đơn từ trưởng phòng Sale (Phạm Thị D)
('Xin nghỉ phép ốm', '2024-03-24', '2024-03-25', 'Bị ốm', 'Pending', 4, NULL, NULL),
('Xin nghỉ phép gia đình', '2024-04-04', '2024-04-05', 'Có việc gia đình', 'Pending', 4, NULL, NULL);

-- Đơn xin nghỉ từ giám đốc (không cần duyệt)
INSERT INTO Application (title, start_date, end_date, reason, status, created_by, processed_by, note)
VALUES
-- Đơn từ giám đốc (Nguyễn Văn A)
('Xin nghỉ phép ốm', '2024-03-25', '2024-03-26', 'Bị ốm nặng', 'Approved', 1, 1, 'Tự duyệt'),
('Xin nghỉ phép gia đình', '2024-04-05', '2024-04-06', 'Có việc gia đình', 'Approved', 1, 1, 'Tự duyệt'),
('Xin nghỉ phép năm', '2024-04-15', '2024-04-19', 'Nghỉ phép năm', 'Approved', 1, 1, 'Tự duyệt'); 