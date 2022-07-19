//
//  HomeView.swift
//  HabitPlus
//
//  Created by Luiz Andrade on 21/06/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Olá Home Page")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
