//
//  StartMenu.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

struct StartMenu: View {
    
    @ObservedObject
    private var multiplayerVM: MultiplayerViewModel
    
    init(multiplayerViewModel: MultiplayerViewModel? = nil) {
        self._multiplayerVM = .init(initialValue: multiplayerViewModel ?? .init())
    }
    
    var body: some View {
        VStack {}
    }

}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
