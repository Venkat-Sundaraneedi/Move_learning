# 🚀 Move Learning Examples

> A curated, beginner-friendly collection of examples for learning the **Move Programming Language** on the Aptos Blockchain.

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Move Version](https://img.shields.io/badge/Move-Aptos-brightgreen)](https://aptos.dev/)
[![Made with Aptos CLI](https://img.shields.io/badge/Tool-Aptos%20CLI-red)](https://aptos.dev/cli-tools/aptos-cli)

---

## 📚 Table of Contents

1. [✨ Key Features](#-key-features)
2. [⚡ Getting Started](#⚡-getting-started)
3. [📖 Learning Modules](#-learning-modules)
    * [Basic Concepts](#basic-concepts)
    * [Intermediate Concepts](#intermediate-concepts)
    * [Function Visibility](#function-visibility)
4. [💻 Scripts](#-scripts)
5. [🧪 Testing](#-testing)
6. [🤝 Contributing](#-contributing)
7. [📄 License](#-license)

---

## ✨ Key Features

This repository is designed to make learning Move **simple, practical, and interactive** by focusing on core concepts:

*  **🧱 Primitive Types:** Clear examples of `u8`, `u64`, `bool`, and `address`.
*  **🔁 Control Flow:** Practical demonstrations of `if/else`, `while`, `for`, and infinite `loop` constructs.
*  **🛡️ Error Handling:** Concise usage of **`abort`** and **`assert!`** for predictable error management.
*  **📦 Data Structures:** Examples for defining **`structs`** with abilities like `key`, `drop`, `store`, and `copy`.
*  **👤 Signer Interaction:** Scripts demonstrating how to use the **`&signer`** type and retrieve its address.
*  **🔎 Module Visibility:** Deep dive into `public`, `private`, and the advanced **`public(friend)`** visibility modifier.

---

## ⚡ Getting Started

The project uses the **Aptos CLI** for compilation and testing.

### Prerequisites

1.  **Install Aptos CLI:** Follow the official [Aptos CLI Installation Guide](https://aptos.dev/cli-tools/aptos-cli).

### Installation and Setup

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/yourusername/move-learning.git](https://github.com/yourusername/move-learning.git)
    cd move-learning
    ```

2.  **Compile the modules:**
    ```bash
    aptos move compile
    ```

3.  **Run all included tests:**
    ```bash
    aptos move test
    ```

> 💡 **Tip:** Ensure your Move environment and the Aptos CLI are configured correctly to run the tests and scripts.

---

## 📖 Learning Modules

All core educational content resides in the `sources/` directory, structured by complexity.

### Basic Concepts (`sources/basic.move`)

*  **`primitive_types()`:** Shows usage of `u8`, `u64`, `u128`, `bool`, and `address`.
*  **`sum_using_*`:** Demonstrates calculation loops using `while`, `for`, and `loop`.
*  **`isEven_abort` / `isEven_assert`:** Examples of proper error handling.
*  **`create_user`:** A practical example of defining and using structs.

### Intermediate Concepts (`sources/intermediate.move`)

*  **`local_variables()`:** Covers variable assignment, type annotations, and variable shadowing.
*  **`constants()`:** Demonstrates declaration and usage of module-level constants.
*  **Vectors & Strings:** Examples using byte strings (`b"..."`) and hex strings (`x"..."`) for `vector<u8>`.
*  **Signer:** Shows how to use the `&signer` type and the `signer::address_of` function.
*  **Uses & Aliases:** Comprehensive examples of various `use` declaration syntax, including aliases and block scoping.

### Function Visibility (`sources/fun_visibility.move`)

*  **`public(friend)`:** Explains the restricted access modifier where only modules listed in the `friend` declaration can call the function.
*  **`entry fun foo()`:** Demonstrates the structure of an externally callable entry function.

---

## 💻 Scripts

Scripts are used to execute logic outside of modules, often as transaction payload examples.

*  **`script_basic.move`:** A simple example demonstrating basic arithmetic and using `std::debug::print`.
*  **`script_signer.move`:** An example showing how to assert the address of the transaction **`signer`**.

---

## 🧪 Testing

 All modules include inline test functions marked with `#[test]` and `#[test_only]`. This ensures the examples are always working and provides immediate confirmation of the expected behavior.

Run all tests with:
```bash
aptos move test
