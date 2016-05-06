// Notes.swift
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

public struct Notes: SequenceType, CollectionType {
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count
    }
    
    public func indexOf(element: Note) -> Int? {
        return self.allNotes.indexOf(element).flatMap { $0 - initialIndex }
    }
    
    public subscript(i: Int) -> Note {
                
        if i < 0 {
            let index = ((abs(i) + (self.allNotes.count - 1 - initialIndex)) % (self.allNotes.count))
            return self.allNotes.reverse()[index]
            
        } else {
            let index = ((i + initialIndex) % (self.allNotes.count))
            let note = self.allNotes[index]
            return note
        }
    }
    
    public func generate() -> AnyGenerator<Note> {
        let count = self.allNotes.count
        var i: Int = initialIndex
        return AnyGenerator { () -> Note in
            let note = self.allNotes[i]
            i += 1
            if i == count {
                i = 0
            }
            return note
        }
    }
    
    public init(initialNote: Note, sortSharp: Bool) {
        
        if sortSharp {
            
            allNotes = [
                .A(.Natural),
                .A(.Sharp),
                .B(.Natural),
                .C(.Natural),
                .C(.Sharp),
                .D(.Natural),
                .D(.Sharp),
                .E(.Natural),
                .F(.Natural),
                .F(.Sharp),
                .G(.Natural),
                .G(.Sharp),
            ]
        } else {
            
            allNotes = [
                .A(.Natural),
                .B(.Flat),
                .B(.Natural),
                .C(.Natural),
                .D(.Flat),
                .D(.Natural),
                .E(.Flat),
                .E(.Natural),
                .F(.Natural),
                .G(.Flat),
                .G(.Natural),
                .A(.Flat),
            ]
        }
        
        guard let index = self.allNotes.indexOf(initialNote) else {
            fatalError("Not found note index")
        }
        self.initialIndex = index
    }
    
    private let initialIndex: Int
    private let allNotes: [Note]
}
