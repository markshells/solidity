contract C {
	function f(bytes calldata b) external pure {
		require(b.length > 20);
		require(b[0] == 0xff);
		assert(bytes(b[:20]).length == 20);
		assert(bytes(b[:20])[0] == 0xff);
		assert(bytes(b[:20])[5] == 0xff);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (186-218): CHC: Assertion violation happens here.
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 4661: (150-182): BMC: Assertion violation happens here.
