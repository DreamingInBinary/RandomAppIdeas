//
//  TodayTomorrowSomedayView.swift
//  RandomAppIdeas
//
//  Created by Jordan Morgan on 7/13/21.
//

import SwiftUI

struct TodayTomorrowSomedayView: View {
    @State private var searchText: String = ""
    private var allTimes = Time.allTimes
    
    var header: some View {
        HStack {
            Text("Today")
                .font(.system(size: 18, weight: .bold, design: .serif))
                .padding()
                .foregroundColor(.black)
            Spacer()
            Text("Tomorrow")
                .font(.system(size: 18, weight: .bold, design: .serif))
                .padding()
            Spacer()
            Text("Someday")
                .font(.system(size: 18, weight: .bold, design: .serif))
                .padding()
        }
    }
    
    var body: some View {
        ZStack {
            List {
                Section(header: header) {
                    ForEach(allTimes, id: \.id) { t in
                        VStack(alignment: .leading) {
                            Text(t.time)
                                .font(.system(.body, design: .serif))
                            ForEach(t.slots, id: \.id) { slot in
                                VStack(alignment: .leading) {
                                    HStack(alignment: .center) {
                                        Image(systemName: slot.iconName)
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.gray)
                                        Text("")
                                            .font(.system(size: 12, weight: .regular, design: .serif))
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    Rectangle()
                                        .frame(height:0.5)
                                        .foregroundColor(.gray)
                                        .offset(x:16,y:0)
                                }
                                .padding(.bottom, 12)
                            }
                        }
                        .padding(.bottom, 22)
                    }
                }
                .headerProminence(.increased)
            }
            .searchable(text: $searchText)
            VStack {
                Spacer()
                HStack(spacing: 14.0) {
                    Text("All")
                        .fontWeight(.black)
                    Text("\(Image(systemName:"circle")) Need Tos")
                    Text("\(Image(systemName:"circle.dashed")) Wants Tos")
                    Text("\(Image(systemName:"circle.dotted")) Might Dos")
                }
                .font(.system(size: 10.0, weight: .light, design: .serif))
                .padding(.all, 12)
                .background(.thinMaterial)
                .cornerRadius(8.0)
                .frame(width: 280, height: 20, alignment: .center)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 300, height: 440)
    }
}

struct TodayTomorrowSomedayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayTomorrowSomedayView()
    }
}

struct Time: Identifiable {
    var id = UUID()
    let time: String
    let slots: [Slot] = Slot.allSlots
    static let allTimes: [Time] = [Time(time: "6:00 am"),
                                   Time(time: "7:00 am"),
                                   Time(time: "8:00 am"),
                                   Time(time: "9:00 am"),
                                   Time(time: "10:00 am"),
                                   Time(time: "11:00 am"),
                                   Time(time: "12:00 pm"),
                                   Time(time: "1:00 pm"),
                                   Time(time: "2:00 pm")]
}

struct Slot: Identifiable {
    var id = UUID()
    let iconName: String
    static let allSlots: [Slot] = [Slot(iconName: "circle"),
                                   Slot(iconName: "circle.dashed"),
                                   Slot(iconName: "circle.dotted")]
}
