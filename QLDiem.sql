CREATE DATABASE QLDiem;
USE QLDiem;

CREATE TABLE SinhVien (
    MaSV char(10) PRIMARY KEY,
    HoSV varchar(50),
    Ten varchar(50),
    Ngaysinh Datetime,
    Phai char(3),
    Makhoa char(5),
    FOREIGN KEY (Makhoa) REFERENCES Khoa(Makhoa)
);

CREATE TABLE Khoa (
    Makhoa char(5) PRIMARY KEY,
    Tenkhoa varchar(50)
);

CREATE TABLE MonHoc (
    MaMH char(10) PRIMARY KEY,
    TenMH varchar(50)
);

CREATE TABLE KetQua (
    MaSV char(10),
    MaMH char(10),
    Lanthi int DEFAULT 1,
    Diem numeric(5,1),
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

-- Câu 2: Tạo ràng buộc duy nhất cho trường Tenkhoa của bảng Khoa

ALTER TABLE Khoa
ADD CONSTRAINT UC_Tenkhoa UNIQUE (Tenkhoa);

-- Câu 3: Kiểm tra dữ liệu nhập vào cho trường Phai của bảng SinhVien chỉ nhận giá trị “Nam” và “Nữ”

ALTER TABLE SinhVien
ADD CONSTRAINT CK_Phai CHECK (Phai IN ('Nam', 'Nữ'));

-- Câu 4: Kiểm tra Diem nhập cho trường điểm nằm trong khoảng 010

ALTER TABLE KetQua
ADD CONSTRAINT CK_Diem CHECK (Diem >= 0 AND Diem <= 10);

-- Thêm thông tin vào bảng Khoa
INSERT INTO Khoa (Makhoa, Tenkhoa) VALUES 
('AVAN', N'Khoa anh văn'),
('CNTT', N'Khoa công nghệ thông tin'),
('DTVT', N'Khoa điện tử viễn thông'),
('QTKD', N'Khoa quản trị kinh doanh');

INSERT INTO SinhVien (HoSV, Ten, MaSV, Ngaysinh, Phai, Makhoa) VALUES
(N'Trần Minh',N'Sơn','S001','1985-05-01 12:00:00',N'Nam','CNTT'),
(N'Nguyễn Quốc',N'Bảo','S002','1986-05-16 12:00:00',N'Nam','CNTT'),
(N'Phan Anh',N'Tùng','S003','1983-12-20 12:00:00',N'Nam','QTKD'),
(N'Bùi Thị Anh',N'Thư','S004','1985-02-01 12:00:00',N'Nữ','QTKD'),
(N'Lê Thị',N'Lan','S005','1987-07-03 12:00:00',N'Nữ','DTVT'),
(N'Nguyễn Thị',N'Lam','S006','1984-11-11 12:00:00',N'Nữ','DTVT'),
(N'Phan Thị',N'Hà','S007','1988-07-03 12:00:00',N'Nữ','CNTT'),
(N'Trần Thế',N'Dũng','S008','1985-12-21 12:00:00',N'Nam','CNTT');

ALTER TABLE MonHoc ADD Sotiet int;


insert into MonHoc(TenMH, MaMH, Sotiet) values
('Anh van', 'AV', '45'),
('Co so du lieu', 'CSDL', '45'),
('Ki thuat lap trinh', 'KTLT', '60'),
('Ke toan tai chinh', 'KTTC', '45'),
('Toan cao cap', 'TCC', '60'),
('Tin hoc van phong', 'THVP', '30'),
('Tri tue nhan tao', 'TTNT', '60');

insert into KetQua(MaSV, MaMH, Lanthi, Diem) values
('S001', 'CSDL', '1', '4'),
('S001', 'TCC', '1', '6'),
('S002', 'CSDL', '1', '3'),
('S002', 'TCC', '2', '6'),
('S003', 'KTTC', '1', '5'),
('S004', 'AV', '1', '8'),
('S004', 'THVP', '1', '4'),
('S004', 'TCC', '2', '8'),
('S006', 'TCC', '1', '5'),
('S007', 'AV', '1', '2'),
('S007', 'CSDL', '2', '9'),
('S007', 'KTLT', '1', '6'),
('S008', 'AV', '1', '7');

SELECT * FROM Khoa;
select * from SinhVien;
select * from MonHoc;
select * from KetQua;
