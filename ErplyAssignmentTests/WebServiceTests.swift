//
//  WebServiceTests.swift
//  ErplyAssignmentTests
//
//  Created by Umer Khan on 20.06.2023.
//

import XCTest
@testable import ErplyAssignment

final class WebServiceTests: XCTestCase {
    
    var sut: WebService!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        sut = DefaultWebService(session: session)
    }
    
    let mockString =
        """
            { "message": "Hello" }
        """
    
    struct TestResponse: Codable, Equatable {
        let message: String
    }
    
    func testDoRequestSuccess() async throws {
        // Given
        let url = URL(string: "https://example.com")!
        let request = URLRequest(url: url)
        let mockResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        let mockData = Data(mockString.utf8)
        
        MockURLProtocol.requestHandler = { _ in
            return (mockResponse, mockData)
        }
        
        // When
        let result = await sut.performRequest(request, returnType: TestResponse.self)
        
        // Then
        let expectedMessage = TestResponse(message: "Hello")
        XCTAssertEqual(result, .success(expectedMessage))
    }
}
