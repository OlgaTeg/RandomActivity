//
//  ViewController.swift
//  RandomActivity
//
//  Created by Olga Tegza on 26.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var randomActivity: RandomActivity?

    @IBOutlet var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.activityURL.rawValue)
        setupNavigationBar()
    }

    @IBAction func generateButtonTapped() {
        activityLabel.text = randomActivity?.description
    }
    
    @objc private func refresh() {
        fetchData(from: Link.activityURL.rawValue)
        activityLabel.text = ""
    }
}

extension ViewController {
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetch(RandomActivity.self, from: url) { [weak self] result in
            switch result {
            case .success(let randomActivity):
                self?.randomActivity = randomActivity
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refresh)
        )
    }
}
