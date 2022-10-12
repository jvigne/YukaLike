//
//  HttpClient.swift
//  YukaLike
//
//  Created by Joanna Vigné on 04/10/2022.
//

import Foundation

class HttpClient {
    static let shared = HttpClient()
    private var task: URLSessionDataTask?
    
    private init() { }
    
    enum Endpoints {
        private var baseUrl: URL {
            URL(string: "https://world.openfoodfacts.org")!
        }
        
        case product(String)
        
        func url() -> URL {
            switch self {
            case .product(let code):
                return baseUrl.appendingPathComponent("/api/v2/product/\(code)")
            }
        }
    }
    
    enum APIError: Error {
        case noServerResponse
        case invalidServerResponse
        case invalidData
    }

    func getProduct(_ code: String) async throws -> Product {
        let productUrl: URL = Endpoints.product(code).url()
        let (data, response) = try await URLSession.shared.data(from: productUrl)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
        else { throw APIError.invalidServerResponse }

        guard let productResponse = try? JSONDecoder().decode(ProductResponse.self, from: data),
              let product = productResponse.product
        else { throw APIError.invalidData }

        return product
    }
}
