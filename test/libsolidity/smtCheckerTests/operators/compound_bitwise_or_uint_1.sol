contract C {
    uint[1] c;
    function f(bool b) public {
        require(c[0] == 0);
        if (b)
            c[0] |= 1;
        assert(c[0] <= 1);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 4 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
