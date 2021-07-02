contract C {
	function f(int x, int y) public pure {
		require(y != 0);
		require(x == 42);
		int z1 = x % y;
		int z2 = -x % y;
		assert(z1 == -z2);
		assert((x >= 0 && z1 >=0) || (x <= 0 && z1 <= 0));
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
