import XCTest

import Covid19Tests

var tests = [XCTestCaseEntry]()
tests += Covid19Tests.allTests()
XCTMain(tests)
