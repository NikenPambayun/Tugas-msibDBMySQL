-- TUGAS 5 PERTEMUAN 7 --

-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputPelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char(1), tmp_lahir varchar(30), tgl_lahir date, email varchar(30), kartu_id int(11))
    -> BEGIN
    -> INSERT INTO pelanggan(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id)
    -> VALUES(kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id);
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputPelanggan('011107', 'Cakra', 'L', 'Depok', '1999-05-08', 'cakra@gmail.com', 1);

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT * FROM pelanggan;
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showPelanggan();
+----+--------+----------------+------+------------+------------+-------------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 |
|  7 | 011107 | Cakra          | L    | Depok      | 1999-05-08 | cakra@gmail.com   |        1 |
+----+--------+----------------+------+------------+------------+-------------------+----------+

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int(11), min_stok int(11), jenis_produk_id int(11))
    -> BEGIN
    -> INSERT INTO produk(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
    -> VALUES(kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL inputProduk('A001', 'AC', '2000000', '3000000', '7', '2', 1);

-- Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT * FROM produk;
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showProduk();
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  7 | A001 | AC         |    2000000 |    3000000 |    7 |        2 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> SELECT pelanggan.nama_pelanggan, SUM(pesanan.total) AS total_pesanan FROM pelanggan
    -> JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id GROUP BY pelanggan.nama_pelanggan;
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL totalPesanan();
+----------------+---------------+
| nama_pelanggan | total_pesanan |
+----------------+---------------+
| Agung          |        230000 |
+----------------+---------------+

-- tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE allPesanan()
    -> BEGIN
    -> SELECT pelanggan.nama_pelanggan, pesanan.tanggal, pesanan.total FROM pelanggan
    -> JOIN pesanan ON pelanggan.id = pesanan.pelanggan_id;
    -> END $$

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL allPesanan();
+----------------+------------+--------+
| nama_pelanggan | tanggal    | total  |
+----------------+------------+--------+
| Agung          | 2023-03-03 | 200000 |
| Agung          | 2022-02-02 |  30000 |
+----------------+------------+--------+

-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
MariaDB [dbtoko1]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT pelanggan.id, pelanggan.kode AS 'kode_pelanggan', pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.kartu_id, produk.kode AS 'kode_produk', produk.nama AS 'nama_produk', pesanan.tanggal, pesanan.total
    -> FROM produk
    -> JOIN pesanan ON produk.id = pesanan.pelanggan_id
    -> JOIN pelanggan ON pelanggan.id = pesanan.pelanggan_id;

MariaDB [dbtoko1]> SELECT * FROM pesanan_produk_vw;
+----+----------------+----------------+------+----------+-------------+-------------+------------+--------+
| id | kode_pelanggan | nama_pelanggan | jk   | kartu_id | kode_produk | nama_produk | tanggal    | total  |
+----+----------------+----------------+------+----------+-------------+-------------+------------+--------+
|  1 | 011101         | Agung          | L    |        1 | TV01        | TV          | 2023-03-03 | 200000 |
|  1 | 011101         | Agung          | L    |        1 | TV01        | TV          | 2022-02-02 |  30000 |
+----+----------------+----------------+------+----------+-------------+-------------+------------+--------+