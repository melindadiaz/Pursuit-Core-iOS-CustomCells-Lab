//
//  ShowAlert.swift
//  ProgrammaticUserCells
//
//  Created by Melinda Diaz on 1/31/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: ((UIAlertAction) ->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: completion )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}












//
//extension UIViewController {
//   // completion handler is not really necessary, it to dismiss a view controller after the user presses OK. we have access to this every ViewController
//  func showAlert(title: String, message: String, completion: ((UIAlertAction) -> ())? = nil) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )//style means segue style the transition from one slide to the other. look up more later// a handle is a bloc that execute when the user select an action. it is already equal to nil
//        let okAction = UIAlertAction(title: "ok" , style: .default , handler: completion )
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//    }
//}
