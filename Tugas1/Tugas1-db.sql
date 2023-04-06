// 1. Membuat Table produk
MariaDB [dbtoko1]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45) NOT NULL,
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id));

// 2. Membuat Table pesanan_items
MariaDB [dbtoko1]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL REFERENCES pesanan(id),
    -> qty int,
    -> harga double);

// 3. Membuat Table vendor
MariaDB [dbtoko1]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4) unique,
    -> nama varchar(40) NOT NULL,
    -> kota varchar(30),
    -> kontak varchar(30));

// 4. Membuat Table pembelian
MariaDB [dbtoko1]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10) unique,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int NOT NULL REFERENCES vendor(id));

// 5. Tambahkan kolom alamat pada pelanggan
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(40) after email;

// 6. Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);

// 7. edit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50);