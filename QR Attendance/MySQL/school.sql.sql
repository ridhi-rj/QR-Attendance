CREATE DATABASE college;
drop database collge;

USE college;

-- Table to store student information
CREATE TABLE IF NOT EXISTS school (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(100) NOT NULL UNIQUE,
    student_qr_code VARCHAR(100) NOT NULL
);

-- Inserting example entries into the students table
INSERT INTO school (student_name, student_email, student_qr_code) VALUES
('John Doe', 'john@example.com', 'QR_CODE_123'),
('Jane Smith', 'jane@example.com', 'QR_CODE_456'),
('Alice Johnson', 'alice@example.com', 'QR_CODE_789');

select * from school;


-- Table to store attendance records
CREATE TABLE IF NOT EXISTS attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
