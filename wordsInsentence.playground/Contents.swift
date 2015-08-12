//: Playground - noun: a place where people can play

import UIKit

var str = "There are eight words in this sentence"
var count = 0

for i in str.componentsSeparatedByString(" "){
  count++
}
println(count)
