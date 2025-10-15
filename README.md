### README.md

```markdown
# 🚀 Move Learning Examples

Welcome to **Move Learning**, a curated collection of examples and exercises to help beginners learn the **Move programming language**, primarily used in the **Aptos blockchain**. This repository guides learners from **basic concepts** to **intermediate modules and scripts**.

---

## 📚 Table of Contents

1. [Project Overview](#project-overview)
2. [Folder Structure](#folder-structure)
3. [Getting Started](#getting-started)
4. [Learning Modules](#learning-modules)
5. [Scripts](#scripts)
6. [Testing](#testing)
7. [Contributing](#contributing)
8. [License](#license)

---

## 📝 Project Overview

This repository is designed for beginners and includes:

- **Primitive Types**: integers, booleans, addresses, strings
- **Control Flow & Loops**: `if`, `while`, `for`, and `loop` constructs
- **Functions**: returning single/multiple values, error handling
- **Structs**: creating and managing user-defined types
- **Module Visibility**: public, private, friend, entry functions
- **Scripts**: simple examples demonstrating basic operations

The goal is to **make learning Move simple, practical, and interactive**.

---

## 📂 Folder Structure

```

Move-Learning/
├── sources/
│   ├── basic.move           # Basic Move examples (types, functions, loops, structs)
│   ├── intermediate.move    # Intermediate concepts (visibility, entry functions)
│   ├── fun_visibility.move  # Function visibility examples
│   ├── script_basic.move    # Simple Move script examples
│   └── script_signer.move   # Scripts interacting with signer addresses
├── Move.toml                # Project configuration
├── README.md                # Project overview and instructions
├── CONTRIBUTING.md          # Contribution guidelines
└── LICENSE                  # License details

````

---

## ⚡ Getting Started

1. **Install Aptos CLI**
   Follow the official [Aptos CLI Installation Guide](https://aptos.dev/cli-tools/aptos-cli)

2. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/move-learning.git
   cd move-learning
````

3. **Compile Move code**

   ```bash
   aptos move compile
   ```

4. **Run tests**

   ```bash
   aptos move test
   ```

> ⚠️ Ensure your Move environment is set up properly before running scripts.

---

## 📖 Learning Modules

### 1️⃣ Basic Module

* Demonstrates **primitive types**, **strings**, **comments**, **functions**, **loops**, and **structs**
* Includes functions like:

  * `primitive_types()`
  * `greeting_string()`
  * `sum_using_for()`
  * `create_user()`
* Shows **error handling** using `abort` and `assert!`

### 2️⃣ Intermediate Module

* Covers **function visibility** (`public`, `friend`, `private`)
* Demonstrates module interaction rules
* Introduces **entry functions**

### 3️⃣ Function Visibility Module

* Explains **public(friend)** access modifier
* Shows how **friend modules** can access specific functions
* Demonstrates **entry functions** callable externally

---

## 💻 Scripts

* **script_basic.move**: Simple increment operation
* **script_signer.move**: Example interacting with a signer
* Both use `std::debug::print` to display output

---

## 🧪 Testing

* Functions are marked with `#[test]`
* Run all tests using:

  ```bash
  aptos move test
  ```
* Tests cover primitives, loops, functions, error handling, and structs

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

* Fork the repository
* Create a new branch for your feature or fix
* Follow existing **coding style and conventions**
* Test your changes
* Submit a **pull request** with a clear description

---

## 📄 License

This project is licensed under the **MIT License** – see [LICENSE](LICENSE) for details.

````


### `CONTRIBUTING.md`
```markdown
# 🤝 Contributing to Move Learning

Thank you for your interest in contributing to the **Move Learning** project! Contributions are welcome and help make this repository more comprehensive and beginner-friendly.

---

## How to Contribute

1. **Fork the repository**
   Click the “Fork” button at the top-right of this repository.

2. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
````

3. **Make your changes**

   * Follow existing **code style and conventions**
   * Add **comments** and **docstrings** where necessary
   * Keep examples simple and clear for beginners

4. **Test your changes**

   ```bash
   aptos move test
   ```

5. **Commit and push changes**

   ```bash
   git add .
   git commit -m "Add description of your changes"
   git push origin feature/your-feature-name
   ```

6. **Open a pull request**

   * Include a **clear description** of your changes
   * Reference any related issues if applicable

---

## Guidelines

* Focus on **educational clarity**: examples should be easy to understand
* Follow **Move language best practices**
* Respect the **existing project structure**
* Avoid breaking existing tests

---

## Need Help?

If you have questions, feel free to open an **issue** or discuss improvements with the maintainers.

```
```
