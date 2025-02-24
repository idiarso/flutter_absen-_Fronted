# Dokumentasi Diagram Sistem

## 1. Alur Sistem

### 1.1 Alur Umum Sistem
```mermaid
graph TD
    Client[Flutter Client]
    Auth[Authentication API]
    Profile[Profile API]
    Assessment[Assessment API]
    Attendance[Attendance API]
    Backup[Backup API]
    DB[(Database)]

    %% Authentication Flow
    Client -->|1. Login| Auth
    Auth -->|2. Return Token| Client
    Auth <-->|Validate| DB

    %% Profile Flow
    Client -->|Get/Update Profile| Profile
    Profile <-->|Query/Update| DB

    %% Assessment Flow
    Client -->|List Assessments| Assessment
    Client -->|View Assessment| Assessment
    Client -->|Create Assessment| Assessment
    Assessment <-->|CRUD Operations| DB

    %% Attendance Flow
    Client -->|List Attendance| Attendance
    Client -->|Mark Attendance| Attendance
    Client -->|Get Recap| Attendance
    Attendance <-->|CRUD Operations| DB

    %% Backup Flow
    Client -->|List Backups| Backup
    Client -->|Create Backup| Backup
    Client -->|Download Backup| Backup
    Client -->|Delete Backup| Backup
    Backup <-->|File Operations| DB

    %% Response Format
    subgraph Response Format
        Success[Success Response] -->|Format| JSON1[Success JSON]
        Error[Error Response] -->|Format| JSON2[Error JSON]
    end

    %% Authentication Required
    subgraph Auth Required
        Token[Bearer Token] -->|Required for| Protected[Protected Endpoints]
    end

    %% Data Flow
    subgraph Data Flow
        Request[Request] -->|1. Validate Token| ValidateToken
        ValidateToken -->|2. Process Request| Process
        Process -->|3. Return Response| Response
    end

    style Client fill:#f9f,stroke:#333,stroke-width:4px
    style Auth fill:#bbf,stroke:#333,stroke-width:2px
    style DB fill:#dfd,stroke:#333,stroke-width:2px
```

### 1.2 Sequence Diagram Autentikasi
```mermaid
sequenceDiagram
    participant C as Client
    participant A as Auth API
    participant AP as API Endpoints
    participant D as Database

    %% Login Process
    C->>A: POST /api/login
    A->>D: Validate Credentials
    D-->>A: User Data
    A-->>C: Return Token

    %% Using Protected Endpoints
    C->>AP: Request with Bearer Token
    AP->>AP: Validate Token
    AP->>D: Query Data
    D-->>AP: Return Data
    AP-->>C: JSON Response

    %% Error Handling
    C->>AP: Invalid Request
    AP-->>C: Error Response (400/401/403/404/500)

    %% Refresh Flow
    C->>A: Refresh Token
    A->>D: Validate Refresh Token
    D-->>A: Token Valid
    A-->>C: New Access Token
```

## 2. Struktur Database

### 2.1 Tabel Utama
```mermaid
classDiagram
    class User {
        +id: bigint
        +name: string
        +email: string
        +email_verified_at: timestamp
        +password: string
        +remember_token: string
        +photo_profile: string
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Student {
        +id: bigint
        +nis: string
        +name: string
        +class_room_id: bigint
        +gender: enum
        +birth_place: string
        +birth_date: date
        +religion: string
        +address: text
        +phone: string
        +created_at: timestamp
        +updated_at: timestamp
    }

    class ClassRoom {
        +id: bigint
        +name: string
        +department_id: bigint
        +school_year_id: bigint
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Department {
        +id: bigint
        +name: string
        +code: string
        +created_at: timestamp
        +updated_at: timestamp
    }

    class SchoolYear {
        +id: bigint
        +name: string
        +start_date: date
        +end_date: date
        +is_active: boolean
        +created_at: timestamp
        +updated_at: timestamp
    }

    Student "1" -- "1" ClassRoom
    ClassRoom "1" -- "1" Department
    ClassRoom "1" -- "1" SchoolYear
```

