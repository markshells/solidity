contract C
{
	uint[][] a;
	constructor() {
		init();
	}
	function init() internal {
		a.push();
		a.push();
		a[0].push();
		a[1].push();
	}
	function f(bool b) public {
		// Removed due to Spacer's nondeterminism.
		//a[1][1] = 512;
		if (b)
			delete a;
		else
			delete a[1];
		init();
		assert(a[1][0] == 0);
		assert(a[0][0] == 0);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 4661: (315-335): BMC: Assertion violation happens here.
