# 🏨 Hotel Room Booking and Management System

A Java-based desktop application for managing hotel room bookings, guest information, check-in/check-out operations, and payment processing.

> **Course:** Java Programming BER 2053  
> **Institution:** UCSI University — Faculty of Engineering, Technology & Built Environment  
> **Lecturer:** Dr. Mohammad Arif Bin Ilyas

---

## 👥 Team Members

| Name | Student ID |
|------|-----------|
| Sari Obaid | 1002371049 |
| Hazem Ashraf | 1002371042 |
| Feras Mohammed Rashad | 1002371451 |
| Raghad Mohammed Abduallah | 1002268809 |
| Yousef Zidan | 1002370851 |
| Karim Yasser | 1002267198 |

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Architecture](#system-architecture)
- [Prerequisites](#prerequisites)
- [Database Setup](#database-setup)
- [Installation & Running](#installation--running)
- [Usage Guide](#usage-guide)
- [Project Structure](#project-structure)
- [Known Limitations](#known-limitations)

---

## Overview

The **Hotel Room Booking and Management System** (leQuadri Hotel) is a GUI-based desktop application built with **Java Swing** and **MySQL**. It addresses common hotel management challenges such as overbooking, slow check-in/check-out processes, and inaccurate record-keeping by providing a real-time, role-based digital solution.

---

## Features

### 👤 Guest Side
- Room availability browsing (filtered to available rooms only)
- Room booking with guest name, contact, and date selection
- Instant booking confirmation or failure feedback

### 🧑‍💼 Staff Side
- Secure staff login (username/password)
- **Room Management** — Add, update, delete rooms (number, type, status, price)
- **Guest Management** — View, update, delete guest booking records
- **View Bookings** — Scrollable table of all current and past bookings
- **Check-In** — Update booking status to "Checked In" by Booking ID
- **Check-Out** — Remove booking and reset room to "Available"
- **Search Bookings** — Filter by Booking ID or guest name
- **Process Payment** — Record payment (Credit Card / Cash) linked to a booking

---

## System Architecture

```
src/
├── MainClass.java           # Entry point; screen-size utility
├── LoginTypePage.java       # Role selection screen (Staff / Guest)
├── StaffLoginPage.java      # Staff authentication
├── GuestBookingForm.java    # Guest room booking form
├── StaffDashboard.java      # Staff control panel
├── GuestManagement.java     # View/edit/delete guest records
├── AddGuestForm.java        # Add a new guest
├── EditGuestInfo.java       # Edit existing guest details
├── ViewGuestDetails.java    # Read-only guest detail view
├── RoomManagement.java      # Room CRUD interface
├── NewRoomForm.java         # Add a new room
├── Booking.java             # Booking data model (POJO)
├── SearchBookingForm.java   # Search bookings by ID or name
├── ViewBookings.java        # View all bookings
├── CheckInForm.java         # Guest check-in form
├── CheckOutForm.java        # Guest check-out form
├── PaymentForm.java         # Payment processing form
└── DatabaseManager.java     # All database operations (JDBC/MySQL)
```

**Database:** MySQL (`hotelmanagement`)  
**Tables:** `bookings`, `rooms`, `payments`, `guests`

---

## Prerequisites

| Requirement | Version |
|------------|---------|
| Java JDK | 8 or higher |
| MySQL Server | 5.7 or higher |
| MySQL Connector/J | 8.x (JDBC driver) |

---

## Database Setup

1. Start your MySQL server.

2. Create the database:
```sql
CREATE DATABASE hotelmanagement;
```

3. The application will auto-create the required tables on first run via `DatabaseManager.initializeDatabase()`.  
   Tables created automatically:
   - `bookings` — guest reservations
   - `rooms` — hotel room inventory
   - `payments` — payment records
   - `guests` — guest profiles

4. *(Optional)* Seed some initial room data:
```sql
USE hotelmanagement;

INSERT INTO rooms (room_number, room_type, room_status, price) VALUES
('101', 'Single',  'Available', 100.00),
('102', 'Double',  'Available', 150.00),
('103', 'Suite',   'Available', 200.00),
('104', 'Double',  'Available', 150.00);
```

---

## Installation & Running

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/hotel-management-system.git
cd hotel-management-system
```

### 2. Add the MySQL JDBC driver
Download `mysql-connector-j-x.x.x.jar` from [MySQL Downloads](https://dev.mysql.com/downloads/connector/j/) and place it in the `lib/` directory.

### 3. Configure database credentials
Open `src/DatabaseManager.java` and update:
```java
String URL      = "jdbc:mysql://127.0.0.1:3306/hotelmanagement";
String USER     = "root";       // your MySQL username
String PASSWORD = "12345678";   // your MySQL password
```

### 4. Compile
```bash
javac -cp "lib/mysql-connector-j-x.x.x.jar" -d out src/*.java
```

### 5. Run
```bash
java -cp "out:lib/mysql-connector-j-x.x.x.jar" MainClass
# Windows:
java -cp "out;lib/mysql-connector-j-x.x.x.jar" MainClass
```

---

## Usage Guide

### Staff Login
- **Username:** `admin`  
- **Password:** `pass`

### Guest Booking Flow
1. Launch app → click **Guest Booking**
2. Fill in name, contact, select an available room, enter check-in/check-out dates
3. Click **Book Room** — confirmation message appears on success

### Staff Operations
After logging in, the dashboard provides buttons for all management operations. Each form guides the user with labeled fields and immediate feedback dialogs.

---

## Project Structure

```
hotel-management-system/
├── src/                  # All Java source files
├── lib/                  # MySQL JDBC driver (add manually)
├── out/                  # Compiled .class files (generated)
├── docs/                 # Project report and UML diagrams
├── .gitignore
└── README.md
```

---

## Known Limitations

- Staff credentials are hardcoded (`admin` / `pass`) — no encrypted authentication
- No date-conflict checking when booking rooms (concurrent bookings possible)
- Payment form does not generate receipts or integrate with real payment gateways
- No connection pooling; each query opens a new database connection
- Basic SQL injection protection via `PreparedStatement` (not enterprise-grade)

See the [Future Improvements](#) section in the project report for planned upgrades including RBAC, JavaFX UI, REST APIs, and cloud deployment.

---

## License

This project was developed for academic purposes at UCSI University and is not intended for production use.
