# 🛡️ RPG Console Game (Final Project - Module 2)

This is a console-based role-playing game developed as the final project for **Module 2** in the App Development course at the Syntax Institute.  
The game runs entirely in the terminal and showcases object-oriented design in Swift.

## 📦 Features

- Fully turn-based combat system
- Multiple hero and enemy types with unique attacks and abilities
- Buffs, and healing mechanics
- XP, coins, and day-night progression system
- A basic item shop and inn system
- Terminal styling with formatted text (only visible in external terminal)

> ⚠️ The game currently contains only example heroes and enemies.  
> A full story and world are planned for future versions.

## ▶️ How to Launch the Game

### Option 1: Run via Xcode

1. Open the `RPG.xcodeproj` file in Xcode.
2. Select the **RPG** target.
3. Press **⌘B (Command + B)** to build the project.
4. In the Finder, navigate to:
   ```
   [YourProjectFolder]/Build/Products/Debug/
   ```
5. Double-click the `RPG` executable to run the game in a proper **macOS Terminal window**.

> ⚠️ **Recommendation:**  
> Avoid running the game directly in the Xcode console.  
> Terminal styling (e.g. colored text or formatting codes) will not render correctly in Xcode's built-in console.

### Option 2: Run via Terminal

1. Open Terminal.
2. Navigate to the project root directory (where `main.swift` is located).
3. Compile using Swift:
   ```bash
   swiftc -o RPG RPG/main.swift
   ./RPG
   ```

## 🔧 Requirements

- macOS with Xcode or Swift command line tools installed
- Swift 5 or higher

---

This game is a work in progress and will continue to grow in complexity and scope.  
Feedback and suggestions are welcome!

### UML

<img src=img/UML.png width="50%">

