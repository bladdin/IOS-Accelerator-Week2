//: Playground - noun: a place where people can play

import UIKit

var str = "race car"

func testToSee(word : String){
  var wordsplit = word.componentsSeparatedByString(" ")
  var squishWords = ""
  for i in wordsplit{
    squishWords = squishWords + i
  }
  println(squishWords)
  
  for characrs in squishWords.lineRangeForRange(<#aRange: Range<String.Index>#>)
  
}

let test = testToSee(str)