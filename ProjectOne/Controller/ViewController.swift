//
//  ViewController.swift
//  ProjectOne
//
//  Created by Mateus Amorim on 01/09/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Strom Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        makeContrants()
        takePictures()
        tableView.reloadData()
    }
    
    func makeContrants() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func takePictures() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else{
            return UITableViewCell()
        }
        cell.labelCell.text = pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageView()
        vc.selectImage = pictures[indexPath.row]
            if let nav = self.navigationController {
                nav.pushViewController(vc, animated: true)
            }
    }
}


