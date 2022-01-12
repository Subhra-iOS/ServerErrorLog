import XCTest
@testable import ServerErrorLog

final class ServerErrorLogTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ServerErrorLog().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
