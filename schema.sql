-- ============================================================
-- Hotel Management System — Database Schema
-- ============================================================
-- Run this file once to set up the database manually.
-- The application also auto-creates these tables on first launch
-- via DatabaseManager.initializeDatabase().
-- ============================================================

CREATE DATABASE IF NOT EXISTS hotelmanagement;
USE hotelmanagement;

-- Rooms table
CREATE TABLE IF NOT EXISTS rooms (
    room_number  VARCHAR(50)    PRIMARY KEY,
    room_type    VARCHAR(50),
    room_status  VARCHAR(50),
    price        DECIMAL(10, 2)
);

-- Guests table
CREATE TABLE IF NOT EXISTS guests (
    guest_id    INT AUTO_INCREMENT PRIMARY KEY,
    guest_name  VARCHAR(255) NOT NULL,
    contact     VARCHAR(100),
    email       VARCHAR(255),
    address     VARCHAR(255)
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id  INT AUTO_INCREMENT PRIMARY KEY,
    guest_name  VARCHAR(255) NOT NULL,
    contact     VARCHAR(100),
    room_type   VARCHAR(50),          -- stores room_number
    check_in    DATE,
    check_out   DATE,
    status      VARCHAR(20) DEFAULT 'Booked'
);

-- Payments table
CREATE TABLE IF NOT EXISTS payments (
    payment_id      INT AUTO_INCREMENT PRIMARY KEY,
    booking_id      INT,
    amount          DECIMAL(10, 2),
    payment_method  VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- ============================================================
-- Optional: seed sample rooms
-- ============================================================
INSERT IGNORE INTO rooms (room_number, room_type, room_status, price) VALUES
('101', 'Single', 'Available', 100.00),
('102', 'Double', 'Available', 150.00),
('103', 'Suite',  'Available', 200.00),
('104', 'Double', 'Available', 150.00),
('105', 'Suite',  'Available', 160.00);
