//
//  TabCustom.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI

struct TabCustomView: View {
    @Namespace private var animation
    @State var selection: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.clear)
                .padding(100)
            
            TabView(selection: $selection) {
                ContentView()
//                    .foregroundStyle(.red)
                    .padding()
                    .tag(0)
                
                Text("Tela 2")
                    .foregroundStyle(.red)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
//            .font(.largeTitle)
//            .bold()
            
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 60)
                .foregroundStyle(.gray)
                .opacity(0.1)
                .blur(radius: 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                }
                .overlay {
                    HStack {
                        tabItem(tab: 0,
                                icon: "dollarsign.circle.fill",
                                label: "Expanses")
                        
                        tabItem(tab: 1,
                                icon: "scanner.fill",
                                label: "Graphs")
                    }
                    .padding(6)
                    .foregroundStyle(.black)
                }
                .padding(.horizontal)
        }
    }
    
    @ViewBuilder func tabItem(tab: Int, icon: String, label: String) -> some View {
        Button {
            withAnimation {
                selection = tab
            }
        } label: {
            HStack {
                Spacer()
                Image(systemName: icon)
                
                if tab == selection {
                    Text(label)
                        .fixedSize()
                }
                Spacer()
            }
            .foregroundStyle(.orange)
            .bold()
            .frame(maxHeight: .infinity)
            .padding(4)
            .background {
                if tab == selection {
                    RoundedRectangle(cornerRadius: 34)
                        .matchedGeometryEffect(id: "tab", in: animation)
                }
            }
        }
    }
}

#Preview {
    TabCustomView()
}
