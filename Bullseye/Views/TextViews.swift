//
//  TextViews.swift
//  Bullseye
//
//  Created by Rick Brown on 04/01/2021.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    VStack {
      Text(text.uppercased())
        .bold()
        .kerning(2.0)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.callout)
        .foregroundColor(Color("TextColor"))
    }
  }
}

struct BigNumberText: View {
  var number: Int
  
  var body: some View {
    Text("\(number)")
      .font(.largeTitle)
      .fontWeight(.black)
      .kerning(-1.0)
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35.0)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .padding(.bottom, 2)
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .foregroundColor(Color("TextColor"))
      .font(.subheadline)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct ScoreText: View {
  var score: Int
  
  var body: some View {
    Text(String(score))
      .bold()
      .kerning(0.2)
      .font(.title3)
      .foregroundColor(Color("TextColor"))
  }
}

struct DateText: View {
  var date: Date
  
  var body: some View {
    Text(date, style: .time)
      .bold()
      .kerning(0.2)
      .font(.title3)
      .foregroundColor(Color("TextColor"))
  }
}


struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color.accentColor)
      .cornerRadius(12.0)
      .foregroundColor(.white)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Put the bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      BigNumberText(number: 50)
      LabelText(text: "DUMMY")
      BodyText(text: "You scored 200 points\n🎉🎉🎉")
      ButtonText(text: "Start new round")
        .padding()
      ScoreText(score: 667)
      DateText(date: Date())
    }
  }
}
