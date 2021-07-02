contract C {
	uint[][] a;
	function p() public { a.push(); }
	function q(uint i) public {
		require(i < a.length);
		a[i].push();
	}
	function r() public view {
		for (uint i = 0; i < a.length + 10; ++i)
			for (uint j = 0; j < a[i].length + 20; ++j)
				a[i][j]; // oob access
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6368: (228-232): CHC: Out of bounds access happens here.\nCounterexample:\na = []\ni = 0\nj = 0\n\nTransaction trace:\nC.constructor()\nState: a = []\nC.r()
// Warning 6368: (255-259): CHC: Out of bounds access happens here.\nCounterexample:\na = []\ni = 0\nj = 0\n\nTransaction trace:\nC.constructor()\nState: a = []\nC.r()
// Warning 6368: (255-262): CHC: Out of bounds access happens here.\nCounterexample:\na = []\ni = 0\nj = 0\n\nTransaction trace:\nC.constructor()\nState: a = []\nC.r()
// Warning 5840: CHC: 2 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2661: (184-197): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 2661: (228-244): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
