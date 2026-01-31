//
//  ProductDetailView.swift
//  RazorpayIntegrationDemo
//
//  Created by Sameer Nadaf on 31/01/26.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 0) {
                    // Product Image Section
                    GeometryReader { geometry in
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(40)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color(.systemGray6), Color(.white)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                            
                            // Price Tag
                            Text("$\(String(format: "%.2f", product.price))")
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .clipShape(Capsule())
                                .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 5)
                                .padding(20)
                                .padding(.bottom)
                        }
                    }
                    .frame(height: 300)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Title and Rating
                        HStack {
                            Text(product.name)
                                .font(.system(size: 28, weight: .heavy, design: .default))
                                .foregroundColor(.primary)
                                .lineLimit(2)
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("4.8")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        // Description
                        Text("Description")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                        
                        // Spacer for bottom content to not be hidden by buttons
                        Spacer(minLength: 100)
                    }
                    .padding(24)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .offset(y: -30) // Overlap effect
                }
            }
            
            // Sticky Action Buttons
            HStack(spacing: 20) {
                Button(action: {
                    print("Add to cart tapped")
                }) {
                    Image(systemName: "cart.fill.badge.plus")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                
                Button(action: {
                    print("Buy now tapped")
                }) {
                    Text("Buy Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20) // Add bottom padding for better safe area support on some devices
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 100)
                    .offset(y: 20) // Extend gradient behind safe area
            )
        }
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom) // Allow buttons to sit near bottom
    }
}

#Preview {
    ProductDetailView(product: Product(
        name: "Wireless Headphones",
        description: "Experience high-fidelity audio with our premium wireless headphones. Featuring active noise cancellation, 30-hour battery life, and ultra-comfortable ear cushions for all-day listening. Experience high-fidelity audio with our premium wireless headphones. Featuring active noise cancellation, 30-hour battery life, and ultra-comfortable ear cushions for all-day listening.",
        price: 299.99,
        imageName: "headphones"
    ))
}
