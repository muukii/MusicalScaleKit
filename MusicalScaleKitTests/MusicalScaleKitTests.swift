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
    XCTAssertEqual(Note.a(.natural).sharp().circleAngle, Note.b(.flat).circleAngle)
    XCTAssertEqual(Note.b(.natural).sharp().circleAngle, Note.c(.natural).circleAngle)
    XCTAssertEqual(Note.a(.natural).flat().circleAngle, Note.g(.sharp).circleAngle)
  }

  func testsharp() {

    do { // A
      let note = Note.a(.natural)
      XCTAssertEqual(note.sharp(), Note.a(.sharp))
    }

    do { // B
      let note = Note.b(.natural)
      XCTAssertEqual(note.sharp(), Note.b(.sharp))
    }

    do { // C
      let note = Note.c(.natural)
      XCTAssertEqual(note.sharp(), Note.c(.sharp))
    }

    do { // D
      let note = Note.d(.natural)
      XCTAssertEqual(note.sharp(), Note.d(.sharp))
    }

    do { // E
      let note = Note.e(.natural)
      XCTAssertEqual(note.sharp(), Note.e(.sharp))
    }

    do { // F
      let note = Note.f(.natural)
      XCTAssertEqual(note.sharp(), Note.f(.sharp))
    }

    do { // G
      let note = Note.g(.natural)
      XCTAssertEqual(note.sharp(), Note.g(.sharp))
    }
  }

  func testsharp2() {

    let n = Note.a(.natural)

    XCTAssertEqual(n, Note.a(.natural))
    XCTAssertEqual(n.sharp(), Note.a(.sharp))
    XCTAssertEqual(n.sharp().sharp(), Note.b(.natural))
    XCTAssertEqual(n.sharp().sharp().sharp(), Note.c(.natural))
  }

  func testIonialScale() {

    let major = Scale(
      key: .c(.natural),
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
      .c(.natural),
      .d(.natural),
      .e(.natural),
      .f(.natural),
      .g(.natural),
      .a(.natural),
      .b(.natural),
      ]

    XCTAssertEqual(major.notes, _major)

    print(major)
  }

  func testDorianScale() {

    let scale = Scale(
      key: .c(.natural),
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
      .c(.natural),
      .d(.natural),
      .e(.flat),
      .f(.natural),
      .g(.natural),
      .a(.natural),
      .b(.flat),
      ]

    XCTAssertEqual(scale.notes, _scale)
    print(scale)
  }

  func testPhrigianScale() {

    let scale = Scale(
      key: .c(.natural),
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
      .c(.natural),
      .d(.flat),
      .e(.flat),
      .f(.natural),
      .g(.natural),
      .a(.flat),
      .b(.flat),
      ]

    XCTAssertEqual(scale.notes, _scale)
  }

  func testLydianScale() {

    let scale = Scale(
      key: .c(.natural),
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
      .c(.natural),
      .d(.natural),
      .e(.natural),
      .f(.sharp),
      .g(.natural),
      .a(.natural),
      .b(.natural),
      ]

    XCTAssertEqual(scale.notes, _scale)
  }
}
