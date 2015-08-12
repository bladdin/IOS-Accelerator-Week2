//: Playground - noun: a place where people can play

import UIKit

var oddArray = [1,2,3,4,5,6,7,8,9]

func returnOddArray(oddArray : [Int]) -> Int{
  for i in oddArray{
    if i%2 != 0{
      return oddArray[i]
    }
  }
}