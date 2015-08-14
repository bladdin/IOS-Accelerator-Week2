//: Playground - noun: a place where people can play



import UIKit

class FibonacciNumbers{



  func fibSequence(numberHolder : Int, numberHolder2 : Int){
    var value = 0
    var number = numberHolder
    var number2 = numberHolder2
    for i in 1...100{
      value = number + number2
      number2 = number
      number = value
      println(value)
      }
    }
}
