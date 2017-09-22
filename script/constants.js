"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var generators_1 = require("../test/bits/generators");
var generators_2 = require("../test/bytes/generators");
var generators_3 = require("../test/patricia_tree/generators");
var generators_4 = require("../test/unsafe/generators");
var path = require("path");
// Paths
exports.ROOT_PATH = path.join(__dirname, '..');
exports.TEST_CONTRACT_PATH = path.join(exports.ROOT_PATH, 'test');
exports.TESTETH_PATH = path.join(exports.ROOT_PATH, 'testeth');
exports.TEST_BIN = path.join(exports.TESTETH_PATH, 'test_bin');
exports.TESTS_PATH = path.join(exports.TESTETH_PATH, 'GeneralStateTests', 'stSolidityTest');
exports.FILLERS_PATH = path.join(exports.TESTETH_PATH, 'src', 'GeneralStateTestsFiller', 'stSolidityTest');
exports.PERF_CONTRACT_PATH = path.join(exports.ROOT_PATH, 'perf');
exports.LOGS = path.join(exports.ROOT_PATH, 'logs');
exports.PERF_LOGS = path.join(exports.LOGS, 'perf');
exports.PERF_BIN = path.join(exports.ROOT_PATH, 'perf_bin');
// Function hashes
exports.TEST_FUN_HASH = 'f8a8fd6d';
exports.PERF_FUN_HASH = '1c4af786';
exports.UNITS = [
    ['bits', 'bits', generators_1.generate],
    ['bytes', 'bytes', generators_2.generate],
    ['patricia_tree', 'patricia_tree', generators_3.generate],
    ['unsafe', 'memory', generators_4.generate]
];