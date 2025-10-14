module my_addrx::Intermediate {
    use std::debug::print;
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
}

