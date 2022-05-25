//
//  CountryModel.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import Foundation

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}
