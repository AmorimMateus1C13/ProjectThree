//
//  ViewConfiguration.swift
//  ProjectOne
//
//  Created by Mateus Amorim on 01/09/22.
//

import Foundation

protocol ViewConfiguration {
    
    func setupConfiguration()
    func viewHierarchy()
    func setupConstrants()
}

extension ViewConfiguration {
    func setupConfiguration() {
        viewHierarchy()
        setupConstrants()
    }
}
