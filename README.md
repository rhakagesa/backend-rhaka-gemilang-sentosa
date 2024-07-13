# backend-task-interview

## How to Install

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/backend-task-interview.git
   cd backend-task-interview
   ```

2. **Setup Environment Variables**:

   - Buat file `.env` di root project dan tambahkan konfigurasi database:
     ```plaintext
     DB_HOST=127.0.0.1
     DB_USER=postgres
     DB_PASSWORD=postgres
     DB_NAME=backend_interview_assignment
     DB_PORT=5432
     DB_DIALECT=postgres
     PORT=3000
     ```

3. **Setup Database** :
   -Install PostgreSQL dan pgAdmin4** jika belum terinstal.
   -Buka pgAdmin4** dan login.
   - Klik kanan pada `Servers` di panel kiri.
   - Pilih `Create` > `Server`.
   - Masukkan nama untuk server dan klik `Connection`.
   - Isi detail koneksi dengan:
     - `Host name/address`: `localhost`
     - `Port`: `5432`
     - `Maintenance database`: `postgres`
     - `Username`: `postgres`
     - `Password`: (isi dengan password PostgreSQL Anda)
   - Klik `Save`.

4. **Buat Database Baru**:
   - Klik kanan pada server yang baru dibuat.
   - Pilih `Create` > `Database`.
   - Masukkan nama database (`backend_interview_assignment`) dan klik `Save`.

5. **Import Database Dump**:
   - Klik kanan pada database yang baru saja Anda buat (`backend_interview_assignment`).
   - Pilih `Restore`.
   - Pada tab `General`, di bagian `Filename`, klik ikon pencarian dan pilih file dump database Anda (`backend_interview_assignment.sql`).
   - Klik `Restore`.

6. **Install Dependencies**:
   ```bash
   npm install
   ```

7. **Run the Application**:
   ```bash
   npm run dev
   ```

## How to Use

- Akses endpoint REST API menggunakan Postman atau tool lainnya.
- Gunakan file Postman collection yang disertakan (`Backend Developer Test.postman_collection.json`) untuk mencoba endpoint.

## Postman

- Import `Backend Developer Test.postman_collection.json` ke Postman.
- Jalankan request yang disediakan.

## Database

- Pastikan database PostgreSQL telah di-set up dengan konfigurasi yang benar.
