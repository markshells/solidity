abstract contract D {
	function d() external virtual;
}

contract C {
	uint x;
	D d;

	function inc() public {
		++x;
	}

	function f() public {
		d.d();
		assert(x < 10);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (156-170): CHC: Assertion violation happens here.
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2661: (113-116): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
