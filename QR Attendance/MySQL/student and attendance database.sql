drop table student;
CREATE DATABASE IF NOT EXISTS StudentAttendanceSystem;

USE StudentAttendanceSystem;

CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);