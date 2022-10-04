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
    private var randomEmojiButton: UIButton
    private var avatarButton: UIButton
    private var emojisButton: UIButton
    private var randomEmojiContainerView: UIView
    private var randomEmojiImageView: UIImageView
    
    var emojis: [String] = ["💪🏻", "🔴", "🙏🏻", "🟢"]
    var emojiService: EmojiService?
    
    init() {
        // MARK: - 2 - Initializing...
        //randomEmojiButton = UIButton(frame: CGRect(x: 9, y: 10, width: 100, height: 100))
        //let randomEmojiButtonFrame = CGRect(x: 9, y: 10, width: 100, height: 100000)
        randomEmojiButton = .init(type: .system)
        avatarButton = .init(type: .system)
        emojisButton = .init(type: .system)
        randomEmojiContainerView = .init(frame: .zero)
        randomEmojiImageView = .init(frame: .zero)
        stackView = .init(arrangedSubviews: [randomEmojiContainerView, randomEmojiButton, avatarButton, emojisButton])
        
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
        randomEmojiButton.setTitle("Random Emoji", for: .normal)
        avatarButton.setTitle("Avatars", for: .normal)
        emojisButton.setTitle("Emojis", for: .normal)
        
        randomEmojiImageView.contentMode = .scaleAspectFit
        
        randomEmojiButton.addTarget(self, action: #selector(didTapRandomEmojiButton), for: .touchUpInside)
    }
    
    // MARK: - 4 - Adding to the Parent View..
    private func addViewsToSuperview() {
        randomEmojiContainerView.addSubview(randomEmojiImageView)
        
        view.addSubview(stackView)
    }
    
    // MARK: - 5 - Setting Up the Constraints..
    private func setUpConstraints() {
        [stackView, randomEmojiImageView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            randomEmojiImageView.leadingAnchor.constraint(equalTo: randomEmojiContainerView.leadingAnchor),
            randomEmojiImageView.trailingAnchor.constraint(equalTo: randomEmojiContainerView.trailingAnchor),
            randomEmojiImageView.bottomAnchor.constraint(equalTo: randomEmojiContainerView.bottomAnchor),
            randomEmojiImageView.topAnchor.constraint(equalTo: randomEmojiContainerView.topAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapRandomEmojiButton(_ sender: UIButton) {
        emojiService?.fetchEmojis()
        //let emojiUrl = ???
        //randomEmojiImageView.downloaded(from: emojiUrl)
        //randomEmojiImageView.image = emojis.randomElement()?.toImage()
    }
}
