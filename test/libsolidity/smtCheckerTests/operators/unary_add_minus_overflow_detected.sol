contract C {
	uint8 x;

	function inc_pre() public {
		++x;
	}

	function dec_pre() public {
		--x;
	}

    /* Commented out because Spacer segfaults in Z3 4.8.9
	function inc_post() public {
		x++;
	}

    function dec_post() public {
		x--;
	}
    */
}
// ====
// SMTEngine: all
// ----
// Warning 3944: (95-98): CHC: Underflow (resulting value less than 0) happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.dec_pre()
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2661: (55-58): BMC: Overflow (resulting value larger than 255) happens here.
