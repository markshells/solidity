contract C
{
	uint[][][] c;
	constructor() {
		c.push();
		c[0].push();
		c[0][0].push();
	}
	function f(bool b) public {
		c[0][0][0] = 0;
		if (b)
			c[0][0][0] = 1;
		assert(c[0][0][0] > 0);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (170-192): CHC: Assertion violation happens here.\nCounterexample:\nc = [[[0]]]\nb = false\n\nTransaction trace:\nC.constructor()\nState: c = [[[0]]]\nC.f(false)
// Warning 5840: CHC: 6 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
