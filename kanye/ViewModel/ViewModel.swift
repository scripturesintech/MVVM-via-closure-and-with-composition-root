//
//  ViewModel.swift
//  kanye
//
//  Created by ScripturesInTech on 21/01/23.
//

import Foundation

class ViewModel {

    private var networkProtocol: NetworkProtocol

    init(networkProtocol: NetworkProtocol) {
        self.networkProtocol = networkProtocol
    }
    
    /// loopingIn function
    func loopingIn(completion: @escaping (Quote) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.fetchQuote { quote in
                completion(quote)
                self.loopingIn(completion: completion)
            }
        }
    }

    func fetchQuote(completionHandler: @escaping (Quote) -> Void) {
        let url = URL(string: "https://api.kanye.rest/")!
        networkProtocol.fetchQuote(url: url) { result in
            switch result {
            case .success(let quote):
                completionHandler(quote)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
