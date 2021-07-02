contract C {
	function abiencodePackedHash(uint a, uint b) public pure {
		require(a == b);
		bytes memory b1 = abi.encodePacked(a, a, a, a);
		bytes memory b2 = abi.encodePacked(b, a, b, a);
		assert(keccak256(b1) == keccak256(b2));

		bytes memory b3 = abi.encode(a, a, a, a);
		assert(keccak256(b1) == keccak256(b3)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (281-319): CHC: Error trying to invoke SMT solver.
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 4661: (281-319): BMC: Assertion violation happens here.
