contract C {
    struct S {
        uint x;
    }
    S s;
    function f(bool b) public {
        s.x |= b ? 1 : 2;
        assert(s.x > 0);
    }
}
// ====
// SMTEngine: bmc
// SMTShowUnproved: yes
// ----
// Warning 7812: (125-140): BMC: Assertion violation might happen here.
