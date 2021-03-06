//
//  UserEventData.swift
//  SwiftMIDIAPIExtensions
//
//  Created by Jan Ratschko on 24.02.18.
//  Copyright © 2018 Jan Ratschko. All rights reserved.
//

import AudioToolbox

extension UnsafePointer where Pointee == MusicEventUserData {
    var data:UnsafeBufferPointer<UInt8> {
        return .init(start: &self.mutable.pointee.data, count:Int(self.pointee.length))
    }
}

extension HeadedBytes where HeaderType == MusicEventUserData {
    init(musicEventUserData data: Data) {
        self.init(numTrailingBytes: data.count) { userData in
            userData.pointee.length = UInt32(data.count)
            _ = data.withUnsafeBytes { bytes in
                memcpy(&userData.pointee.data, bytes, data.count)
            }
        }
    }
}
