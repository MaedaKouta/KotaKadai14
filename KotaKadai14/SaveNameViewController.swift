//
//  SaveItemViewController.swift
//  KotaKadai14
//
//  Created by 前田航汰 on 2022/03/11.
//

import UIKit

protocol SaveNameDelegate: AnyObject {
    func saveName(name: String)
}

class SaveNameViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    weak var delegate: SaveNameDelegate?

    private func presentAlert(message: String) {
        let alert = UIAlertController(
            title: "警告",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            presentAlert(message: "正しく入力されていません")
            return
        }
        delegate?.saveName(name: name)
    }
}
