CREATE TRIGGER nilai_detail_after_insert
AFTER INSERT ON nilai_details
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'tambah_data',
        @log_ip_address,
        @log_user_agent,
        NULL,
        JSON_OBJECT(
            'tabel', 'nilai_details',
            'id_detail', NEW.id_detail,
            'id_nilai', NEW.id_nilai, 
            'id_jenis', NEW.id_jenis,
            'nilai_input', NEW.nilai
        )
    );
END;

CREATE TRIGGER nilai_detail_after_delete
AFTER DELETE ON nilai_details
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'hapus_data',
        @log_ip_address,
        @log_user_agent,
        JSON_OBJECT(
            'tabel', 'nilai_details',
            'id_detail', OLD.id_detail,
            'id_nilai', OLD.id_nilai, 
            'id_jenis', OLD.id_jenis,
            'nilai_input', OLD.nilai
        ),
        NULL
    );
END;

CREATE TRIGGER nilais_after_update
AFTER UPDATE ON nilais
FOR EACH ROW
BEGIN
    IF OLD.rata_rata <> NEW.rata_rata OR OLD.keterangan <> NEW.keterangan THEN
        INSERT INTO log_aktivitas (
            id_pengguna,
            jenis_aktivitas,
            ip_address,
            user_agent,
            data_lama,
            data_baru
        )
        VALUES (
            @log_user_id,
            'update_data',
            @log_ip_address,
            @log_user_agent,
            JSON_OBJECT(
                'tabel', 'nilais',
                'id_nilai', OLD.id_nilai,
                'rata_rata_lama', OLD.rata_rata, 
                'keterangan_lama', OLD.keterangan
            ),
            JSON_OBJECT(
                'tabel', 'nilais',
                'id_nilai', NEW.id_nilai,
                'rata_rata_baru', NEW.rata_rata, 
                'keterangan_baru', NEW.keterangan
            )
        );
    END IF;
END;

CREATE TRIGGER gurus_after_insert
AFTER INSERT ON gurus
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'tambah_data',
        @log_ip_address,
        @log_user_agent,
        NULL,
        JSON_OBJECT(
            'tabel', 'gurus', 
            'id_guru', NEW.id_guru,
            'nama', NEW.nama, 
            'nip', NEW.nip, 
            'email', NEW.email
        )
    );
END;

CREATE TRIGGER gurus_after_update
AFTER UPDATE ON gurus
FOR EACH ROW
BEGIN
    IF OLD.nama <> NEW.nama OR OLD.nip <> NEW.nip OR OLD.email <> NEW.email OR 
       OLD.alamat <> NEW.alamat OR OLD.telepon <> NEW.telepon
    THEN 
        INSERT INTO log_aktivitas (
            id_pengguna,
            jenis_aktivitas,
            ip_address,
            user_agent,
            data_lama,
            data_baru
        )
        VALUES (
            @log_user_id,
            'update_data',
            @log_ip_address,
            @log_user_agent,
            JSON_OBJECT(
                'tabel', 'gurus', 
                'id_guru', OLD.id_guru,
                'nama_lama', OLD.nama, 
                'nip_lama', OLD.nip, 
                'email_lama', OLD.email
            ), 
            JSON_OBJECT(
                'tabel', 'gurus', 
                'id_guru', NEW.id_guru,
                'nama_baru', NEW.nama, 
                'nip_baru', NEW.nip, 
                'email_baru', NEW.email
            )
        );
    END IF;
END;

CREATE TRIGGER gurus_after_delete
AFTER DELETE ON gurus
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'hapus_data',
        @log_ip_address,
        @log_user_agent,
        JSON_OBJECT(
            'tabel', 'gurus', 
            'id_guru', OLD.id_guru,
            'nama', OLD.nama, 
            'nip', OLD.nip, 
            'email', OLD.email
        ),
        NULL
    );
END;

CREATE TRIGGER murids_after_insert
AFTER INSERT ON murids
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'tambah_data',
        @log_ip_address,
        @log_user_agent,
        NULL,
        JSON_OBJECT(
            'tabel', 'murids', 
            'id_murid', NEW.id_murid,
            'nama', NEW.nama, 
            'nis', NEW.nis, 
            'nisn', NEW.nisn
        )
    );
END;

CREATE TRIGGER murids_after_update
AFTER UPDATE ON murids
FOR EACH ROW
BEGIN
    IF OLD.nama <> NEW.nama OR OLD.nis <> NEW.nis OR OLD.nisn <> NEW.nisn OR 
       OLD.id_kelas <> NEW.id_kelas OR OLD.alamat <> NEW.alamat
    THEN 
        INSERT INTO log_aktivitas (
            id_pengguna,
            jenis_aktivitas,
            ip_address,
            user_agent,
            data_lama,
            data_baru
        )
        VALUES (
            @log_user_id,
            'update_data',
            @log_ip_address,
            @log_user_agent,
            JSON_OBJECT(
                'tabel', 'murids', 
                'id_murid', OLD.id_murid,
                'nama_lama', OLD.nama, 
                'nis_lama', OLD.nis, 
                'id_kelas_lama', OLD.id_kelas
            ), 
            JSON_OBJECT(
                'tabel', 'murids', 
                'id_murid', NEW.id_murid,
                'nama_baru', NEW.nama, 
                'nis_baru', NEW.nis, 
                'id_kelas_baru', NEW.id_kelas
            )
        );
    END IF;
END;

CREATE TRIGGER murids_after_delete
AFTER DELETE ON murids
FOR EACH ROW
BEGIN
    INSERT INTO log_aktivitas (
        id_pengguna,
        jenis_aktivitas,
        ip_address,
        user_agent,
        data_lama,
        data_baru
    )
    VALUES (
        @log_user_id,
        'hapus_data',
        @log_ip_address,
        @log_user_agent,
        JSON_OBJECT(
            'tabel', 'murids', 
            'id_murid', OLD.id_murid,
            'nama', OLD.nama, 
            'nis', OLD.nis
        ),
        NULL
    );
END;