//
//  kanyeTests.swift
//  kanyeTests
//
//  Created by ScripturesInTech on 21/01/23.
//

import XCTest

@testable import kanye

class kanyeTests: XCTestCase {

    private var sut: ViewModel!
    private var networkManager: MockWebService!

    override func setUpWithError() throws {
        networkManager = MockWebService()
        sut = ViewModel(networkProtocol: networkManager)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        networkManager = nil
        try super.tearDownWithError()
    }

    func test_apiSuccessResult() {

        //Given [Arrange]
        let quote = Quote(quote: "Good Morning Folks!")
        networkManager.fetchQuoteResult = .success(quote)

        //When [Act]
        sut.fetchQuote { networkQuote in
            //Then [Assert]
            XCTAssertEqual(networkQuote.quote, quote.quote)
        }
    }
}

class MockWebService: NetworkProtocol {

    var fetchQuoteResult: Result<Quote, Error>?
    func fetchQuote(url: URL, complition: @escaping (Result<Quote, Error>) -> (Void)) {
        if let result = fetchQuoteResult {
            complition(result)
        }
    }
}
