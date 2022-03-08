//
//  ContentView.swift
//  Slot
//
//  Created by Sanny Hui on 8/3/2022.
//
// Fruit icons are source
// from https://codewithchris.com
// button is created by my own


import SwiftUI

//Class
struct ContentView: View {
    
    //Declare class variables with @State enabled
    @State var randomNumber: Array<Int> = Array(repeating: 0, count: 3)
    @State var coins: Int = 1000
    @State var fruit: Array<String> = ["apple", "cherry", "star"]
    @State var win: Int = 0
    
    var body: some View {
        
        //Stack images
        ZStack {
            Image("background").ignoresSafeArea()
            
            //Stack image vertically
            VStack{
                Spacer()
                
                //Stack image horizontally
                HStack {
                    //Display icons
                    Image (fruit[randomNumber[0]]).resizable().scaledToFit()
                    Image (fruit[randomNumber[1]]).resizable().scaledToFit()
                    Image (fruit[randomNumber[2]]).resizable().scaledToFit()
                }
                Spacer()
                VStack{
                    //Display textViews
                    Text("Coins").padding().font(.largeTitle).foregroundColor(.purple)
                    Text(String(coins)).padding().font(.system(size: 50.0, weight: .bold, design: .default)).foregroundColor(.blue)
                    
                    HStack{
                        Text("Win").padding().font(.largeTitle)
                        Text(String(win)).padding().font(.largeTitle).foregroundColor(.red)
                    }
                }

                Spacer()
                //On click with button creation
                Button(action: {
                    coins -= 1
                    win = 0
                    
                    //Random 3 numbers
                    for i in 0...2 {
                        randomNumber[i] = Int.random(in: 0...2)
                    }
                    //Compare
                    if (randomNumber[0] == randomNumber[1] && randomNumber[1] == randomNumber[2]) {
                        win = 10
                        coins += win
                    }
                //Show button image with attributes
                },label: {Image("start button")}).font(.system(size: 50.0, weight: .bold, design: .default)).padding().shadow(radius: 20)
                Spacer()
            }
        }
    }
}

//Entry point. Set content view to ....
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
