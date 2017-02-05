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
    XCTAssertEqual(Note.A(.natural).sharp().circleAngle, Note.B(.flat).circleAngle)
    XCTAssertEqual(Note.B(.natural).sharp().circleAngle, Note.C(.natural).circleAngle)
    XCTAssertEqual(Note.A(.natural).flat().circleAngle, Note.G(.sharp).circleAngle)
  }

  func testsharp() {

    do { // A
      let note = Note.A(.natural)
      XCTAssertEqual(note.sharp(), Note.A(.sharp))
    }

    do { // B
      let note = Note.B(.natural)
      XCTAssertEqual(note.sharp(), Note.B(.sharp))
    }

    do { // C
      let note = Note.C(.natural)
      XCTAssertEqual(note.sharp(), Note.C(.sharp))
    }

    do { // D
      let note = Note.D(.natural)
      XCTAssertEqual(note.sharp(), Note.D(.sharp))
    }

    do { // E
      let note = Note.E(.natural)
      XCTAssertEqual(note.sharp(), Note.E(.sharp))
    }

    do { // F
      let note = Note.F(.natural)
      XCTAssertEqual(note.sharp(), Note.F(.sharp))
    }

    do { // G
      let note = Note.G(.natural)
      XCTAssertEqual(note.sharp(), Note.G(.sharp))
    }
  }

  func testsharp2() {

    let n = Note.A(.natural)

    XCTAssertEqual(n, Note.A(.natural))
    XCTAssertEqual(n.sharp(), Note.A(.sharp))
    XCTAssertEqual(n.sharp().sharp(), Note.B(.natural))
    XCTAssertEqual(n.sharp().sharp().sharp(), Note.C(.natural))
  }

  func testIonialScale() {

    let major = Scale(
      key: .C(.natural),
      degrees: [
        .one(.natural),
        .two(.natural),
        .three(.natural),
        .four(.natural),
        .Five(.natural),
        .six(.natural),
        .seven(.natural),
        ]
    )

    let _major: [Note] = [
      .C(.natural),
      .D(.natural),
      .E(.natural),
      .F(.natural),
      .G(.natural),
      .A(.natural),
      .B(.natural),
      ]

    XCTAssertEqual(major.notes, _major)

    print(major)
  }

  func testDorianScale() {

    let scale = Scale(
      key: .C(.natural),
      degrees: [
        .one(.natural),
        .two(.natural),
        .three(.flat),
        .four(.natural),
        .Five(.natural),
        .six(.natural),
        .seven(.flat),
        ]
    )

    let _scale: [Note] = [
      .C(.natural),
      .D(.natural),
      .E(.flat),
      .F(.natural),
      .G(.natural),
      .A(.natural),
      .B(.flat),
      ]

    XCTAssertEqual(scale.notes, _scale)
    print(scale)
  }

  func testPhrigianScale() {

    let scale = Scale(
      key: .C(.natural),
      degrees: [
        .one(.natural),
        .two(.flat),
        .three(.flat),
        .four(.natural),
        .Five(.natural),
        .six(.flat),
        .seven(.flat),
        ]
    )

    let _scale: [Note] = [
      .C(.natural),
      .D(.flat),
      .E(.flat),
      .F(.natural),
      .G(.natural),
      .A(.flat),
      .B(.flat),
      ]

    XCTAssertEqual(scale.notes, _scale)
  }

  func testLydianScale() {

    let scale = Scale(
      key: .C(.natural),
      degrees: [
        .one(.natural),
        .two(.natural),
        .three(.natural),
        .four(.sharp),
        .Five(.natural),
        .six(.natural),
        .seven(.natural),
        ]
    )

    let _scale: [Note] = [
      .C(.natural),
      .D(.natural),
      .E(.natural),
      .F(.sharp),
      .G(.natural),
      .A(.natural),
      .B(.natural),
      ]

    XCTAssertEqual(scale.notes, _scale)
  }
}
