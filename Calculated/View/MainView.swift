//
//  MainView.swift
//  Calculated
//
//  Created by Муртазали Магомедов on 22.07.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        
        ZStack {
            //MARK: Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                Spacer()
                //MARK: Display
                HStack {
                    Spacer()
                    Text(mainViewModel.limitedValue())
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .padding(.horizontal, 30)
                }
                //MARK: Buttons
                ForEach(mainViewModel.buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                mainViewModel.didTap(item: item)
                            } label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: mainViewModel.buttonWidth(item: item),
                                        height: mainViewModel.buttonHeidth()
                                    )
                                    .foregroundColor(item.buttonFontColor)
                                    .background(item.buttonColor)
                                    .font(.system(size: 35))
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    }

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
