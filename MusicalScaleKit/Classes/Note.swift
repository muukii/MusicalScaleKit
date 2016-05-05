// Note.swift 
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

//public enum BaseNote: CustomStringConvertible, CustomDebugStringConvertible {
//    case A
//    case B
//    case C
//    case D
//    case E
//    case F
//    case G
//    
//    public var debugDescription: String {
//        switch self {
//        case .A:
//            return "A"
//        case .B:
//            return "B"
//        case .C:
//            return "C"
//        case .D:
//            return "D"
//        case .E:
//            return "E"
//        case .F:
//            return "F"
//        case .G:
//            return "G"
//        }
//    }
//    
//    var circleAngle: Int {
//        switch self {
//        case .A:
//            return 0
//        case .B:
//            return 60
//        case .C:
//            return 90
//        case .D:
//            return 150
//        case .E:
//            return 210
//        case .F:
//            return 240
//        case .G:
//            return 300        
//        }
//    }
//
//    public var description: String {
//        return debugDescription
//    }    
//}

//public func == (lhs: Note, rhs: Note) -> Bool {
//    return lhs.circleAngle == rhs.circleAngle
//}

//public struct Note: CustomDebugStringConvertible, Hashable {
//    
//    public static let A = .A(.Natural)    
//    public static let B = .B(.Natural)
//    public static let C = .C(.Natural)
//    public static let D = .D(.Natural)
//    public static let E = .E(.Natural)
//    public static let F = .F(.Natural)
//    public static let G = .G(.Natural)
//    
//    public let baseNote: BaseNote
//    public let accidental: Accidental
//    
//    public init(baseNote: BaseNote, accidental: Accidental = .Natural) {
//        self.baseNote = baseNote
//        self.accidental = accidental
//    }
//    
//    public init(key: Note, degree: Degree) {
//        let notes = Notes(initialNote: key)
//        
//        var noteMap: [Int : Note] = [:]
//        noteMap[-30] = notes[-1]
//        noteMap[0] = notes[0]
//        noteMap[30] = notes[1]
//        noteMap[60] = notes[2]
//        noteMap[90] = notes[3]
//        noteMap[120] = notes[4]
//        noteMap[150] = notes[5]
//        noteMap[180] = notes[6]
//        noteMap[210] = notes[7]
//        noteMap[240] = notes[8]
//        noteMap[270] = notes[9]
//        noteMap[300] = notes[10]
//        noteMap[330] = notes[11]
//        noteMap[360] = notes[12]
//        noteMap[390] = notes[13]
//        
//        guard let note = noteMap[degree.circleAngle] else {
//            fatalError("OMG")
//        }
//        self.baseNote = note.baseNote
//        self.accidental = note.accidental
//    }
//
//    public var debugDescription: String {
//        
//        return baseNote.debugDescription + accidental.debugDescription
//    }
//    
//    public func natural() -> Note {
//        return applyAccidental(.Natural)
//    }
//    
//    public func flat() -> Note {
//        return applyAccidental(.Flat)
//    }
//    
//    public func sharp() -> Note {
//        return applyAccidental(.Sharp)
//    }
//    
//    public func applyAccidental(accidental: Accidental) -> Note {
//        
//        guard accidental != .None else {
//            return self
//        }        
//        let notes = Notes(initialNote: self)
//        switch accidental {
//        case .Natural:
//            return baseNote(.Natural)
//        case .Flat:
//            return notes[-1]
//        case .Sharp:
//            return notes[1]
//        }
//    }
//    
//    public var circleAngle: Int {
//        let angle = baseNote.circleAngle + accidental.circleAngle
//        if angle < 0 {
//            assert(angle < -360, "Can't handle")
//            return (360 - angle) % 360
//        } else {
//            return angle % 360
//        }
//    }
//
//    public var hashValue: Int {
//        return circleAngle
//    }
//}

public func == (lhs: Note, rhs: Note) -> Bool {
    return lhs.circleAngle == rhs.circleAngle
}

public enum Note : CustomStringConvertible, CustomDebugStringConvertible, Hashable {
    
    case A(Accidental)
    case B(Accidental)
    case C(Accidental)
    case D(Accidental)
    case E(Accidental)
    case F(Accidental)
    case G(Accidental)
    
    public init(key: Note, degree: Degree) {
        let notes = Notes(initialNote: key)
        
        var noteMap: [Int : Note] = [:]
        noteMap[-30] = notes[-1]
        noteMap[0] = notes[0]
        noteMap[30] = notes[1]
        noteMap[60] = notes[2]
        noteMap[90] = notes[3]
        noteMap[120] = notes[4]
        noteMap[150] = notes[5]
        noteMap[180] = notes[6]
        noteMap[210] = notes[7]
        noteMap[240] = notes[8]
        noteMap[270] = notes[9]
        noteMap[300] = notes[10]
        noteMap[330] = notes[11]
        noteMap[360] = notes[12]
        noteMap[390] = notes[13]
        
        guard let note = noteMap[degree.circleAngle] else {
            fatalError("OMG")
        }
        
        self = note
    }
    
    var circleAngle: Int {
        
        let rawAngle: Int
        switch self {
        case .A(let a):
            rawAngle = 0 + a.circleAngle
        case .B(let a):
            rawAngle = 60 + a.circleAngle
        case .C(let a):
            rawAngle = 90 + a.circleAngle
        case .D(let a):
            rawAngle = 150 + a.circleAngle
        case .E(let a):
            rawAngle = 210 + a.circleAngle
        case .F(let a):
            rawAngle = 240 + a.circleAngle
        case .G(let a):
            rawAngle = 300 + a.circleAngle
        }
        
        if rawAngle < 0 {
            assert(rawAngle >= -360, "Can't handle")
            return (360 + rawAngle) % 360
        } else {
            return rawAngle % 360
        }
    }
    
    public func natural() -> Note {
        return applyAccidental(.Natural)
    }
    
    public func flat() -> Note {
        return applyAccidental(.Flat)
    }
    
    public func sharp() -> Note {
        return applyAccidental(.Sharp)
    }
    
    public func applyAccidental(accidental: Accidental) -> Note {
        
        guard accidental != .None else {
            return self
        }
        let notes = Notes(initialNote: self)
        switch accidental {
        case .Natural:
            switch self {
            case .A:
                return .A(.Natural)
            case .B:
                return .B(.Natural)
            case .C:
                return .C(.Natural)
            case .D:
                return .D(.Natural)
            case .E:
                return .E(.Natural)
            case .F:
                return .F(.Natural)
            case .G:
                return .G(.Natural)
            }
        case .Flat:
            return notes[-1]
        case .Sharp:
            return notes[1]
        }
    }
    
    public var debugDescription: String {
        return description
    }
    
    public var description: String {
        return baseNoteString + accidental.description
    }
    
    public var hashValue: Int {
        return circleAngle
    }
    
    private var baseNoteString: String {
        
        switch self {
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        case .E:
            return "E"
        case .F:
            return "F"
        case .G:
            return "G"
        }
    }
    
    private var accidental: Accidental {
        
        switch self {
        case .A(let accidental):
            return accidental
        case .B(let accidental):
            return accidental
        case .C(let accidental):
            return accidental
        case .D(let accidental):
            return accidental
        case .E(let accidental):
            return accidental
        case .F(let accidental):
            return accidental
        case .G(let accidental):
            return accidental
        }
    }
}
