-- SOAL 3.1
-- 1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+

-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) AS selisih FROM produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+

-- 3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+

-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+----------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+

-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+----+--------+----------------+------+------------+------------+------------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com |        2 |
+----+--------+----------------+------+------------+------------+------------------+----------+

-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+----------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 |
+----+--------+----------------+------+------------+------------+-------------------+----------+

-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW()) - YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+


-- SOAL 3.2
-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> SELECT COUNT(*) AS lahir_1998 FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
+------------+
| lahir_1998 |
+------------+
|          1 |
+------------+

-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='Jakarta' AND jk='P';
+----+--------+----------------+------+-----------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+

-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> SELECT SUM(stok) FROM produk WHERE harga_jual < 10000;
+-----------+
| SUM(stok) |
+-----------+
|         5 |
+-----------+

-- 4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko1]> SELECT COUNT(*) FROM produk WHERE kode LIKE 'K%';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+

-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> SELECT AVG(harga_jual) AS harga_rata2 FROM produk WHERE harga_jual > 1000000;
+-------------+
| harga_rata2 |
+-------------+
|     3500000 |
+-------------+

-- 6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko1]> SELECT MAX(stok) AS max_stok FROM produk;
+----------+
| max_stok |
+----------+
|       10 |
+----------+

-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> SELECT COUNT(*) AS kurang_dari_min_stok FROM produk WHERE stok < min_stok;
+----------------------+
| kurang_dari_min_stok |
+----------------------+
|                    1 |
+----------------------+

-- 8.	Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+


-- SOAL 3.3
-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko1]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok < min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS keterangan FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | keterangan     |
+----+------------+------+----------------+
|  1 | TV         |    3 | Stok Aman      |
|  2 | TV 21 Inch |   10 | Stok Aman      |
|  3 | Kulkas     |   10 | Stok Aman      |
|  4 | Meja Makan |    4 | Stok Aman      |
|  5 | Taro       |    3 | Stok Aman      |
|  6 | Teh Kotak  |    2 | Segera Belanja |
+----+------------+------+----------------+

-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> SELECT id, nama_pelanggan,
    -> (YEAR(NOW()) - YEAR(tgl_lahir)) AS umur,
    -> CASE
    -> WHEN (YEAR(NOW()) - YEAR(tgl_lahir)) < 17 THEN 'Muda'
    -> WHEN (YEAR(NOW()) - YEAR(tgl_lahir)) > 17 AND (YEAR(NOW()) - YEAR(tgl_lahir)) <= 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS kategori_umur FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Agung          |   26 | Dewasa        |
|  2 | Pandan Wangi   |   25 | Dewasa        |
|  3 | Sekar          |   22 | Dewasa        |
|  4 | Suandi         |   26 | Dewasa        |
|  5 | Pradana        |   22 | Dewasa        |
|  6 | Gayatri Putri  |   21 | Dewasa        |
+----+----------------+------+---------------+

-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode = 'TV01' THEN 'DVD Player'
    -> WHEN kode = 'K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+


-- SOAL 3.4
-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(*) AS jumlah FROM pelanggan GROUP BY tmp_lahir;
+------------+--------+
| tmp_lahir  | jumlah |
+------------+--------+
| Bandung    |      1 |
| Jakarta    |      3 |
| Kediri     |      1 |
| Yogyakarta |      1 |
+------------+--------+

-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> SELECT
    -> CASE
    -> WHEN jenis_produk_id = 1 THEN 'elektronik'
    -> WHEN jenis_produk_id = 2 THEN 'makanan'
    -> WHEN jenis_produk_id = 3 THEN 'minuman'
    -> ELSE 'furniture'
    -> END AS kategori, COUNT(*) AS jumlah FROM produk GROUP BY jenis_produk_id;
+------------+--------+
| kategori   | jumlah |
+------------+--------+
| elektronik |      3 |
| makanan    |      1 |
| minuman    |      1 |
| furniture  |      1 |
+------------+--------+

-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko1]> SELECT nama_pelanggan FROM pelanggan WHERE (YEAR(NOW()) - YEAR(tgl_lahir)) < (SELECT AVG(YEAR(NOW()) - YEAR(tgl_lahir)) FROM pelanggan);
+----------------+
| nama_pelanggan |
+----------------+
| Sekar          |
| Pradana        |
| Gayatri Putri  |
+----------------+

-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko1]> SELECT nama FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+------------+
| nama       |
+------------+
| TV         |
| TV 21 Inch |
| Kulkas     |
+------------+

-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> SELECT nama_pelanggan FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE iuran > 90000);

-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> SELECT nama FROM produk WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
+------------+
| nama       |
+------------+
| Meja Makan |
| Taro       |
| Teh Kotak  |
+------------+

-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT nama_pelanggan FROM pelanggan WHERE kartu_id IN (SELECT id FROM kartu WHERE diskon > 0.03);
+----------------+
| nama_pelanggan |
+----------------+
| Agung          |
| Pandan Wangi   |
| Sekar          |
| Suandi         |
| Pradana        |
| Gayatri Putri  |
+----------------+