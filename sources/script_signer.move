script {
  use std::signer;
  fun main_signer(s: signer) {
    assert!(signer::address_of(&s) == @my_addrx, 0);
  }
}
