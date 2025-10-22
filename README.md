# 🛍️ Flutter eCommerce App

A modern eCommerce mobile application built using Flutter with a **Clean Architecture** pattern.  
The project is designed for scalability, maintainability, and testability — integrating **Bloc/Cubit** for state management, **GetIt** for dependency injection, **Supabase** as the backend, **Dio** for API handling, **Hive** for local storage, and **Firebase** for analytics and services.

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Tech Stack](#-tech-stack)
- [Architecture Overview](#-architecture-overview)
- [Implemented Features](#-implemented-features)
- [Upcoming Features / Roadmap](#-upcoming-features--roadmap)
- [Setup & Installation](#-setup--installation)
- [Testing & Linting](#-testing--linting)
- [Code Quality & Conventions](#-code-quality--conventions)
- [Contact](#-contact)
- [Notes](#-notes)

---

## 🚀 Overview

This eCommerce app demonstrates clean and modular Flutter development focused on real-world standards.  
It connects to a **Supabase backend** through custom REST endpoints (**PostgREST RPC calls**) and uses **Dio** for HTTP requests.  
The app also integrates **Firebase** for analytics, notifications, and related services.

The project follows the **Clean Architecture** approach, dividing logic into independent layers — improving scalability, testability, and readability.

---

## 🧰 Tech Stack

| Category | Technologies |
|-----------|--------------|
| Framework | Flutter (Dart) |
| Architecture | Clean Architecture |
| State Management | Bloc / Cubit |
| Dependency Injection | GetIt |
| Networking | Dio |
| Backend | Supabase (PostgREST RPC API) |
| Local Database | Hive |
| Cloud Services | Firebase (Analytics, Notifications, etc.) |
| Design Pattern | MVVM-inspired Clean Structure |
| Version Control | Git & GitHub |

---

## 🧱 Architecture Overview

The application is structured into three main layers — each with clear responsibility separation.

### 🧩 Config Layer

Contains base classes and foundational logic for data sources, repositories, and routing.

config/
├── base_local_data_source/
├── base_remote_data_source/
├── base_repository/
├── bloc/
├── extensions/
├── internet_connection/
├── resources/
├── routes/
└── storages/


**Purpose:**
- Provides base classes for API and local data handling  
- Manages routes, resources, and reusable helpers  
- Centralizes connection and caching logic  

---

### 🧩 Core Layer

Provides shared logic, reusable components, and utilities used across all features.

core/
├── api/
├── base_widgets/
├── enum/
├── exceptions/
├── failure/
├── responsive_manager/
├── services/
├── shared_models/
├── shared_widget/
├── text_styling/
├── theme_manager/
├── usecase/
└── validation/



**Purpose:**
- Common UI widgets, enums, and reusable models  
- Error handling (Failure / Exception classes)  
- UseCase layer to separate business logic  
- Theme and responsive management  
- Validation and text utilities  

---

### 🧩 Features Layer

Contains independent feature modules following the Clean Architecture convention.

features/
├── auth/
├── home/
├── notification/
└── my_app/



**Purpose:**
- Each feature contains its own data, domain, and presentation layers  
- Follows **data → domain → presentation** flow using Bloc/Cubit  
- Easy to scale with new modules (cart, orders, payments, etc.)  

---

## ✅ Implemented Features

### 🔐 Authentication
- Email & Password Sign Up / Login  
- Google Sign-In  
- Email Verification Flow  
- Forgot Password  
- Complete Profile (after first Google Sign-In)  
- Persistent login session using Hive  

### 🏠 Home
- Product listing from Supabase API  
- Search field for product filtering  
- Product filtering button  
- “Saved” button for favorites  
- Button leading to Notification screen  

### 🔔 Notifications
- Display notifications grouped by date  
- Button to navigate to Notification Settings screen  

---

## 🛠️ Upcoming Features / Roadmap

- 🧾 Admin Panel for product & user management  
- 💳 Payment System (online + cash)  
- 🛒 Cart & Checkout module  
- ❤️ Wishlist Management  
- 👤 Profile Editing & Address Book  
- 🧩 Multi-language & Localization Support  

