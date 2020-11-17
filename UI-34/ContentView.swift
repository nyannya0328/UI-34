//
//  ContentView.swift
//  UI-34
//
//  Created by にゃんにゃん丸 on 2020/11/17.
//

import SwiftUI

struct ContentView: View {
    @State var animation = false
    @State var endsplash = false
    var body: some View {
        ZStack{
            Home()
            ZStack{
                
                
                
                Color("bg")
                
                Image("p1")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animation ? .fill : .fit)
                    .scaleEffect(animation ? 3 : 1)
                    .frame(width: animation ? nil : 85, height:animation ? nil : 85)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform:animatesplash)
            .opacity(endsplash ? 0 : 1)
            
            
            
        }
    }
    
    func animatesplash(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            
            withAnimation(Animation.easeOut(duration: 0.45)){
                
                animation.toggle()
                
            }
            
            withAnimation(Animation.linear(duration:0.45)){
                
                endsplash.toggle()
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        
        VStack{
            
            HStack{
                
                
                Text("PC")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("bg"))
                Spacer(minLength: 0)
                    
                
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            Spacer()
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(Color.black.opacity(0.03).ignoresSafeArea(.all, edges: .all))
        
        
    }
}
