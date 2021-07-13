//
//  SeventyFiveEasyView.swift
//  RandomAppIdeas
//
//  Created by Jordan Morgan on 7/13/21.
//

import SwiftUI

struct SeventyFiveEasyView: View {
    var body: some View {
        VStack {
            header
            ForEach(EasyDataModel.allTasks) { task in
                SeventyFiveEasyTaskView(model: task)
            }
            Spacer()
        }
        .padding()
        .frame(width: 340, height: 600)
    }
    
    var header: some View {
        VStack {
            Image(systemName: "face.dashed.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.cyan)
            Text("DAY 7(ish)")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 3.0)
                .rotation(Angle(degrees: 357), anchor: UnitPoint(x: 1.0, y: 1.0))
                .frame(width: 120, height:6.0)
                .offset(x: 0, y: -22.0)
                .zIndex(-1.0)
                .foregroundColor(.cyan)
        }
    }
}

struct SeventyFiveEasyTaskView: View {
    var model: EasyDataModel
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 4.0)
                .fill(.cyan)
                .overlay {
                    HStack {
                        Image(systemName: model.isChecked ? "checkmark.circle.fill" : "circle")
                            .font(.system(size: 26, weight: .black))
                            .foregroundColor(.white)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(model.text)
                                .font(.system(size: 22, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            if let subText = model.subtitle {
                                HStack {
                                    Image(systemName: model.glyph)
                                        .resizable()
                                        .frame(width: 10, height:10)
                                        .foregroundColor(model.glyphColor)
                                    Text(subText)
                                        .font(.system(size: 12, weight: .medium, design: .rounded))
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.all, 4)
                }
                .frame(width: 320, height: 64)
                .padding(.bottom, 10)
            Text(String.randomBlurb())
                .font(.system(size: 16, weight: .heavy, design: .rounded))
                .foregroundColor(.black)
                .rotationEffect(.degrees(2))
        }
        .padding(.bottom, 10)
    }
}

extension String {
    static func randomBlurb() -> String {
        return ["and then later", "later, to spark joy", "perhaps tomorrow", "and then", "possibly I might", "then if I wanna", "if my moods right"].randomElement()!
    }
}

struct EasyDataModel: Identifiable {
    var id = UUID()
    var text: String
    var subtitle: String?
    var isChecked: Bool
    var glyph: String = "flame.fill"
    var glyphColor: Color = .red
    
    static var allTasks: [EasyDataModel] = [EasyDataModel(text: "Eat cheesecake for dinner", subtitle: nil, isChecked: false),
                                            EasyDataModel(text: "Not get verified", subtitle: nil, isChecked: false),
                                            EasyDataModel(text: "Binge Netflix", subtitle: "Evolves from nailing previous task!", isChecked: true),
                                            EasyDataModel(text: "Never take a progress pic", subtitle: "1,432 day streak!!!", isChecked: true, glyph: "star.fill", glyphColor: .purple)]
}

struct SeventyFiveEasyView_Previews: PreviewProvider {
    static var previews: some View {
        SeventyFiveEasyView()
    }
}
