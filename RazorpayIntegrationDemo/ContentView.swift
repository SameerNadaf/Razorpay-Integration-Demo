//
//  ContentView.swift
//  RazorpayIntegrationDemo
//
//  Created by Sameer Nadaf on 31/01/26.
//

import SwiftUI

struct ContentView: View {
    let sampleProduct = Product(
        name: "Premium Smart Watch",
        description: "Stay connected and healthy with our latest smart watch. Features include heart rate monitoring, GPS tracking, sleep analysis, and a stunning retina display. Water-resistant up to 50 meters.",
        price: 399.00,
        imageName: "applewatch.watchface"
    )
    
    var body: some View {
        ProductDetailView(product: sampleProduct)
    }
}

#Preview {
    ContentView()
}
