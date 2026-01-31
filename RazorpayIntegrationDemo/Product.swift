//
//  Product.swift
//  RazorpayIntegrationDemo
//
//  Created by Sameer Nadaf on 31/01/26.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageName: String
}
