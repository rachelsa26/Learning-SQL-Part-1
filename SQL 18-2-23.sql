#Membuat database
CREATE DATABASE db_fakultas;

#Menggunakan database mana sebagai penyimpanan data tabel 
USE db_fakultas;

#Membuat table
CREATE TABLE tb_mahasiswa(
	nim INT(5) ZEROFILL NOT NULL,
    nama VARCHAR(50) NOT NULL,
    usia INT,
    tahun_masuk INT NOT NULL,
    prodi ENUM('IF','TI'),
    primary key (nim)
    ) ENGINE InnoDB;

#Melihat detail tabel
DESCRIBE tb_mahasiswa;

#Melihat bagaimana struktur tabel dibuat
SHOW CREATE TABLE tb_mahasiswa;

#Menampilkan tabel dalam database
SHOW TABLES;

#Menginputkan satu baris data
INSERT INTO tb_mahasiswa (nim, nama, usia, tahun_masuk, prodi)
VALUES (1, 'ELSA', 20, 2018, 'IF');

#Menginputkan beberapa baris data
INSERT INTO tb_mahasiswa (nim, nama, usia, tahun_masuk, prodi)
VALUES (2, 'ELA', 21, 2019, 'IF'),
(3, 'ARA', 18, 2018, 'TI'),
(4, 'SARAH', 19, 2019, 'IF'),
(5, 'YOHANA', 20, 2020, 'IF');

#Menginputkan beberapa baris data
INSERT INTO tb_mahasiswa (nim, nama, usia, tahun_masuk, prodi)
VALUES (6, 'RACHEL', 21, 2019, 'IF'),
(7, 'YOGI', 22, 2018, 'TI'),
(8, 'SENA', 18, 2019, 'IF'),
(9, 'MIRA', 18, 2020,'IF'),
(10, 'DONGHAE', 18, 2018, 'TI'),
(11, 'YOONA', 18, 2019,'IF'),
(12, 'ADOLF', 18, 2020,'IF'),
(13, 'ABDUL', 18, 2018,'TI'),
(14, 'INTAN', 18, 2019,'IF'),
(15, 'YUNUS', 18, 2020, 'IF');

#Menginputkan beberapa baris data
INSERT INTO tb_mahasiswa (nim, nama, usia, tahun_masuk, prodi)
VALUES (16, 'HANI', 19, 2023, 'TI'),
(17, 'ANNA', 19, 2015, 'TI'),
(18, 'YOSI', 19, 2019, 'TI'),
(19, 'DIANDRA', 19, 2015, 'TI'),
(20, 'MIRAE', 22, 2015, 'TI'),
(21, 'GRACE', 21, 2016, 'IF'),
(22, 'SUNY', 19, 2023, 'TI'),
(23, 'ELENA', 19, 2015, 'TI'),
(24, 'EVA', 19, 2016, 'TI'),
(25, 'YENI', 18, 2015, 'IF');

#Melihat isi tabel
SELECT * FROM tb_mahasiswa;

#Melihat beberapa kolom dari tabel
SELECT nama, prodi FROM tb_mahasiswa;

#Melihat setiap data yang berbeda dari kolom
SELECT DISTINCT tahun_masuk FROM tb_mahasiswa;

#Melihat jumlah value pada kolom 'nim' yang berbeda
SELECT COUNT(DISTINCT nim) FROM tb_mahasiswa;

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT nama 
FROM tb_mahasiswa
WHERE prodi = 'IF' AND tahun_masuk >= 2019;

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT nama 
FROM tb_mahasiswa
WHERE tahun_masuk BETWEEN 2018 AND 2019;

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT * FROM tb_mahasiswa
WHERE nama LIKE 'E%';

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT * FROM tb_mahasiswa
WHERE nama LIKE '%A' AND prodi = 'IF';

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT * FROM tb_mahasiswa
WHERE prodi IN ('IF');

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT * FROM tb_mahasiswa
WHERE prodi IN ('IF') or tahun_masuk = 2019; 

#Melihat informasi dari tabel dengan kondisi tertentu
SELECT nim, nama
FROM tb_mahasiswa
WHERE NOT tahun_masuk = 2019; 

#Melihat data tabel dengan mengurutkan berdasarkan kolom tertentu
SELECT * FROM tb_mahasiswa
ORDER BY nama;

#Melihat data tabel dengan mengurutkan berdasarkan kolom tertentu
SELECT nim, nama
FROM tb_mahasiswa
WHERE NOT tahun_masuk = 2019
ORDER BY nama;

#Melihat data tabel dengan mengurutkan dari atas berdasarkan kolom tertentu
SELECT * FROM tb_mahasiswa
ORDER BY nama ASC;

#Melihat data tabel dengan mengurutkan dari bawah berdasarkan kolom tertentu
SELECT * FROM tb_mahasiswa
ORDER BY nama DESC;

#Melihat data dari tabel mahasiswa yang kolom tahun_masuk kosong atau berisi nilai null
SELECT * FROM tb_mahasiswa
WHERE tahun_masuk IS NULL;

#Mengubah data dalam kolom tabel
SET SQL_SAFE_UPDATES=1;
SET SQL_SAFE_UPDATES=0; #agar dapat melakukan update tabel dengan tidak berdasarkan primary key

UPDATE tb_mahasiswa
SET tahun_masuk = '2017'
WHERE prodi = 'IF';

#Mengubah data dalam kolom  tabel
UPDATE tb_mahasiswa
SET nama = 'ELSA SIAHAAN'
WHERE nim = '00001';

#Menghapus data dari tabel 
DELETE FROM tb_mahasiswa
WHERE nim = '00014'

#Menghapus data di dalam tabel
#TRUNCATE TABLE tb_mahasiswa;

#Menghapus tabel
#DROP tables tb_mahasiswa;

SELECT * FROM tb_mahasiswa 
LIMIT 3;

#Melihat value terkecil/sedikit dari kolom
SELECT MIN(prodi) AS Jurusan_paling_sedikit
FROM tb_mahasiswa;

#Melihat banyaknya data dari suatu kolom 
SELECT COUNT(usia)
FROM tb_mahasiswa;

##Melihat jumlah data dari suatu kolom 
SELECT SUM(usia)
FROM tb_mahasiswa;

#Melihat rata rata nilai data dari suatu kolom 
SELECT avg(usia)
FROM tb_mahasiswa;

#Melihat data dalam tabel dengan kondisi dalam setiap data kolom ada huruf tertentu
SELECT * FROM tb_mahasiswa
WHERE nama LIKE '%g%';

#Melihat data dalam tabel dengan kondisi dalam setiap data kolom diawali huruf tertentu
SELECT * FROM tb_mahasiswa
WHERE nama LIKE 'g%';

#Melihat data dalam tabel dengan kondisi dalam setiap data kolom diakhiri huruf tertentu
SELECT * FROM tb_mahasiswa
WHERE nama LIKE '%a';

#Melihat data dalam tabel dengan kondisi value apa pun dalam kolom yang memiliki huruf "a" di posisi kedua
SELECT * FROM tb_mahasiswa
WHERE nama LIKE '_a%';

#Melihat data dalam tabel dengan kondisi values apa pun dalam kolom yang memiliki huruf awal "e" dan huruf terakhir "a"
SELECT * FROM tb_mahasiswa
WHERE nama LIKE 'e%a';



