# 💰 Flutter Expense Tracker

A beautifully designed, responsive **expense tracking app** built with **Flutter**. Easily manage your daily spending, view analytics with clean charts, and enjoy a smooth experience across both light and dark modes.

---

## 📱 Features

- ✅ Add expenses with title, amount, date, and category
- 🗂️ Categories include: **Food**, **Travel**, **Leisure**, **Work**
- 📊 Real-time bar chart visualization
- 🌓 Automatic support for system light & dark theme
- 💻 Responsive layout (mobile + tablet)
- 🧽 Swipe to delete with **Undo** action

---

## 🎥 Demo

> ![Demo](expense_tracker/screenshots/Animation.gif)

---

## 🖼 Screenshots

| Home (Light) | Home (Dark) |
|--------------|-------------|
| ![Home Light](expense_tracker/screenshots/ET_Lightmode.png) | ![Home Dark](expense_tracker/screenshots/ET_Darkmode.png) |

| New Expense Form | Chart |
|------------------|-------|
| ![Form](expense_tracker/screenshots/Form.png) | ![Chart](expense_tracker/screenshots/Chart.png) |

> 💡 You can add dark mode versions too, like `form_dark.png` and `chart_dark.png`

---

## 🧑‍💻 Tech Stack

- **Flutter** (Material 3)
- **Dart**
- [`intl`](https://pub.dev/packages/intl) — Date formatting
- [`uuid`](https://pub.dev/packages/uuid) — Unique expense IDs

---

## ⚙️ Getting Started

To run the app locally:

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/flutter_expense_tracker.git
cd flutter_expense_tracker
```
### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App
```bash
flutter run
```
---
## 🚀 App Overview

Modal Sheet: Add new expenses using a scrollable, responsive modal

SnackBar with Undo: Safely delete and restore expenses

Responsive Layout: Switches between column (mobile) and row (tablet)

Dynamic Chart Bars: Based on max category-wise spending

---
## 🧠 What I Learned
Building reusable widgets and clean architecture in Flutter

Using MediaQuery & LayoutBuilder for responsive design

Handling user input and validation

Theme customization for light and dark modes
---
🔮 Future Improvements
 Add local storage with shared_preferences or hive

 Add filters and sorting

 Export expenses to CSV

 Add app settings page
---
## 👤 Author
Made with ❤️ by Danish Nadeem
📧 danishnadeem16@gmail.com
🔗 LinkedIn • GitHub