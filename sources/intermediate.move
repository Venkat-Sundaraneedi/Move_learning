module my_addrx::Intermediate {
  use std::debug::print;
  use std::vector;
  use std::signer;

  // ================================================================
  // │                      local_variables                         │
  // ================================================================

  fun local_variables() {
    let _a = 1;
    let _b: u8;
    let _c = false;
    let _d = b"hello world";
    let _e: u64 = 10000;
    let _f: address = @my_addrx;

    //Valid
    let (_x, _y, z) = (1, @0x1, false);
    _ = z; //This is called shadowning
    //Invalid
    // let (p, q) = (1, 2, 3, 4);
  }

  // ================================================================
  // │                         constants                            │
  // ================================================================

  const X: u64 = 10;
  const Y: address = @my_addrx;
  const Z: bool = false;

  fun constants() {
    print(&X);
    print(&Y);
    print(&Z);

  }

  #[test]
  fun test_const() {
    constants();
  }

  // ================================================================
  // │                          Signer                              │
  // ================================================================

  struct MyResource has key {
    value: u64
  }

  public entry fun increase_value_by_one(account: &signer) acquires MyResource {

    let signer_address = signer::address_of(account);

    let myresource = borrow_global_mut<MyResource>(signer_address);
    myresource.value += 1;
  }

  // ================================================================
  // │                          Vectors                             │
  // ================================================================

  fun vec() {

    let _byte_string_example: vector<u8> = b"Hello world"; //Byte strings are quoted string literals prefixed by a b
    let _hex_string_example: vector<u8> = x"48656c6c6f20776f726c64"; //Hex strings are quoted string literals prefixed by a x

    let list = vector::empty<u64>();

    list.push_back(10);
    list.push_back(20);

    assert!(list[0] == 10, 9);
    assert!(list[1] == 20, 9);

    assert!(list.pop_back() == 20, 9);
    assert!(list.pop_back() == 10, 9);

    let x = vector::singleton<u64>(10);
    let _y = copy x; // compiler error without the copy!
  }

  // ================================================================
  // │                          Address                             │
  // ================================================================

  fun addr() {

    let addrx1: address = @0x1; //numerical address example
    let addrx2: address = @my_addrx; //named address example

    print(&addrx1);
    print(&addrx2);
  }

  // ================================================================
  // │                     Uses & Aliases                           │
  // ================================================================

  /*
  use <address>::<module name>;
  use <address>::<module name> as <module alias name>;
  use <address>::<module name>::<module member>;
  use <address>::<module name>::<module member> as <member alias>;
  use <address>::<module name>::{<module member>, <module member> as <member alias> ... };
  */

  /*
  use std::vector;
  use std::debug as d;
  use std::debug::print as p;
  */

  // SELF
  // use std::simple_map::{Self, SimpleMap};

  // You can add use statements anywhere inside the module
  fun use_anywhere(): vector<u8> {
    // You can add use declarations to the beginning of any expression block

    // use std::vector; // WARNING! Commented out because it's an unused import

    let v = empty();
    v.push_back(0);
    v.push_back(10);
    v
  }

  use std::vector::empty;

  fun use_with_scope(): vector<u8> {
    // As with let, the aliases introduced by use in an expression block are removed at the end of that block.

    let result = {
      use std::vector::empty;

      let v = empty();
      // use std::vector; // ERROR! Should be at the start of the expression block
      v.push_back(0);
      v.push_back(10);
      v
    };
    // let v2 = empty(); // ERROR!
    //           ^^^^^ unbound function 'empty'
    result
  }
}
