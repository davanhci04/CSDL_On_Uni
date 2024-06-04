create database CSDL;
use csdl;

-- Tạo bảng Sân bóng
CREATE TABLE Sân_bóng (
  Mã_sân INT PRIMARY KEY,
  Tên_sân VARCHAR(255) NOT NULL
);

-- Tạo bảng Khung giờ
CREATE TABLE Khung_giờ (
  Mã_khung_giờ INT PRIMARY KEY,
  Tên_khung_giờ VARCHAR(255) NOT NULL,
  Giờ_bắt_đầu TIME NOT NULL,
  Giờ_kết_thúc TIME NOT NULL,
  Loại_ngày VARCHAR(255) NOT NULL
);

-- Tạo bảng Đội bóng
CREATE TABLE Đội_bóng (
  Mã_đội_bóng INT PRIMARY KEY,
  Tên_đội_bóng VARCHAR(255) NOT NULL,
  Người_liên_hệ VARCHAR(255) NOT NULL
);

-- Tạo bảng Phiếu thuê
CREATE TABLE Phiếu_thuê (
  Mã_phiếu_thuê INT PRIMARY KEY,
  Mã_sân INT NOT NULL,
  Mã_khung_giờ INT NOT NULL,
  Mã_đội_bóng INT NOT NULL,
  Ngày_thuê DATE NOT NULL,
  Số_lượng_người_chơi INT NOT NULL,
  FOREIGN KEY (Mã_sân) REFERENCES Sân_bóng(Mã_sân),
  FOREIGN KEY (Mã_khung_giờ) REFERENCES Khung_giờ(Mã_khung_giờ),
  FOREIGN KEY (Mã_đội_bóng) REFERENCES Đội_bóng(Mã_đội_bóng)
);

