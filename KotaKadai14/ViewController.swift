//
//  ViewController.swift
//  KotaKadai14
//
//  Created by 前田航汰 on 2022/03/11.
//

import UIKit

struct CheckItem {
    var name: String
    var isChecked: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!

    private var checkItems: [CheckItem] = [
        .init(name: "りんご", isChecked: false),
        .init(name: "みかん", isChecked: true),
        .init(name: "バナナ", isChecked: false),
        .init(name: "パイナップル", isChecked: true)
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.configure(checkItem: checkItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkItems[indexPath.row].isChecked.toggle()
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "nextVC" {
            guard let nav = segue.destination as? UINavigationController, let saveNameVC = nav.topViewController as? SaveNameViewController else {
                return
            }
            saveNameVC.delegate = self
        }
    }

    @IBAction func cancelExit(segue: UIStoryboardSegue) {
    }

}

extension ViewController:  SaveNameDelegate {
    func saveName(name: String) {
        checkItems.append(.init(name: name, isChecked: false))
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }
}
