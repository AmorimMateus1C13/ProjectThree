//
//  CustomTableViewCell.swift
//  ProjectOne
//
//  Created by Mateus Amorim on 01/09/22.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConfiguration()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let labelCell: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
}

extension CustomTableViewCell: ViewConfiguration {
    func viewHierarchy() {
        addSubview(labelCell)
    }

    func setupConstrants() {
        labelCell.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}


