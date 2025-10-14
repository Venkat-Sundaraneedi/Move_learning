script {
    use std::signer;
    fun main(s: signer) {
        assert!(signer::address_of(&s) == @my_addrx, 0);
    }
}

