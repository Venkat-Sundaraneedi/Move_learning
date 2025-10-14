address my_addrx {

// ================================================================
// │                      Function Visibility                     │
// ================================================================
module A {
    friend my_addrx::B; //declaring friends of module Y

    public(friend) fun A_foo(): u8 {
        return 123
    }
}

module B {
    fun B_foo(): u8 {
        return my_addrx::A::A_foo() //Module B can call A_foo() as B is in friend list of A
    }
}

module C {
    fun C_foo(): u8 {
        // return my_addrx::A::A_foo() //ERROR - as module C is not in friend list of A
        return 0
    }
}
module D {
    use std::debug::print;
    use std::string::utf8;
    public entry fun foo() { //entry function can be private,public or public(friend)
        print(&utf8(b"This is an entry function"));
    }

    #[test]
    fun testing() {
        foo();
    }
}
}

