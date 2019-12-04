import UIKit

public class Utils: NSObject {
    @objc public static let showAlert = {
        (vc: UIViewController) in
        let alert = UIAlertController(title: "11", message: "22", preferredStyle: .alert)
        let btn = UIAlertAction(title: "OKey Dodo", style: .default, handler: { _ in
            print("Chang Liu: Okey dodo clicked")
        })
        alert.addAction(btn)
        vc.present(alert, animated: true, completion: {
            print("Chang Liu: Dodo showed up")
        })
    }
}
