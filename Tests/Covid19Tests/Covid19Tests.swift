import XCTest
@testable import Covid19

final class Covid19Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Covid19().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
