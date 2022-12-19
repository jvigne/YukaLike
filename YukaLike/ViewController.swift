//
//  ViewController.swift
//  YukaLike
//
//  Created by Joanna Vigné on 04/10/2022.
//

import UIKit

class ViewController: UIViewController {
    private let productInputLabel = UILabel()
    private let productInput = UITextField()
    private let searchButton = UIButton(type: .system)
    private let vStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureViewComponents()
        setupConstraints()
    }

    // MARK: View look & feel

    private func configureViewComponents() {
        configureTextFieldLabel()
        configureTextField()
        configureSearchButton()
        configureVStack()
    }

    private func configureTextField() {
        productInput.layer.borderWidth = 1
        productInput.layer.borderColor = UIColor.black.cgColor
        productInput.layer.cornerRadius = 4
        productInput.placeholder = "20070472 pour galette des rois"
        productInput.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        vStack.addArrangedSubview(productInput)
    }

    private func configureTextFieldLabel() {
        productInputLabel.text = "Entrer le code produit"
        vStack.addArrangedSubview(productInputLabel)
    }

    private func configureSearchButton() {
        searchButton.setTitle("Rechercher", for: .normal)
        searchButton.configuration = UIButton.Configuration.filled()
        searchButton.addTarget(self, action: #selector(searchProduct), for: .touchUpInside)
        vStack.addArrangedSubview(searchButton)
    }

    private func configureVStack() {
        vStack.axis = .vertical
        vStack.spacing = 16.0
        view.addSubview(vStack)
    }

    // MARK: View constraints

    private func setupConstraints() {
        setupVStackConstraints()
    }

    private func setupVStackConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


    // MARK: View actions

    @objc func searchProduct(_ sender: Any) {
        print("search for \(productInput.text ?? "")")
        guard let productCode = productInput.text else { return }

        getProduct(productCode)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        print(textField.text ?? "")
    }

    // MARK: presenter

    private func getProduct(_ code: String) {
        Task {
            do {
                let product = try await HttpClient.shared.getProduct(code)
                print("Product : \(product.productName)")
                let productVC = ProductSummaryViewController()
                productVC.product = product
                present(productVC, animated: true)
            } catch let error as HttpClient.APIError {
                presentAlert(message: errorMessage(for: error))
            } catch {
                presentAlert(message: "the server did not send back any response")
            }
        }
    }

    private func presentAlert(message: String) {
        let alertVC = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true)
    }

    private func errorMessage(for error: HttpClient.APIError) -> String {
        switch error {
        case .noServerResponse:
            return "Network error: \(error.localizedDescription)"
        case .invalidServerResponse:
            return "unexpected response format"
        case .invalidData:
            return "No data or invalid data"
        case .invalidUrl:
            return "Invalid url"
        }
    }
}

