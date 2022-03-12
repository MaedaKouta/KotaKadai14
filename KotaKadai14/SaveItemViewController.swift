//
//  SaveItemViewController.swift
//  KotaKadai14
//
//  Created by 前田航汰 on 2022/03/11.
//

import UIKit

class SaveItemViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!

    func getSaveItem() -> String {
        nameTextField.text ?? ""
    }

}
