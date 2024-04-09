//
//  MobileNumberViewModel.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 31/03/24.
//

import Foundation

class MobileNumberViewModel: ObservableObject {
    @Published var confirmMobileNumber: String = ""
    @Published var mobileNumberNameField = EditTextField(placeHolder: "UPI Enabled Mobile Number", text: "", errorMessage: nil)
    @Published var confirmMobileNumberNameField = EditTextField(placeHolder: "Confirm Mobile Number", text: "", errorMessage: nil)
    @Published var canShowDashboard: Bool = false
    
    func confirm() {
        if validateMobileNumberField() && validateConfirmMobileNumberField() {
            canShowDashboard = true
        }
    }
    
    private func validateMobileNumberField() -> Bool {
        let validPhoneNumberRegex = /[0-9]{10}/
        if mobileNumberNameField.text.wholeMatch(of: validPhoneNumberRegex) == nil {
            mobileNumberNameField.errorMessage = "Please enter 10 digit mobile number"
            return false
        } else {
            mobileNumberNameField.errorMessage = nil
            return true
        }
    }
    
    private func validateConfirmMobileNumberField() -> Bool {
        if mobileNumberNameField.text != confirmMobileNumberNameField.text {
            confirmMobileNumberNameField.errorMessage = "Mobile number and confirm mobile number fields do not match"
            return false
        } else {
            confirmMobileNumberNameField.errorMessage = nil
            return true

        }
    }
}
