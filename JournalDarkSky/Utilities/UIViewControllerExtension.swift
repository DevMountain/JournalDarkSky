//
//  UIViewControllerExtension.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/20/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
