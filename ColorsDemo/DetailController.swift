import UIKit

class DetailController: UIViewController {
    //MARK: - PROPERTIES
    public var expectedColor: String!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    //MARK: - METHODS
    private func callMethods(){
        createUI()
        
    }
    private func createUI(){
        name.text = expectedColor
        newView.backgroundColor = UIColor.init(hexString: expectedColor)
        newView.layer.cornerRadius = 18
        yesButton.layer.cornerRadius = 9
        yesButton.backgroundColor = UIColor.init(hexString: expectedColor)
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        guard let hexText =  name.text else { return }
        let alertController = UIAlertController(title: "Success", message: "You have successfully saved \(hexText) to your cart", preferredStyle: .alert)
        let okcation = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okcation)
        present(alertController, animated: true, completion: nil)
    }
    
}
//MARK: - EXTENSIONS
