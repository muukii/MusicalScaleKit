// Degree.swift
//
// Copyright (c) 2015 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public func == (lhs: Degree, rhs: Degree) -> Bool {
    return lhs.circleAngle == rhs.circleAngle
}

public enum Degree: CustomDebugStringConvertible, Hashable {
    
    case One(Accidental)
    case Two(Accidental)
    case Three(Accidental)
    case Four(Accidental)
    case Five(Accidental)
    case Six(Accidental)
    case Seven(Accidental)
    
    public var accidental: Accidental {
        
        switch self {
        case .One(let accidental):
            return accidental
        case .Two(let accidental):
            return accidental
        case .Three(let accidental):
            return accidental
        case .Four(let accidental):
            return accidental
        case .Five(let accidental):
            return accidental
        case .Six(let accidental):
            return accidental
        case .Seven(let accidental):
            return accidental
        }
    }
    
    public var circleAngle: Int {
        
        let baseAngle: Int
        switch self {
        case .One:
            baseAngle = 0
        case .Two:
            baseAngle = 60
        case .Three:
            baseAngle = 120
        case .Four:
            baseAngle = 150
        case .Five:
            baseAngle = 210
        case .Six:
            baseAngle = 270
        case .Seven:
            baseAngle = 330
        }
        
        let resolveAngle = baseAngle + accidental.circleAngle
        
        if resolveAngle < 0 {
            assert(resolveAngle < -360, "Can't handle")
            return (360 - resolveAngle) % 360
        } else {
            return resolveAngle % 360
        }
    }
    
    public var baseDegreeNumber: Int {
        
        switch self {
        case .One:
            return 1
        case .Two:
            return 2
        case .Three:
            return 3
        case .Four:
            return 4
        case .Five:
            return 5
        case .Six:
            return 6
        case .Seven:
            return 7
        }
    }
    
    public var baseDegreeString: String {
        
        return String(baseDegreeNumber)
    }
    
    public var debugDescription: String {
        return accidental.description + baseDegreeString
    }
    
    public var hashValue: Int {
        return circleAngle
    }
}
