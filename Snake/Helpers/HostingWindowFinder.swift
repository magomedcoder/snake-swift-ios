//
//  HostingWindowFinder.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

extension View {
    func withHostingWindow(_ callback: @escaping (UIWindow?) -> Void) -> some View {
        self.background()
    }
}
