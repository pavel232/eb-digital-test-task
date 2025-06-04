//
//  ErrorAlert.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        return alert(
            "Error.AlertTitle",
            isPresented: .constant(error.wrappedValue != nil),
            presenting: error,
            actions: { _ in
                Button("Common.OK", role: .cancel) { error.wrappedValue = nil }
            },
            message: { error in
                Text(error.wrappedValue?.localizedDescription ?? "Common.Caution")
            }
        )
    }
}
