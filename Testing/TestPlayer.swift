//
//  TestPlayer.swift
//  ReadMIDIPacketList
//
//  Created by Jan Ratschko on 27.02.18.
//  Copyright © 2018 Jan Ratschko. All rights reserved.
//

import AudioToolbox

class TestPlayer {
    var player:MusicPlayer
    init?(){
        var newPlayer:MusicPlayer?
        let status = NewMusicPlayer(&newPlayer)
        guard status == noErr else {
            return nil
        }
        
        guard let player = newPlayer else {
            return nil
        }
        
        self.player = player
    }
    
    deinit {
        DisposeMusicPlayer(player)
    }
    
    func setSequence(_ sequence:TestSequence) {
        MusicPlayerSetSequence(player, sequence.sequence)
    }
    
    func start() {
        MusicPlayerStart(player)
    }
}
