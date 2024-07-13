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

3. **Setup Database**:

   - Install PostgreSQL jika belum terinstal.
   - Buat database baru:
     ```bash
     createdb backend_interview_assignment
     ```
   - Import database dump:
     ```bash
     psql -U postgres -d backend_interview_assignment -f database_dump.sql
     ```

4. **Install Dependencies**:

   ```bash
   npm install
   ```

5. **Run the Application**:
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
- File `database_dump.sql` berisi data awal untuk setup database.
