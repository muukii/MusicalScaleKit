// Scale.swift
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

public struct Scale: CustomDebugStringConvertible {
  public let degrees: [Degree]
  public let key: Note

  public init(key: Note, degrees: [Degree]) {
    self.key = key
    self.degrees = degrees
  }

  public var debugDescription: String {
    return "key: \(key.debugDescription)\n" + "degrees: \(degrees.debugDescription)\n" + "notes: \(notes)"
  }

  public var notes: [Note] {

    return degrees.map { Note(key: key, degree: $0) }
  }

  private func createMajorScale(key: Note) -> [Note] {

    return [
      Note(key: key, degree: Degree.one(.natural)),
      Note(key: key, degree: Degree.two(.natural)),
      Note(key: key, degree: Degree.three(.natural)),
      Note(key: key, degree: Degree.four(.natural)),
      Note(key: key, degree: Degree.Five(.natural)),
      Note(key: key, degree: Degree.six(.natural)),
      Note(key: key, degree: Degree.seven(.natural)),
    ]
  }
}
