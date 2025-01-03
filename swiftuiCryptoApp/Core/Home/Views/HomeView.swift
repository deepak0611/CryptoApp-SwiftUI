//
//  HomeView.swift
//  swiftuiCryptoApp
//
//  Created by Deepak Kumar1 on 01/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //contentLayer
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
            
        }
        
    }
    
    
}

#Preview {
    NavigationView {
        HomeView()
    }
    
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background (
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
