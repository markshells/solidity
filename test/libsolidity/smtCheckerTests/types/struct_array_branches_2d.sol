contract C
{
	struct S { uint[][] a; }
	function f(bool b) public pure {
		S memory c;
		c.a = new uint[][](1);
		c.a[0] = new uint[](1);
		c.a[0][0] = 0;
		if (b)
			c.a[0][0] = 1;
		else
			c.a[0][0] = 2;
		assert(c.a[0][0] > 0);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 2 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
