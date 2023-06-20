//
//  DateTests.swift
//  ErplyAssignmentTests
//
//  Created by Umer Khan on 20.06.2023.
//

import XCTest

final class DateTests: XCTestCase {

    func testReceivedPublishedAtStringIsValidDate() {
        let randomReceivedDateFromServer = "2023-02-18T21:44:45Z"

        XCTAssertNotNil(randomReceivedDateFromServer.asDate, "invalid date format")
    }
}
