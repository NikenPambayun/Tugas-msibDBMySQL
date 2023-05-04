-- TUGAS 6 PERTEMUAN 8 --

MariaDB [dbtoko1]> DELIMITER $$;
MariaDB [dbtoko1]> CREATE TRIGGER status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE total_pesanan int;
    -> DECLARE jumlah_pembayaran int;
    -> DECLARE sisa_pembayaran int;
    -> SELECT total INTO total_pesanan FROM pesanan WHERE id = NEW.pesanan_id;
    -> SELECT SUM(jumlah) INTO jumlah_pembayaran FROM pembayaran WHERE pesanan_id = NEW.pesanan_id;
    -> SET sisa_pembayaran = total_pesanan - jumlah_pembayaran;
    -> IF sisa_pembayaran <= 0 THEN
    -> UPDATE pembayaran SET status_pembayaran = 'Lunas' WHERE id = NEW.id;
    -> ELSE
    -> UPDATE pembayaran SET status_pembayaran = 'Belum Lunas' WHERE id = NEW.id;
    -> END IF;
    -> END;
    -> $$;

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> INSERT INTO pembayaran VALUES(NULL, 'P001', '2023-03-05', 2000000, 1, 'Belum Lunas', 2);