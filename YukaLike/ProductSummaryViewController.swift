//
//  ProductSummaryViewController.swift
//  YukaLike
//
//  Created by Joanna Vigné on 03/11/2022.
//

import Foundation
import UIKit

class ProductSummaryViewController: UIViewController {
    var product: Product?
    private let outerStackView = UIStackView()
    private var productImageView: UIImageView = {
        let productImage = UIImage(systemName: "xmark.circle")
        return UIImageView(image: productImage)
    }()
    private let innerStackView = UIStackView()
    private let productLabel = UILabel()
    private let brandLabel = UILabel()
    private let scoreStackView =  UIStackView()
    private var scoreImageView: UIImageView = {
        let scoreImage = UIImage(systemName: "circle.fill")
        return UIImageView(image: scoreImage)
    }()
    private let scoreDescriptionStackView = UIStackView()
    private let scoreAsNumber = UILabel()
    private let scoreAsText = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        displayProductSummary()
    }

    private func displayProductSummary() {
        //product = Product.coca
        guard product != nil else { return }

        configureOuterStackView()
        configureProductImage()
        configureInnerStackView()
        configureProductLabel()
        configureBrandLabel()
        configureScoreView()
        configureScoreImage()
        configureScoreDescription()
        configureScoreNumberView()
        configureScoreTextView()
    }

    private func configureOuterStackView() {
        let containerView = UIView()
        outerStackView.backgroundColor = .systemGray
        outerStackView.axis = .horizontal
        outerStackView.spacing = 8
        containerView.addSubview(outerStackView)
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            view.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 4),
            outerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }

    private func configureProductImage() {
        productImageView.backgroundColor = .black
        productImageView.contentMode = .scaleAspectFit
        outerStackView.addArrangedSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: productImageView.superview!.leadingAnchor),
            productImageView.topAnchor.constraint(equalTo: productImageView.superview!.topAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            productImageView.widthAnchor.constraint(equalToConstant: 71)
        ])
    }

    private func configureInnerStackView() {
        innerStackView.axis = .vertical
        innerStackView.spacing = 8
        outerStackView.addArrangedSubview(innerStackView)
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            innerStackView.topAnchor.constraint(equalTo: innerStackView.superview!.topAnchor),
            innerStackView.heightAnchor.constraint(equalToConstant: innerStackView.intrinsicContentSize.height),
            innerStackView.widthAnchor.constraint(equalToConstant: innerStackView.intrinsicContentSize.width)
        ])
    }

    private func configureProductLabel() {
        productLabel.text = product?.productName
        productLabel.font = .preferredFont(forTextStyle: .body)
        productLabel.backgroundColor = .systemRed
        innerStackView.addArrangedSubview(productLabel)
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productLabel.heightAnchor.constraint(equalToConstant: productLabel.intrinsicContentSize.height),
            productLabel.widthAnchor.constraint(equalToConstant: productLabel.intrinsicContentSize.width)
        ])
    }

    private func configureBrandLabel() {
        brandLabel.text = product?.brands
        brandLabel.font = .preferredFont(forTextStyle: .caption1)
        brandLabel.backgroundColor = .systemMint
        innerStackView.addArrangedSubview(brandLabel)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandLabel.heightAnchor.constraint(equalToConstant: brandLabel.intrinsicContentSize.height),
            brandLabel.widthAnchor.constraint(equalToConstant: brandLabel.intrinsicContentSize.width)
        ])
    }

    private func configureScoreView() {
        scoreStackView.axis = .horizontal
        scoreStackView.spacing = 8
        scoreStackView.backgroundColor = .systemPink
        innerStackView.addArrangedSubview(scoreStackView)
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        /*NSLayoutConstraint.activate([
         scoreStackView.topAnchor.constraint(equalTo: brandLabel.bottomAnchor),
         scoreStackView.leadingAnchor.constraint(equalTo: innerStackView.leadingAnchor),
         scoreStackView.heightAnchor.constraint(equalToConstant: scoreStackView.intrinsicContentSize.height),
         scoreStackView.widthAnchor.constraint(equalToConstant: scoreStackView.intrinsicContentSize.width)
         ])*/
    }

    private func configureScoreImage() {
        scoreImageView.contentMode = .top
        scoreImageView.backgroundColor = .systemOrange
        scoreStackView.addArrangedSubview(scoreImageView)
        scoreImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreImageView.topAnchor.constraint(equalTo: scoreStackView.topAnchor),
            scoreImageView.leadingAnchor.constraint(equalTo: scoreStackView.leadingAnchor),
            scoreImageView.heightAnchor.constraint(equalToConstant: scoreImageView.intrinsicContentSize.height),
            scoreImageView.widthAnchor.constraint(equalToConstant: scoreImageView.intrinsicContentSize.width)
        ])
    }

    private func configureScoreDescription() {
        scoreDescriptionStackView.axis = .vertical
        scoreDescriptionStackView.backgroundColor = .systemYellow
        scoreStackView.addArrangedSubview(scoreDescriptionStackView)
        scoreDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreDescriptionStackView.centerYAnchor.constraint(equalTo: scoreImageView.centerYAnchor)
        ])
    }

    private func configureScoreNumberView() {
        if let score = product?.nutriments.nutritionScoreFr100g {
            scoreAsNumber.text = "\(score)/100"
        } else {
            scoreAsNumber.text = "-"
        }
        scoreAsNumber.backgroundColor = .systemGreen
        scoreDescriptionStackView.addArrangedSubview(scoreAsNumber)
        scoreAsNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreAsNumber.topAnchor.constraint(equalTo: scoreDescriptionStackView.topAnchor),
            scoreAsNumber.leadingAnchor.constraint(equalTo: scoreDescriptionStackView.leadingAnchor),
            scoreAsNumber.heightAnchor.constraint(equalToConstant: scoreAsNumber.intrinsicContentSize.height),
            scoreAsNumber.widthAnchor.constraint(equalToConstant: scoreAsNumber.intrinsicContentSize.width)
        ])
    }

    private func configureScoreTextView() {
        scoreAsText.text = "Excellent"
        scoreAsText.backgroundColor = .systemBrown
        scoreDescriptionStackView.addArrangedSubview(scoreAsText)
        scoreAsText.translatesAutoresizingMaskIntoConstraints = false
        scoreAsText.contentMode = .top
        NSLayoutConstraint.activate([
            scoreAsText.topAnchor.constraint(equalTo: scoreAsNumber.bottomAnchor),
            scoreAsText.leadingAnchor.constraint(equalTo: scoreDescriptionStackView.leadingAnchor),
            scoreAsText.heightAnchor.constraint(equalToConstant: scoreAsText.intrinsicContentSize.height),
            scoreAsText.widthAnchor.constraint(equalToConstant: scoreAsText.intrinsicContentSize.width)
        ])
        let spacer = UIView()
        scoreDescriptionStackView.addArrangedSubview(spacer)
    }
}
