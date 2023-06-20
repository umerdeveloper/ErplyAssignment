//
//  ErplyAssignmentTests.swift
//  ErplyAssignmentTests
//
//  Created by Umer Khan on 19.06.2023.
//

import XCTest
@testable import ErplyAssignment

final class ErplyAssignmentTests: XCTestCase {

    func testNewsNotNil() throws {

        guard let url = Bundle.main.url(forResource: "NewsResponse", withExtension: "json") else {
            XCTFail("Missing file: NewsResponse.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        let model = try? JSONDecoder().decode(NewsModel.self, from: json)

        XCTAssertNotNil(model?.articles)
    }

    func testNewsScreenPropertiesNotNil() throws {

        guard let url = Bundle.main.url(forResource: "NewsResponse", withExtension: "json") else {
            XCTFail("Missing file: NewsResponse.json")
            return
        }

        let json = try Data(contentsOf: url)
        let model = try? JSONDecoder().decode(NewsModel.self, from: json)
        
        XCTAssertNotNil(model?.articles)
        
        let article = model?.articles?.first
        
        XCTAssertNotNil(article?.url)
        XCTAssertNotNil(article?.title)
        XCTAssertNotNil(article?.publishedAt)
        XCTAssertNotNil(article?.urlToImage)
    }
    
    func testNewsDetailScreenPropertiesNotNil() throws {

        guard let url = Bundle.main.url(forResource: "NewsResponse", withExtension: "json") else {
            XCTFail("Missing file: NewsResponse.json")
            return
        }

        let json = try Data(contentsOf: url)
        let model = try? JSONDecoder().decode(NewsModel.self, from: json)

        let article = model?.articles?.first
        
        XCTAssertNotNil(article?.author)
        XCTAssertNotNil(article?.description)
        XCTAssertNotNil(article?.source?.name)
        XCTAssertNotNil(article?.url)
    }

    func testNewsEmpty() throws {

        guard let url = Bundle.main.url(forResource: "NewsEmptyResponse", withExtension: "json") else {
            XCTFail("Missing file: NewsEmpty.json")
            return
        }

        let json = try Data(contentsOf: url)
        let model = try? JSONDecoder().decode(NewsModel.self, from: json)
        
        let articles = model?.articles
        
        XCTAssertTrue(articles!.isEmpty)
    }

}
