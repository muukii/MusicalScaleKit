import MusicalScaleCore

let _1 = Degree.one(.natural)
let _2 = Degree.two(.natural)

let _b3 = Degree.three(.flat)
let _3 = Degree.three(.natural)

let _4 = Degree.four(.natural)

let b5 = Degree.five(.flat)
let _5 = Degree.five(.natural)
let _6 = Degree.six(.natural)

let b7 = Degree.seven(.flat)
let _7 = Degree.seven(.natural)

extension Array where Element == Degree {
  
  public static var major: [Degree] { return [_1, _2, _3, _4, _5, _6, _7] }
  public static var blues: [Degree] { return [_1, _b3, _4, b5, _5, b7] }
}
