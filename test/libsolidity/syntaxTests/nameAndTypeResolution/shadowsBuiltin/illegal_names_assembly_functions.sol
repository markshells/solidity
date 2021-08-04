contract C {
    function f() public pure {
        assembly {
            function this() {
            }
            function super() {
            }
            function _() {
            }
        }
    }
}
// ----
// DeclarationError 4113: (75-106): The identifier name "this" is reserved.
// DeclarationError 3859: (75-106): This declaration shadows a declaration outside the inline assembly block.
// DeclarationError 4113: (119-151): The identifier name "super" is reserved.
// DeclarationError 3859: (119-151): This declaration shadows a declaration outside the inline assembly block.
// DeclarationError 4113: (164-192): The identifier name "_" is reserved.
