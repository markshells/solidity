contract C {
    uint a;
    bool b;

	constructor(bool _b) {
		b = _b;
	}

    function f() public returns(uint c) {
        c = b ? a + 10 : ++a;
        assert(c >= a);
    }
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 2 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2661: (134-140): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 2661: (143-146): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
