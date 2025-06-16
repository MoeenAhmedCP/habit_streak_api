# 🧠 Habit Streak Tracker API

A Ruby on Rails API backend for tracking daily habits, visualizing progress, and maintaining streaks. This app powers the Habit Streak Tracker frontend built in React.

## 🚀 Features

- ✅ User authentication with JWT (Devise + devise-jwt)
- 🔁 Habit management (create, update, archive)
- 📆 Daily habit entries (check-ins)
- 🔥 Streak tracking and analytics
- 📊 API ready for visualization in React (line charts, heatmaps)
- 🔐 CORS support for frontend integration

---

## ⚙️ Tech Stack

- **Ruby on Rails 7 (API mode)**
- **PostgreSQL**
- **Devise + JWT for authentication**
- **ActiveModelSerializers for JSON responses**
- **Rack CORS middleware**

---

## 🗂️ Endpoints Overview

### 🔐 Authentication

| Method | Endpoint         | Description         |
|--------|------------------|---------------------|
| POST   | `/api/v1/login`  | Log in user, returns JWT |
| POST   | `/api/v1/register` | Register new user  |
| DELETE | `/api/v1/logout` | Revoke JWT token    |

> All protected endpoints require `Authorization: Bearer <JWT>` in headers.

---

### 📋 Habits

| Method | Endpoint              | Description                |
|--------|-----------------------|----------------------------|
| GET    | `/api/v1/habits`      | List user habits           |
| POST   | `/api/v1/habits`      | Create a new habit         |
| PUT    | `/api/v1/habits/:id`  | Update habit               |
| DELETE | `/api/v1/habits/:id`  | Delete (or archive) habit  |

---

### 📅 Habit Entries (Check-ins)

| Method | Endpoint                                          | Description                  |
|--------|---------------------------------------------------|------------------------------|
| GET    | `/api/v1/habits/:habit_id/entries`               | Get entries for a habit      |
| POST   | `/api/v1/habits/:habit_id/entries`               | Mark a check-in for a day    |
| PUT    | `/api/v1/entries/:id`                            | Update check-in (if needed)  |

---

## 🏁 Getting Started

### Prerequisites

- Ruby = 3.2.2
- Rails >= 7
- PostgreSQL
- Node & Yarn (for API mode asset handling if needed)

### Setup

```bash
git clone (https://github.com/MoeenAhmedCP/habit_streak_api.git)
cd habit_streak_api

bundle install
rails db:create db:migrate

# Set your JWT secret key in credentials or environment
EDITOR="code --wait" bin/rails credentials:edit

# Add:
devise_jwt_secret_key: <your-long-secret>
