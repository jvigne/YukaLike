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
        
//    v1
//        func getProduct(_ code: String, handler: @escaping (Product?, APIError?) -> Void) async throws {
//            let productUrl: URL = Endpoints.product(code).url()
//            let session = URLSession(configuration: .default)
//            task?.cancel()
//            let task = session.dataTask(with: productUrl) { (data, response, error) in
//            guard error == nil else {
//                handler(nil, APIError.noServerResponse)
//                return
//            }
//            guard let response = response as? HTTPURLResponse,
//                  response.statusCode == 200,
//                  response.mimeType == "application/json"
//            else {
//                handler(nil, APIError.invalidServerResponse)
//                return
//            }
//            guard let data = data, let productResponse = try? JSONDecoder().decode(ProductResponse.self, from: data) else {
//                handler(nil, APIError.invalidData)
//                return
//            }
//
//            handler(productResponse.product, nil)
//        }
        //task?.resume()
//    }
}


