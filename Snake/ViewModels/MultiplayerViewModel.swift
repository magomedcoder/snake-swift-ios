//
//  MultiplayerViewModel.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI
import MultipeerConnectivity
import Combine

class MultiplayerViewModel: NSObject, ObservableObject {
    
    var peerId: MCPeerID?
    var session: MCSession?
    var advertiser: MCAdvertiserAssistant?
    
    @Published
    var enemySnakes = [Snake]()

    override init() {
        super.init()
        
        let id = MCPeerID(displayName: UIDevice.current.name)
        
        self.peerId = id
        self.session = MCSession(peer: id, securityIdentity: nil, encryptionPreference: .required)
    }
    
    func beginHosting() {
        guard let session = session else { return }
        advertiser = MCAdvertiserAssistant(
            serviceType: Self.assistentServiceType,
            discoveryInfo: nil,
            session: session
        )
        advertiser?.start()
    }
    
    static let assistentServiceType: String = "ru.magomedcoder.snake"
}

extension MultiplayerViewModel: MCSessionDelegate {
    
    func session(
        _
        session: MCSession,
        peer peerID: MCPeerID,
        didChange state: MCSessionState
    ) {}
    
    func session(
        _ session: MCSession,
        didReceive data: Data,
        fromPeer peerID: MCPeerID
    ) {}
    
    func session(
        _
        session: MCSession,
        didReceive stream: InputStream,
        withName streamName: String,
        fromPeer peerID: MCPeerID
    ) {}
    
    func session(
        _
        session: MCSession,
        didStartReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        with progress: Progress
    ) {
    }
    
    func session(
        _
        session: MCSession,
        didFinishReceivingResourceWithName resourceName: String,
        fromPeer peerID: MCPeerID,
        at localURL: URL?,
        withError error: Error?
    ) {
    }
    
}
