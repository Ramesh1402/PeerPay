//
//  EditTextFieldView.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 01/04/24.
//

import SwiftUI

struct EditTextFieldView: View {
    @Binding var editTextField: EditTextField
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(editTextField.placeHolder, text: $editTextField.text)
                .padding(8)
                .border(.gray)
            if let error = editTextField.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundStyle(Color.red)
            }
        }
    }
}

