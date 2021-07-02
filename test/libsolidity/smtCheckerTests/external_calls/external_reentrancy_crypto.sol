abstract contract D {
	function d() virtual public;
}

contract C {
	bytes data;

	bytes32 kec;

	constructor(bytes memory _data) {
		data = _data;

		kec = keccak256(data);
	}

	function check(bytes memory _data) public view {
		bytes32 _kec = keccak256(data);
		assert(_kec == kec); // should hold
		assert(kec == keccak256(_data)); // should fail
	}

	function ext(D d) public {
		d.d();
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (302-333): CHC: Error trying to invoke SMT solver.
// Warning 1218: (302-333): CHC: Error trying to invoke SMT solver.
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 4661: (302-333): BMC: Assertion violation happens here.
