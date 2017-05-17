//
//  main.swift
//  MusicalScale
//
//  Created by muukii on 5/18/17.
//
//

import Foundation

import MusicalScaleCore
import MusicalScale

print(Scale(key: .c(.natural), degrees: .blues).notes().description)
print(Scale(key: .d(.natural), degrees: .blues).notes().description)
print(Scale(key: .e(.natural), degrees: .blues).notes().description)

print(Scale(key: .c(.natural), degrees: .major).notes().description)
