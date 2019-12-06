import UIKit

public class Utils: NSObject {
    @objc public static let showAlert = {
        (vc: UIViewController, title: String, message: String, onOK: @escaping (()->Void)) in
        let alert = UIAlertController(title: title.isEmpty ? nil : title, message: message, preferredStyle: .alert)
        let btn = UIAlertAction(title: NSLocalizedString("ok", comment: "Ok"), style: .default, handler: { _ in
            onOK()
        })
        alert.addAction(btn)
        vc.present(alert, animated: true, completion:nil)
    }
}
