CREATE TABLE sekolah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_sekolah VARCHAR(255) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(15)
);

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE guru (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_guru VARCHAR(255) NOT NULL,
    nip VARCHAR(20) UNIQUE,
    telepon VARCHAR(15)
);

CREATE TABLE siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_siswa VARCHAR(255) NOT NULL,
    nis VARCHAR(20) UNIQUE,
    kelas_id INT,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE tahun_pelajaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tahun_mulai INT NOT NULL,
    tahun_akhir INT NOT NULL,
    semester ENUM('ganjil', 'genap')
);

CREATE TABLE fase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_fase VARCHAR(50) NOT NULL
);

CREATE TABLE kelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    jurusan_id INT,
    tahun_pelajaran_id INT,
    FOREIGN KEY (jurusan_id) REFERENCES jurusan(id),
    FOREIGN KEY (tahun_pelajaran_id) REFERENCES tahun_pelajaran(id)
);

CREATE TABLE jurusan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_jurusan VARCHAR(255) NOT NULL
);

CREATE TABLE mata_pelajaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_mata_pelajaran VARCHAR(255) NOT NULL,
    kelompok_pelajaran_id INT,
    FOREIGN KEY (kelompok_pelajaran_id) REFERENCES kelompok_pelajaran(id)
);

CREATE TABLE kelompok_pelajaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelompok VARCHAR(255) NOT NULL
);

CREATE TABLE jadwal_pelajaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kelas_id INT,
    mata_pelajaran_id INT,
    guru_id INT,
    hari ENUM('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'),
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id),
    FOREIGN KEY (mata_pelajaran_id) REFERENCES mata_pelajaran(id),
    FOREIGN KEY (guru_id) REFERENCES guru(id)
);

CREATE TABLE nilai_siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    mata_pelajaran_id INT,
    nilai DECIMAL(5, 2),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id),
    FOREIGN KEY (mata_pelajaran_id) REFERENCES mata_pelajaran(id)
);

CREATE TABLE nilai_asts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    nilai DECIMAL(5, 2),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);

CREATE TABLE nilai_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    nilai DECIMAL(5, 2),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);

CREATE TABLE absensi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    tanggal DATE,
    status ENUM('Hadir', 'Tidak Hadir'),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);

CREATE TABLE nilai_kokulum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    nilai DECIMAL(5, 2),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);

CREATE TABLE nilai_ekstrakulum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    nilai DECIMAL(5, 2),
    FOREIGN KEY (siswa_id) REFERENCES siswa(id)
);

CREATE TABLE kenaikan_kelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    kelas_baru_id INT,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id),
    FOREIGN KEY (kelas_baru_id) REFERENCES kelas(id)
);

CREATE TABLE kepala_sekolah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kepala_sekolah VARCHAR(255) NOT NULL,
    periode_mulai DATE,
    periode_selesai DATE
);