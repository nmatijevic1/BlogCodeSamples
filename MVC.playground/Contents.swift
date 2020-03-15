import UIKit

struct Controller {
    let model = Model()
    //usually trigered by connection action to UI element, like a button
    //in iOS, more known under term IBAction
    
    func userTappedButton() {
        //represent action [1] on graph
        print("User tapped a button")
        model.performSomeBusinessLogic()
    }
}

struct Model {

    func performSomeBusinessLogic() {
        print("performing some changes on self")
        //Notification pattern - posting a notification
        //represent action [2] on graph
        NotificationCenter.default.post(Notification(name: Notification.Name("businessLogicUpdated")))
    }
}

class View {
    
    init() {
        //Notification pattern - adding an observer
        NotificationCenter.default.addObserver(self, selector: #selector(performUIUpdates), name: Notification.Name("businessLogicUpdated"), object: nil)
    }
    
    @objc func performUIUpdates() {
        print("Updating UI")
    }
}

let contoller = Controller()
let view = View()
contoller.userTappedButton()
