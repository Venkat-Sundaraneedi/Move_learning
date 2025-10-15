# 🤝 Contributing to Move Learning

Thank you for your interest in contributing to the **Move Learning** project! Your contributions are vital for making this repository a comprehensive and high-quality resource for beginner Move developers.

---

### 💡 Contribution Philosophy

As an educational repository, the core goals for any contribution are **Clarity** and **Correctness**.

* **Focus on educational clarity**: Examples must be simple, concise, and easy for beginners to understand.
* **Follow Move best practices**: All code should adhere to modern Move language conventions.
* **Keep structure**: Respect the existing `sources/` folder organization and naming conventions.

---

### How to Contribute

Follow these steps to submit your changes:

#### 1. Fork and Branch

1.  **Fork the repository** on GitHub.
2.  **Clone your fork** locally:
    ```bash
    git clone [https://github.com/yourusername/move-learning.git](https://github.com/yourusername/move-learning.git)
    ```
3.  **Create a new branch** for your feature or fix:
    ```bash
    git checkout -b feature/your-awesome-topic
    ```

#### 2. Implement Changes

1.  Make your changes, ensuring they follow the existing code style and conventions.
2.  Add **comments** and **docstrings** where necessary.
3.  Keep examples simple and clear for beginners.
4.  Add **new `#[test]` functions** to your code to prove correctness and demonstrate usage.

#### 3. Testing

You must ensure that all existing and new tests pass before submitting.

```bash
# Run all tests
aptos move test
