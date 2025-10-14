module my_addrx::Basic {
  use std::debug::print;
  use std::string::{String, utf8};

  #[test_only]
  use std::vector;

  fun primitive_types() {

    //Integers: u8,u64,u128
    let a: u8 = 10;
    let b: u64 = 1000;
    let c: u128 = 10000;
    print(&a);
    print(&b);
    print(&c);

    //Boolean: true,false
    let b1: bool = true;
    let b2: bool = false;
    print(&b1);
    print(&b2);

    //Address: addresses in move are represented by @Variable_name
    let addx1: address = @std;
    let addx2: address = @0x123;
    print(&addx1);
    print(&addx2);

  }

  #[test]
  fun test_primitive_types() {
    primitive_types();
  }

  // ================================================================
  // │                          Strings                             │
  // ================================================================
  fun greeting_string(): String {
    let greet: String = utf8(b"Welcome to Aptos Move by Example String");
    return greet
  }

  fun greeting_vec(): vector<u8> {
    let greet: vector<u8> = b"Welcome to Aptos move by examples Vector ex";
    return greet
  }

  #[test]
  fun test_greeting_string() {
    let greet = greeting_string();
    print(&greet);
  }

  #[test]
  fun test_greeting_vec() {
    let greet = greeting_vec();
    print(&greet);
    print(&utf8(greet));
  }

  // ================================================================
  // │                         Comments                             │
  // ================================================================

  fun printing_comments() {
    //This is a line comment

    /*
        This
        is a
        block
        comment
    */

    let a = /*You can put block comment here*/ 12345;
    print(& /*Even here*/ a);

  }

  #[test]
  fun test_comments() {
    printing_comments();
  }

  // ================================================================
  // │                          Functions                           │
  // ================================================================

  fun greet_fun() {
    print(&utf8(b"Functions in move"));
  }

  fun sqaure_fun(num: u64) {
    let s = num * num;
    print(&s);
  }

  //function returning maximum of two numbers
  fun max_fun(num1: u64, num2: u64): u64 {
    if (num1 < num2) return num2 else return num1
  }

  //In move a function can return multiple values
  fun is_even_fun(num: u64): (u64, bool) {
    if (num % 2 == 0) return (num, true) else return (num, false)
  }

  #[test]
  fun test_fun() {
    greet_fun();
    sqaure_fun(10);

    let m = max_fun(53, 10);
    print(&m);

    let (v1, v2) = is_even_fun(4);
    print(&v1);
    print(&v2);

  }

  // ================================================================
  // │                      control_flow                            │
  // ================================================================
  fun control_flow() {
    let val: bool = true;
    if (val) {
      print(&utf8(b"If block"));
    } else {
      print(&utf8(b"Else block"));
    }; //if is an expression therefore it should be end with a semicolon.
  }

  #[test]
  fun test_contro_flow() {
    control_flow();
  }

  // ================================================================
  // │                          Loops                               │
  // ================================================================

  //lets find the sum of first N natural numbers using while and infinite loop

  //using while loop
  fun sum_using_while(n: u64): u64 {
    let sum = 0;
    let i: u64 = 1; //setting counter to 1
    while (i <= n) //This Loop will run until the expression inside the round brackets is valid
    {
      sum += i;
      i += 1; //incrementing the counter
    }; //while is an expression therefore it should be end with a semicolon.
    sum //you can also return in functions like this.
  }

  //using for loop
  fun sum_using_for(n: u64): u64 {
    let sum = 0;
    for (i in 1..(n + 1)) //range -> from 1 to n
    {
      sum += i;
    }; //for is an expression therefore it should be end with a semicolon.
    sum //you can also return in functions like this.
  }

  //using infinite loop
  fun sum_using_loop(n: u64): u64 {
    let sum = 0;
    let i: u64 = 1;
    loop {
      sum += i;
      i += 1;
      if (i > n) break; //break statement terminates the loops
    };
    sum
  }

  #[test]
  fun test_loops() {
    let sum = sum_using_while(10);
    print(&sum);
    let sum = sum_using_loop(10);
    print(&sum);
    let sum = sum_using_for(10);
    print(&sum);
  }

  // ================================================================
  // │                          Error                               │
  // ================================================================
  fun isEven_abort(num: u64) {
    if (num % 2 == 0) {
      print(&utf8(b"No Error as the Number is Even"));
    } else {
      abort 11 //throwing error as the given number is not even
    }
  }

  fun isEven_assert(num: u64) {
    assert!(num % 2 == 0, 11);
  }

  #[test]
  fun test_err() {
    isEven_abort(2);
    isEven_assert(2);
    // isEven(3); // This will give error coz its odd num.
    // isEven_assert(3); // This will give error coz its odd num.
  }

  // ================================================================
  // │                        Structs                               │
  // ================================================================

  struct Users has key, drop {
    list_of_users: vector<User> //storing the list of the users
  }

  struct User has store, drop, copy {
    name: String, //information required for a typical user
    age: u8
  }

  //creating a user by adding the user to the existing list and returning the user
  public fun create_user(newUser: User, users: &mut Users): User {
    users.list_of_users.push_back(newUser);
    return newUser
  }

  #[test]
  fun test_create_friend() {
    let user1 = User { name: utf8(b"Tony"), age: 50 };

    let users = Users {
      list_of_users: vector::empty<User>()
    };

    let createdUser = create_user(user1, &mut users);
    print(&users);
    assert!(createdUser.name == utf8(b"Tony"), 0);
  }

  // ================================================================
  // │                        Operations                            │
  // ================================================================
  fun arthmetic_operations(a: u64, b: u64) {
    let ans = a + b;
    print(&ans);
    let ans = a - b;
    print(&ans);
    let ans = a * b;
    print(&ans);
    let ans = a / b;
    print(&ans);
    let ans = a % b;
    print(&ans);

  }

  #[test]
  fun test_operations() {
    arthmetic_operations(10, 3);
  }
}
