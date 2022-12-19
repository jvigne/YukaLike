//
//  LayoutGuidesViewController.swift
//  YukaLike
//
//  Created by Joanna Vigné on 08/11/2022.
//

import Foundation
import UIKit

final class LayoutGuidesViewController: UIViewController {
  override func viewDidLoad() {
    displayLayoutGuides()
  }

  private func displayLayoutGuides() {
    let viewView = UIView()
    viewView.backgroundColor = .systemRed
    viewView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewView)
    NSLayoutConstraint.activate([
      viewView.topAnchor.constraint(equalTo: view.topAnchor),
      viewView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      viewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      viewView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    let safeAreaView = UIView()
    safeAreaView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(safeAreaView)
    safeAreaView.backgroundColor = .systemYellow
    NSLayoutConstraint.activate([
      safeAreaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      safeAreaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      safeAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      safeAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    ])

    let marginView = UIView()
    marginView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(marginView)
    marginView.backgroundColor = .systemGreen
    NSLayoutConstraint.activate([
      marginView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
      marginView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
      marginView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
      marginView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
    ])
  }
}
