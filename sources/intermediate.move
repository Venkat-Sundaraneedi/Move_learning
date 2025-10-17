module my_addrx::Intermediate {
  use std::bcs;
  use std::hash;
  use std::aptos_hash;
  use std::debug::print;
  use std::vector;
  use std::signer;
  use std::simple_map::{SimpleMap, Self};
  use std::string::{String, utf8};

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

  // ================================================================
  // │                          Maps                                │
  // ================================================================

  public fun mapping_in_move() {
    let mp: SimpleMap<u64, String> = simple_map::create(); //creating an empty map where Key->integer and Value->string.

    //adding the key and corresponding value in the map
    mp.add(1, utf8(b"John"));
    mp.add(2, utf8(b"Ben"));
    mp.add(3, utf8(b"Tony"));
    mp.add(4, utf8(b"Gwen"));

    //calculating the length of the map
    let l = mp.length();
    assert!(l == 4, 1);

    //checking if a given key exists or not in the vector
    let x = mp.contains_key(&2);
    assert!(x == true, 1);

    //removing key value pair in the map
    mp.remove(&2);
    assert!(mp.contains_key(&2) == false, 1);

    //borrowing immutable reference to the value of a given key
    let v = mp.borrow(&3);
    assert!(v == &utf8(b"Tony"), 1);

    //borrowing mutable reference to the value of a given key
    let v = mp.borrow_mut(&3);
    *v = utf8(b"Changed Name");

    assert!(mp.borrow(&3) == &utf8(b"Changed Name"), 1);

  }

  #[test]
  fun test_map() {
    mapping_in_move();
  }

  // ================================================================
  // │                      Hash Functions                          │
  // ================================================================

  fun move_hash(): vector<u8> {
    let x: vector<u8> = bcs::to_bytes<u64>(&10);
    let h = hash::sha2_256(x);
    h
  }

  fun move_aptos_hash(): vector<u8> {
    let x: vector<u8> = bcs::to_bytes<u64>(&10);
    let h = aptos_hash::keccak256(x);
    h
  }

  #[test]
  fun test_hash() {
    let tmp = move_hash();
    print(&tmp);
  }

  #[test]
  fun test_aptos_hash() {
    let tmp = move_aptos_hash();
    print(&tmp);
  }

  // ================================================================
  // │                        Unit Tests                            │
  // ================================================================

  struct MyCoin has key {
    value: u64
  }

  public fun make_sure_non_zero_coin(coin: MyCoin): MyCoin {
    assert!(coin.value > 0, 0);
    coin
  }

  public fun has_coin(addr: address): bool {
    exists<MyCoin>(addr)
  }

  #[test]
  fun make_sure_non_zero_coin_passes() {
    let coin = MyCoin { value: 1 };
    let MyCoin { value: _ } = make_sure_non_zero_coin(coin);
  }

  #[test]
  // Or #[expected_failure] if we don't care about the abort code
  #[expected_failure(abort_code = 0, location = Self)]
  fun make_sure_zero_coin_fails() {
    let coin = MyCoin { value: 0 };
    let MyCoin { value: _ } = make_sure_non_zero_coin(coin);
  }

  #[test_only]
  // test only helper function
  fun publish_coin(account: &signer) {
    move_to(account, MyCoin { value: 1 })
  }

  #[test(a = @0x1, b = @0x2)]
  fun test_has_coin(a: signer, b: signer) {
    publish_coin(&a);
    publish_coin(&b);
    assert!(has_coin(@0x1), 0);
    assert!(has_coin(@0x2), 1);
    assert!(!has_coin(@0x3), 1);
  }

  // ================================================================
  // │                          Generics                            │
  // ================================================================

  struct Foo<T> has copy, drop {
    x: T
  }

  struct Bar<T1, T2> has copy, drop {
    x: T1,
    y: vector<T2>
  }

  //a generic identity function that takes a value of any type and returns that value unchanged
  fun generic_example<T>(num: T): T {
    num
  }

  #[test]
  fun test_generic_exmaple() {
    let x: u64 = generic_example<u64>(8);
    let y: bool = generic_example<bool>(true);

    assert!(x == 8, 1);
    assert!(y == true, 1);

  }

  // ================================================================
  // │                      Type Arguments                          │
  // ================================================================

  // fun foo_type_arguments() {
  //   let id = false;
  //   let _x = id<bool>(true);
  // }

  // Currency Specifiers
  struct Currency1 {}

  struct Currency2 {}

  // A generic coin type that can be instantiated using a currency
  // specifier type.
  // e.g. Coin<Currency1>, Coin<Currency2> etc.

  struct Coin<Currency> has store {
    value: u64
  }

  // Write code generically about all currencies
  public fun mint_generic<Currency>(value: u64): Coin<Currency> {
    Coin { value }
  }

  // Write code concretely about one currency
  public fun mint_concrete(value: u64): Coin<Currency1> {
    Coin { value }
  }

  // ================================================================
  // │                      Type Inference                          │
  // ================================================================

  // fun foo_type_inference() {
  //
  //   let _x = id(true);
  //   //        ^ <bool> is inferred
  //
  //   let foo = Foo { x: true };
  //   //           ^ <bool> is inferred
  //
  //   let Foo { x } = foo;
  //   //     ^ <bool> is inferred
  // }
}

