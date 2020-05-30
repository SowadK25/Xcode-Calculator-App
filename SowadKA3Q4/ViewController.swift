// Sowad Khan
// Assignment 3, Question 4
// March 16th, 2020
// Created a calculator using swift textbook chapters 1-4
// Modifications: March 16th - Created GUI layout, methods that connect all the buttons
//                March 17th - Created if-else statements for when the operation buttons are clicked to perform mathematical operations

import UIKit

class ViewController: UIViewController { // Main class
    
    // Variables for numbers on screen and operations
    var number = 0.0
    var previous = 0.0
    var doingMath = false
    var function = 0
    var decimalCount = 0
    
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func numberButtons(_ sender: UIButton) { // Buttons with numbers
        if doingMath == true { // An operation has been clicked
            decimalCount = 0 // Reset decimalCount to 0
            label1.text = String(sender.tag - 1) // Display the operation on screen using its tag number
            number = Double(label1.text!)! // Store the number on screen
            doingMath = false
        }
        else if sender.tag == 18 { // If the decimal button is pressed
            decimalCount += 1 // Counts how many times decimal is clicked

            if decimalCount == 1 { // If the decimal is clicked once
                if label1.text == "" { // If the screen is empty
                    label1.text = "0." // Add 0. for user
                }
                    
                else {
                label1.text! += "." // Add decimal to number on screen
                number = Double(label1.text!)! // Convert string to a number
                }
            }
            else if decimalCount == 2 { // If the decimal is pressed again
                label1.text! += "" // Change nothing, as the number would not make sense
            }
        }
            
        else { // No operation happening
            label1.text = label1.text! + String(sender.tag-1) // Add numbers clicked to the screen
            number = Double(label1.text!)! // Store the number
        }
    }
        
    @IBAction func operationButtons(_ sender: UIButton) { // Function for operation buttons
        doingMath = true
        if sender.tag == 11 { // If the clear button is clicked
            // Resetting all variables
            number = 0
            previous = 0
            label1.text = ""
            function = 0
            doingMath = false
            decimalCount = 0
        }
        else if sender.tag == 12 { // If the division button is clicked
            previous = Double(label1.text!)! // Store the previous number
            label1.text = "÷" // Display division sign
            function = 12 // Set function variable to 12
        }
        else if sender.tag == 13 { // If the multiply button is clicked
            previous = Double(label1.text!)!
            label1.text = "x"
            function = 13
        }
        else if sender.tag == 14 { // If the subtraction button is clicked
            previous = Double(label1.text!)!
            label1.text = "-"
            function = 14
        }
        else if sender.tag == 15 { // If the addition button is clicked
            previous = Double(label1.text!)!
            label1.text = "+"
            function = 15
        }
        else if sender.tag == 17 { // If the exponent button is clicked
            previous = Double(label1.text!)!
            label1.text = "^"
            function = 17
        }
        
        else if sender.tag == 16 { // If the equal button is clicked
            if function == 12 { // Division operation
                label1.text = String(previous / number) // Dividing
            }
            else if function == 13 { // Multiplication operation
                label1.text = String(previous * number) // Multiplying
            }
            else if function == 14 { // Subtraction operation
                label1.text = String(previous - number) // Subtracting
            }
            else if function == 15 { // Addition operation
                label1.text = String(previous + number) // Adding
            }
            else if function == 17 { // Exponential operation
                label1.text = String(pow(previous, number)) // Exponents
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
