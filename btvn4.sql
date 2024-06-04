use QLDiem;

-- 1
delete from Ketqua where MaSV = 'S001';
select * from Ketqua;

-- 2
update MonHoc set Sotiet = 50 where TenMH = 'Tri Tue Nhan Tao';
select * from MonHoc;

-- 3
insert into KetQua (MaSV, MaMH, Lanthi, Diem) values ('S001','CSDL','1','4');
select * from KetQua;

-- 4
update SinhVien set HoSV = N'Nguyễn Thanh', Ten = N'Sơn', Phai = 'Nam' where MaSV = 'S005';
select * from SinhVien; 

-- 5
update SinhVien set Makhoa = 'CNTT' where MaSV = 'S006';
select * from SinhVien; 

-- 6
select * from KetQua where MaSV = 'S007';

-- 7
select * from SinhVien where day(Ngaysinh) = 3 and month(Ngaysinh) = 7;

-- 8
select * from SinhVien where HoSV like '%Anh%';

-- 9 
select sv.HoSV, sv.Ten, kq.MaMH, kq.Lanthi, kq. Diem from SinhVien sv join KetQua kq ON sv.MaSV = kq.MaSV where sv.MaSV = 'S007';

-- 10
select * from SinhVien where Phai = 'Nam' and Makhoa = 'CNTT' order by Ten ASC, HoSV ASC;

-- 11
select * from MonHoc where Sotiet >= '40' and TenMH like 'T%';

-- 12
select * from SinhVien where year(Ngaysinh) <= 2002 and Makhoa in ('CNTT', 'DTVT');

-- 13
select sv.HoSV, sv.Ten, sv.Ngaysinh, k.Tenkhoa from SinhVien sv join Khoa k on sv.Makhoa = k.Makhoa left join KetQua kq on sv.MaSV = kq.MaSV where kq.MaSV is null;

-- 14
select sv.MaSV, sv.HoSV, sv.Ten, sv.Ngaysinh, k.Tenkhoa from SinhVien sv join Khoa k on sv.Makhoa = k.Makhoa left join Ketqua kq on sv.MaSV = kq.MaSV where kq.MaMH = 'AV' order by sv.Ngaysinh DESC;

-- 15
with MaxDiem AS ( select MaSV, max(Diem) AS Diemcaonhat from KetQua group by MaSV)
select sv.MaSV, sv.HoSV, sv.Ten, sv.Ngaysinh from SinhVien sv join MaxDiem md on sv.MaSV = md.MaSV where md.Diemcaonhat = (select max(Diem) from KetQua);

-- 16
select sv.MaSV, sv.HoSV, sv.Ten from SinhVien sv join KetQua kq on sv.MaSV = kq.MaSV where kq.MaMH = 'CSDL' and kq.Lanthi = '1' and kq.Diem <= '5';

-- 17
select sv.MaSV, sv.HoSV, sv.Ten from SinhVien sv join KetQua kq1 on sv.MaSV = kq1.MaSV left join KetQua kq2 on sv.MaSV = kq2.MaSV and kq2.MaMH = 'CSDL' and kq2.Lanthi = '2' where kq1.MaMH = 'CSDL' and kq1.Lanthi = 1 and kq1.Diem <= 5 and kq2.MaSV is null; 