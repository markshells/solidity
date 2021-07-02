contract DepositContract {
    uint constant MAX_DEPOSIT_COUNT = 2**32 - 1;

    uint256 deposit_count;
    uint256 deposit_count_2;

    function deposit() external {
        require(deposit_count < MAX_DEPOSIT_COUNT);
        deposit_count += 1;
        deposit_count_2 += 10; // should fail
    }
}
// ====
// SMTEngine: all
// ----
// Warning 5840: CHC: 1 verification condition(s) could not be proved. Enable the model checker option "show unproved" to see all of them. Consider choosing a specific contract to be verified in order to reduce the solving problems. Consider increasing the timeout per query.
// Warning 2661: (256-277): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
