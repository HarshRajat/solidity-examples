pragma solidity ^0.4.16;
pragma experimental "v0.5.0";
pragma experimental "ABIEncoderV2";

library Math {

    uint constant internal UINT_ZERO = 0;
    uint constant internal UINT_ONE = 1;
    uint constant internal UINT_TWO = 2;
    uint constant internal UINT_MAX = ~uint(0);
    uint constant internal UINT_MIN = 0;

    int constant internal INT_ZERO = 0;
    int constant internal INT_ONE = 1;
    int constant internal INT_TWO = 2;
    int constant internal INT_MINUS_ONE = -1;
    int constant internal INT_MAX = int(2**255 - 1);
    int constant internal INT_MIN = int(2**255);

    // For when a Uint needs to be passed by reference.
    struct Uint {
        uint n;
    }

    // For when an Int needs to be passed by reference.
    struct Int {
        uint n;
    }

    // Some math ops with overflow guards.
    function exactAdd(uint a, uint b) internal pure returns (uint sum) {
        sum = a + b;
        require(sum >= a);
    }

    function exactSub(uint a, uint b) internal pure returns (uint diff) {
        require(b <= a);
        diff = a - b;
    }

    function exactMul(uint a, uint b) internal pure returns (uint prod) {
        prod = a * b;
        require(a == 0 || prod / a == b);
    }

    function exactAdd(int a, int b) internal pure returns (int sum) {
        sum = a + b;
        if (a > 0 && b > 0) {
            require(0 <= sum && sum <= INT_MAX);
        } else if (a < 0 && b < 0) {
            require(INT_MIN <= sum && sum <= 0);
        }
    }

    function exactSub(int a, int b) internal pure returns (int diff) {
        require(b != INT_MIN);
        return exactAdd(a, -b);
    }

    function exactMul(int a, int b) internal pure returns (int prod) {
        prod = a * b;
        require((a != INT_MIN || b != INT_MINUS_ONE) && (b != INT_MIN || a != INT_MINUS_ONE));
        require(a == 0 || prod / a == b);
    }

    function exactDiv(int a, int b) internal pure returns (int quot) {
        require(a != INT_MIN || b != INT_MINUS_ONE);
        quot = a / b;
    }
}