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
      Text("🎯🎯🎯")
        .font(.largeTitle)
      
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
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Put the bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(number: 50)
    }
  }
}
