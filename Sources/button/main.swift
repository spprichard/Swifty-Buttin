import SwiftyGPIO
import Foundation

let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi3)
let pin = gpios[.P18]!
let debouncePeriodInSeconds = 3.0
var buttonState = 0
var lastChange = Date()

while true {
    pin.onChange { changingPin in
        let now = Date()
        let timeSinceLastChange = now.timeIntervalSince(lastChange)
        
        if changingPin.value != buttonState && timeSinceLastChange >= debouncePeriodInSeconds {
            print("Changing button state to \(changingPin.value), time since last change \(timeSinceLastChange)")
            buttonState = changingPin.value
            lastChange = now
        }
    }
}


