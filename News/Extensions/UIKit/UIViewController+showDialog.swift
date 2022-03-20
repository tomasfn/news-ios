//
//  UIViewController+showDialog.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import UIKit

extension UIViewController {
    
    func showAlertDialog(title: String?, message: String?, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle:.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: completion)
    }
}
