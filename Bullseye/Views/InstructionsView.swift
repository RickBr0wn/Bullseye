//
//  InstructionsView.swift
//  Bullseye
//
//  Created by Rick Brown on 05/01/2021.
//

import SwiftUI

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(number: game.target)
    }
  }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
      InstructionsView(game: .constant(Game()))
    }
}
