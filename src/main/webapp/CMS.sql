CREATE DATABASE IF NOT EXISTS CMS;
USE CMS;
-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);
-- Complain table (matches Java code exactly)
CREATE TABLE IF NOT EXISTS complain (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    remarks TEXT,
    created_at VARCHAR(20),
    studentId VARCHAR(50) NOT NULL,
    department VARCHAR(100),
    course VARCHAR(100),
    category VARCHAR(100),
    FOREIGN KEY (studentId) REFERENCES users(username) ON DELETE CASCADE
);