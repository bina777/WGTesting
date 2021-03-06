import UIKit

protocol AddCurrencyViewControllerDelegate: AnyObject {
    func showCurrency()
}

class AddCurrencyViewController: UIViewController {
   
    
    // MARK: - Properties
    // MARK: Constants
    
    enum Constants {
        static let defaultPadding: CGFloat = 8
        static let contentInnerVerticalSpacing: CGFloat = 8
        static let buttonTitle = "Start"
    }
    
    
    // MARK: - Properties
    // MARK: Immutable
    
    private let coordinatorDelegate: AddCurrencyViewControllerDelegate?
    private lazy var stackViewContainer = buildStackViewContainer()

    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        return button
    }()
    
    
    // MARK: - Initializers
    
    init(coordinatorDelegate: AddCurrencyViewControllerDelegate?) {
        self.coordinatorDelegate = coordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    
    //Mark: Setup
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupSubViews() {
        view.addSubview(stackViewContainer)
        actionButton.addTarget(self, action: #selector(addCurrencyAction), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        stackViewContainer.centerVertically(to: view)
        stackViewContainer.pinLeadingAndTrailingEdges(to: view, withOffset: 50)
    }
    
   
    //MARK: Actions
    
    @objc private func addCurrencyAction() {
        coordinatorDelegate?.showCurrency()
    }
    
    
    //MARK: Helper
    
    private func buildStackViewContainer() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Constants.contentInnerVerticalSpacing
        
        
        stackView.addArrangedSubview(actionButton)
        
        
        return stackView
    }
}
