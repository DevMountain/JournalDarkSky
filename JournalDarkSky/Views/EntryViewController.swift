//
//  EntryViewController.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/20/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit
import CoreLocation

class EntryViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var entryTableView: UITableView!
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTableView.delegate = self
        entryTableView.dataSource = self
        fetchQuote()
    }
    
    // MARK: - Private Methods
    
    private func fetchQuote() {
        QuoteService.fetchQuote { (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let quote):
                    self.quoteLabel.text = quote.quoteText + "\n-" + quote.quoteAuthor
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    private func presentNewEntryAlert() {
        let alert = UIAlertController(title: "Entry", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let cancelAction = UIAlertAction(title: "Nvm", style: .cancel)
        alert.addAction(cancelAction)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let textField = alert.textFields?.first,
                let entryText = textField.text,
                !entryText.isEmpty,
                let quote = self.quoteLabel.text,
                let weatherSummary = self.summaryLabel.text,
                let temperature = self.temperatureLabel.text else { return }
            EntryController.shared.createEntry(title: entryText, quote: quote, weatherSummary: weatherSummary, temperature: temperature)
            self.entryTableView.reloadData()
        }
        alert.addAction(saveAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func createEntryButtonTapped(_ sender: Any) {
        presentNewEntryAlert()
    }
}

// MARK: - UITableView Delegate & Data Source

extension EntryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        cell.textLabel?.text = EntryController.shared.entries[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EntryController.shared.entries.count
    }
}
