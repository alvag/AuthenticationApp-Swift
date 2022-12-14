//
//  HomeView.swift
//  AuthenticationApp
//
//  Created by Max Alva on 13/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack{
            Text("HomeView")
            Button("Cerrar sesion") {
                viewModel.authentication.removeCredentials()
                self.viewModel.showNextView = true
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .padding()
        }
        .fullScreenCover(isPresented: $viewModel.showNextView, content: {
            ContentView()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
