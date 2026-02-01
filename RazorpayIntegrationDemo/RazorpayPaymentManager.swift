//
//  RazorpayIntegrationDemoApp.swift
//  RazorpayIntegrationDemo
//
//  Created by SameerNadaf on 01/02/26.
//

import Foundation
import Razorpay
import UIKit
import Combine

class RazorpayPaymentManager: NSObject, ObservableObject {
    private var razorpay: RazorpayCheckout?
    @Published var isPaymentSuccess: Bool = false
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    // REPLACE WITH YOUR KEY ID
    // private let keyID = "YOUR_KRY_ID" // e.g., "rzp_test_123456"
    private let keyID = "rzp_test_SA3OmcI5pHYQpG"
    
    override init() {
        super.init()
        // Initialize Razorpay
        razorpay = RazorpayCheckout.initWithKey(keyID, andDelegate: self)
    }
    
    func openPayment(amount: Double, description: String, image: String, email: String, contact: String) {
        let options: [String: Any] = [
            "amount": amount * 100, // Amount in paise
            "currency": "INR",
            "description": description,
            "image": image,
            "name": "Razorpay Integration Demo",
            "prefill": [
                "contact": contact,
                "email": email
            ],
            "theme": [
                "color": "#3366FF"
            ]
        ]
        
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            razorpay?.open(options, displayController: rootVC)
        } else {
            print("Error: Could not find root view controller")
        }
    }
}

extension RazorpayPaymentManager: RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]) {
        
    }
    
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]) {
        
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        print("Payment Error: \(str)")
        DispatchQueue.main.async {
            self.isPaymentSuccess = false
            self.alertMessage = "Payment Failed: \(str)"
            self.showAlert = true
        }
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("Payment Success: \(payment_id)")
        DispatchQueue.main.async {
            self.isPaymentSuccess = true
            self.alertMessage = "Payment Successful! ID: \(payment_id)"
            self.showAlert = true
        }
    }
}

extension UIApplication {
    var keyWindow: UIWindow? {
        // iOS 13+ helper to access key window
        return connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
    }
}
