//
//  ContentView.swift
//  Youtube
//
//  Created by Edi Sunardi on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Beranda")
                    }
                
                Home()
                    .tabItem {
                        Image(systemName: "paperplane.fill")
                        Text("Explore")
                    }
                
                Home()
                    .tabItem {
                        Image(systemName: "tray.fill")
                        Text("Subscription")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        NavigationView{
            
            Kontent()
            
                .navigationBarItems(
                
                    leading:
                        HStack{
                            Button(action: {print("Hello Button")}){
                                Image("youtube_logo")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 90, height: 20)
                            }
                        },
                    
                    trailing:
                        HStack(spacing:20){
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "tray")
                                    .foregroundColor(Color.black)
                            }
                            
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "video.fill")
                                    .foregroundColor(Color.black)
                            }
                            
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.black)
                            }
                            
                           
                            Button(action: {print("Hello Button")}){
                                NavigationLink(destination: SettingView()){
                                    Image("profile")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipShape(Circle())
                                }
                            }
                            
                        }
                    
                )
                .navigationBarTitle("", displayMode:.inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Kontent: View {
    var body: some View {
        List{
            CellKontent(imageKontent: "kokbisa_bola", profileKontent: "kok_bisa", judul: "amerika setuju bola olahraga terburuk didunia", deskripsi: "ini adalah deskripsi video kita -300x ditonton -9 jam yang lalu", durasi: "15:00")
            
            CellKontent(imageKontent: "kokbisa_kimia", profileKontent: "kok_bisa", judul: "mengapa indonesia membuat unsur kimia 0s1", deskripsi: "ini adalah deskripsi video kita -100x ditonton -2 jam yang lalu", durasi: "20:22")
            
            CellKontent(imageKontent: "kokbisa_kesehatan", profileKontent: "kok_bisa", judul: "kenapa banyak orang memilih bunuh diri dengan cara sakit?", deskripsi: "ini adalah deskripsi video kita -1x ditonton -12 jam yang lalu", durasi: "12:23")
        }
    }
}

//komponen untuk cell

struct CellKontent: View{
    
    var imageKontent: String
    var profileKontent: String
    var judul: String
    var deskripsi: String
    var durasi: String
    
    var body: some View{
        //konten 1
        VStack{
            ZStack (alignment: .bottomTrailing){
                Image(imageKontent)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(durasi)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing, 5)
                    .padding(.bottom, 5)
            }
            
            HStack(spacing:20){
                Image(profileKontent)
                    .resizable()
                    .frame(width: 30, height:30)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text(judul)
                        .font(.headline)
                    HStack{
                        Text(deskripsi)
                            .font(.caption)
                    }
                }
                Spacer()
                Image(systemName: "list.bullet")
                
            }
            
        }
    }
    
}
