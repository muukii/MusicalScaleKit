//
//  MusicalScaleTests.swift
//  MusicalScaleTests
//
//  Created by muukii on 5/5/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import XCTest

@testable import MusicalScaleKit

class MusicalScaleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoteAngle() {
        XCTAssertEqual(Note.A(.Natural).sharp().circleAngle, Note.B(.Flat).circleAngle)
        XCTAssertEqual(Note.B(.Natural).sharp().circleAngle, Note.C(.Natural).circleAngle)
        XCTAssertEqual(Note.A(.Natural).flat().circleAngle, Note.G(.Sharp).circleAngle)
    }
    
    func testSharp() {
        
        do { // A
            let note = Note.A(.Natural)
            XCTAssertEqual(note.sharp(), Note.A(.Sharp))
        }
        
        do { // B
            let note = Note.B(.Natural)
            XCTAssertEqual(note.sharp(), Note.B(.Sharp))
        }
        
        do { // C
            let note = Note.C(.Natural)
            XCTAssertEqual(note.sharp(), Note.C(.Sharp))
        }
        
        do { // D
            let note = Note.D(.Natural)
            XCTAssertEqual(note.sharp(), Note.D(.Sharp))
        }
        
        do { // E
            let note = Note.E(.Natural)
            XCTAssertEqual(note.sharp(), Note.E(.Sharp))
        }
        
        do { // F
            let note = Note.F(.Natural)
            XCTAssertEqual(note.sharp(), Note.F(.Sharp))
        }
        
        do { // G
            let note = Note.G(.Natural)
            XCTAssertEqual(note.sharp(), Note.G(.Sharp))
        }
    }
    
    func testSharp2() {
        
        let n = Note.A(.Natural)
        
        XCTAssertEqual(n, Note.A(.Natural))
        XCTAssertEqual(n.sharp(), Note.A(.Sharp))
        XCTAssertEqual(n.sharp().sharp(), Note.B(.Natural))
        XCTAssertEqual(n.sharp().sharp().sharp(), Note.C(.Natural))
    }
    
    func testIonialScale() {
        
        let major = Scale(
            key: .C(.Natural),
            degrees: [
                .One(.Natural),
                .Two(.Natural),
                .Three(.Natural),
                .Four(.Natural),
                .Five(.Natural),
                .Six(.Natural),
                .Seven(.Natural),
            ]
        )
        
        let _major: [Note] = [
            .C(.Natural),
            .D(.Natural),
            .E(.Natural),
            .F(.Natural),
            .G(.Natural),
            .A(.Natural),
            .B(.Natural),
        ]
       
        XCTAssertEqual(major.notes, _major)
    }
    
    func testDorianScale() {
    
        let scale = Scale(
            key: .C(.Natural),
            degrees: [
                .One(.Natural),
                .Two(.Natural),
                .Three(.Flat),
                .Four(.Natural),
                .Five(.Natural),
                .Six(.Natural),
                .Seven(.Flat),
            ]
        )
        
        let _scale: [Note] = [
            .C(.Natural),
            .D(.Natural),
            .E(.Flat),
            .F(.Natural),
            .G(.Natural),
            .A(.Natural),
            .B(.Flat),
        ]
       
        XCTAssertEqual(scale.notes, _scale)
    }
    
    func testPhrigianScale() {
        
        let scale = Scale(
            key: .C(.Natural),
            degrees: [
                .One(.Natural),
                .Two(.Flat),
                .Three(.Flat),
                .Four(.Natural),
                .Five(.Natural),
                .Six(.Flat),
                .Seven(.Flat),
            ]
        )
        
        let _scale: [Note] = [
            .C(.Natural),
            .D(.Flat),
            .E(.Flat),
            .F(.Natural),
            .G(.Natural),
            .A(.Flat),
            .B(.Flat),
            ]
        
        XCTAssertEqual(scale.notes, _scale)
    }
    
    func testLydianScale() {
        
        let scale = Scale(
            key: .C(.Natural),
            degrees: [
                .One(.Natural),
                .Two(.Natural),
                .Three(.Natural),
                .Four(.Sharp),
                .Five(.Natural),
                .Six(.Natural),
                .Seven(.Natural),
            ]
        )
        
        let _scale: [Note] = [
            .C(.Natural),
            .D(.Natural),
            .E(.Natural),
            .F(.Sharp),
            .G(.Natural),
            .A(.Natural),
            .B(.Natural),
            ]
        
        XCTAssertEqual(scale.notes, _scale)
    }
}
