# UAS Web Service - API Sistem Pengaduan Masyarakat
**Kecamatan Talun, Kabupaten Pekalongan**

Project ini disusun untuk memenuhi Tugas Akhir Mata Kuliah Web Service (2025).
Aplikasi ini berfungsi sebagai Backend (API) untuk layanan aspirasi warga, mencakup pelaporan infrastruktur, pelayanan publik, dan respon petugas.

### 👤 Identitas Mahasiswa
* **Nama:** Agus Siswanto
* **NIM:** 23.01.55.7005
* **Program Studi:** Sistem Informasi - Universitas Stikubank (UNISBANK)

---

### 🔗 Link Penting (Demo & Dokumentasi)

Berikut adalah lampiran wajib untuk penilaian UAS:

* 📺 **Video Demo (YouTube):**
    [[KLIK DI SINI UNTUK MENONTON VIDEO](https://youtu.be/GXqaWAhmFPM?si=WD-wkUk7zr7m67FT)

* 📚 **Dokumentasi API (Postman):**
    [Lihat Dokumentasi Lengkap di Sini](https://documenter.getpostman.com/view/48961634/2sBXVbFsbi)

---

### 🛠️ Fitur & Endpoint Utama
Sistem ini dibangun menggunakan **Lumen Micro-framework** dengan fitur CRUD lengkap:

1.  **Manajemen Pengaduan** (`/api/pengaduan`)
    * Masyarakat dapat mengirim laporan (status awal: 'dikirim').
    * Melihat status laporan secara real-time.
2.  **Manajemen Tanggapan** (`/api/tanggapan`)
    * Petugas memberikan respon/solusi.
    * Update status otomatis menjadi 'diproses' atau 'selesai'.
3.  **Master Data Kategori** (`/api/kategori`)
    * Mengelola jenis laporan (Infrastruktur, Kesehatan, Bencana Alam, dll).
4.  **Manajemen Petugas** (`/api/petugas`)
    * Data petugas yang bertanggung jawab (Polisi, Dokter Puskesmas, Staff Kecamatan).
5.  **Manajemen User** (`/api/users`)
    * Registrasi dan data pengguna (Masyarakat & Admin).

---

### 💻 Cara Instalasi (Untuk Pengujian)

Karena folder `vendor` tidak disertakan (sesuai standar git), silakan ikuti langkah ini untuk menjalankan project:

1.  **Clone Repository**
    ```bash
    git clone [https://github.com/USERNAME_ANDA/NAMA_REPO.git](https://github.com/USERNAME_ANDA/NAMA_REPO.git)
    cd folder-project
    ```

2.  **Install Dependency**
    Jalankan perintah ini di terminal untuk mengunduh library Lumen:
    ```bash
    composer install
    ```

3.  **Setup Database**
    * Buat database baru di MySQL (misal: `db_pengaduan_talun`).
    * Import file `.sql` yang sudah disertakan dalam repository ini.
    * Rename file `.env.example` menjadi `.env`, lalu sesuaikan konfigurasi database:
        ```
        DB_DATABASE=db_pengaduan_talun
        DB_USERNAME=root
        DB_PASSWORD=
        ```

4.  **Jalankan Server**
    ```bash
    php -S localhost:8000 -t public
    ```
