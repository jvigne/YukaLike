//
//  ViewController.swift
//  YukaLike
//
//  Created by Joanna Vigné on 04/10/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getProduct("04963406")
    }
    
    private func getProduct(_ code: String) {
        HttpClient.shared.getProduct(code) { product, apiError in
            guard let product = product, apiError == nil else {
                self.handleAPIError(error: apiError!)
                return
            }
            
            print("Product : \(product.productName)")
        }
    }

    
    private func handleAPIError(error: HttpClient.APIError) {
        switch error {
        case .noServerResponse:
            print("Network error: \(error.localizedDescription)")
        case .invalidServerResponse:
            print("unexpected response format")
        case .invalidData:
            print("No data or invalid data")
        }
    }
}

