import UIKit

/*
 Steps to create an UI programmatically:
 
 1 - Create the View References
 2 - Initialize them
 3 - Configure them
 4 - Add them to the Superview
 5 - Set the Constraints..
 */

class MainViewController: UIViewController {
    // MARK: - 1 - Creating...
    private var stackView: UIStackView
    private var button1: UIButton
    private var button2: UIButton
    private var button3: UIButton
    
    init() {
        // MARK: - 2 - Initializing...
        //button1 = UIButton(frame: CGRect(x: 9, y: 10, width: 100, height: 100))
        //let button1Frame = CGRect(x: 9, y: 10, width: 100, height: 100000)
        button1 = .init(type: .system)
        button2 = .init(type: .system)
        button3 = .init(type: .system)
        stackView = .init(arrangedSubviews: [button1, button2, button3])
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        addViewsToSuperview()
        setUpConstraints()
    }
    
    // MARK: - 3 - Configuring..
    private func setUpViews() {
        stackView.axis = .vertical
        button1.setTitle("Botão 1", for: .normal)
        button2.setTitle("Botão 2", for: .normal)
        button3.setTitle("Botão 3", for: .normal)
        
        button3.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
    }
    
    // MARK: - 4 - Adding to the Parent View..
    private func addViewsToSuperview() {
        view.addSubview(stackView)
    }
    
    // MARK: - 5 - Setting Up the Constraints..
    private func setUpConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapButton1(_ sender: UIButton) {
        let destinationController = EmojisListViewController()
        self.present(destinationController, animated: true)
    }
}
