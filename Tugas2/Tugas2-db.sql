-- SOAL 2.1
-- Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_jual DESC;

-- Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan;

-- Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko1]> SELECT kode, nama, stok FROM produk WHERE stok = 4;

-- Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir = 'Jakarta';

-- Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko1]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;


-- SOAL 2.2
-- Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko1]> SELECT * FROM produk WHERE stok = 3 OR stok = 10;

-- Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual < 5000000 AND harga_juaL > 500000;

-- Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko1]> SELECT * FROM produk WHERE min_stok > stok;

-- Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;

-- Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir='Jakarta' AND jk='P';

-- Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE id IN (2, 4, 6);

-- Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual >= 500000 AND harga_jual <= 6000000;


-- SOAL 2.3
-- Tampilkan produk yang kode awalnya huruf K dan huruf M
SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';

-- Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode NOT LIKE ('M%');

-- Tampilkan produk-produk televisi
MariaDB [dbtoko1]> SELECT * FROM produk WHERE nama LIKE 'TV%';

-- Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';

-- Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir != 'Jakarta' AND tmp_lahir LIKE '%yo%';

-- Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';


-- SOAL 2.4
-- Tampilkan 2 data produk termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;

-- Tampilkan produk yang paling murah
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli LIMIT 1;

-- Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok DESC LIMIT 2;

-- Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok LIMIT 1;

-- Tampilkan pelanggan yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;

-- Tampilkan pelanggan yang paling tua
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir LIMIT 1;