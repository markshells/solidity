contract C {
	function f(string memory sig, uint x, uint[] memory a) public pure {
		bytes memory b1 = abi.encodeWithSignature(sig, x, a);
		bytes memory b2 = abi.encodeWithSelector(bytes4(keccak256(bytes(sig))), x, a);
		// should hold but we do not evaluate keccak256 in an interpreted way
		assert(b1.length == b2.length);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2788: BMC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