### 2.2 Tabel Penilaian dan Absensi
```mermaid
classDiagram
    class Assessment {
        +id: bigint
        +student_id: bigint
        +subject_id: bigint
        +score: decimal
        +assessment_type: string
        +notes: text
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Attendance {
        +id: bigint
        +student_id: bigint
        +date: date
        +time_in: time
        +time_out: time
        +status: enum
        +notes: text
        +is_leave: boolean
        +created_at: timestamp
        +updated_at: timestamp
    }

    class TeachingActivity {
        +id: bigint
        +teacher_id: bigint
        +subject_id: bigint
        +class_room_id: bigint
        +date: date
        +topic: string
        +description: text
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Subject {
        +id: bigint
        +name: string
        +code: string
        +created_at: timestamp
        +updated_at: timestamp
    }

    Assessment "*" -- "1" Student
    Assessment "*" -- "1" Subject
    Attendance "*" -- "1" Student
    TeachingActivity "*" -- "1" User
    TeachingActivity "*" -- "1" Subject
    TeachingActivity "*" -- "1" ClassRoom
```

### 2.3 Tabel Ekstrakurikuler
```mermaid
classDiagram
    class Extracurricular {
        +id: bigint
        +name: string
        +description: text
        +created_at: timestamp
        +updated_at: timestamp
    }

    class ExtracurricularActivity {
        +id: bigint
        +extracurricular_id: bigint
        +date: date
        +start_time: time
        +end_time: time
        +topic: string
        +description: text
        +guru_id: bigint
        +catatan: text
        +created_at: timestamp
        +updated_at: timestamp
    }

    class ExtracurricularActivityAttendance {
        +id: bigint
        +activity_id: bigint
        +student_id: bigint
        +status: enum
        +notes: text
        +created_at: timestamp
        +updated_at: timestamp
    }

    class ExtracurricularMember {
        +id: bigint
        +extracurricular_id: bigint
        +student_id: bigint
        +created_at: timestamp
        +updated_at: timestamp
    }

    class ExtracurricularSupervisor {
        +id: bigint
        +extracurricular_id: bigint
        +teacher_id: bigint
        +created_at: timestamp
        +updated_at: timestamp
    }

    Extracurricular "1" -- "*" ExtracurricularActivity
    ExtracurricularActivity "1" -- "*" ExtracurricularActivityAttendance
    Extracurricular "1" -- "*" ExtracurricularMember
    Extracurricular "1" -- "*" ExtracurricularSupervisor
    ExtracurricularMember "*" -- "1" Student
    ExtracurricularSupervisor "*" -- "1" User
```

### 2.4 Tabel Absensi Guru dan Jadwal
```mermaid
classDiagram
    class Office {
        +id: bigint
        +name: string
        +latitude: decimal
        +longitude: decimal
        +radius: integer
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Shift {
        +id: bigint
        +name: string
        +start_time: time
        +end_time: time
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Schedule {
        +id: bigint
        +user_id: bigint
        +office_id: bigint
        +shift_id: bigint
        +date: date
        +is_wfa: boolean
        +is_banned: boolean
        +created_at: timestamp
        +updated_at: timestamp
    }

    class Leave {
        +id: bigint
        +user_id: bigint
        +start_date: date
        +end_date: date
        +reason: text
        +status: enum
        +created_at: timestamp
        +updated_at: timestamp
    }

    Schedule "*" -- "1" Office
    Schedule "*" -- "1" Shift
    Schedule "*" -- "1" User
    Leave "*" -- "1" User
```

## 3. Format Response API

```mermaid
classDiagram
    class ApiResponse {
        +boolean success
        +string message
        +object data
        +object error
    }

    class PaginatedResponse {
        +int current_page
        +array data
        +string first_page_url
        +int from
        +int last_page
        +string last_page_url
        +string next_page_url
        +string path
        +int per_page
        +string prev_page_url
        +int to
        +int total
    }

    class ErrorResponse {
        +boolean success
        +string error
        +array validation_errors
    }

    ApiResponse <|-- PaginatedResponse
    ApiResponse <|-- ErrorResponse
```

## Catatan Penting:

1. Semua endpoint API memerlukan autentikasi menggunakan Bearer Token, kecuali endpoint login.
2. Format response konsisten menggunakan struktur ApiResponse.
3. Untuk data yang banyak, digunakan PaginatedResponse.
4. Setiap error akan menggunakan format ErrorResponse.
5. Relasi antar tabel menggunakan foreign key constraints untuk menjaga integritas data.