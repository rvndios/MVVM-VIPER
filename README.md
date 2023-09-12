# MVVM-VIPER
iOS sample app with MVVM and VIPER architectures.

Add snippet for Quick Protocol creationn for VIPER Architecture in XCode is here [VIPER_PROTOCOL](https://github.com/rvndios/iOSArch/blob/main/Protocol.swift)

## VIPER 🐍

V - View
I - Interactor
P - Presenter
E - Entiy
R - Router

For VIPER architectural pattern protocol plays important role. Mainly for share data between the VIPER.
Quick snippet for VIPER protocol

```swift

protocol PresenterProtocol: AnyObject{
    var view: ViewProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
    var router: RouterProtocol? {get set}
}

protocol ViewProtocol: AnyObject{
    func updateUI<Model>(array: Array<Model>)
    func showError(_ error: AppError)
}

protocol RouterProtocol: AnyObject {
    static func createModule()
    func pushToScreen(viewControllerID: String, navigationConroller: UINavigationController)
    func performSegue(segueID: String)
}

protocol InteractorProtocol: AnyObject {
    var presenter: PresenterProtocol? {get set}
    func fetchData()
}

// MARK: Delegates
protocol InteractoDelegate: AnyObject {
    func fetchDataSuccess<Model>(noticeModelArray:Array<Model>)
    func fetchDataFailed(_ error: InteractorError)
}

```

Presenter used to bind all files together. 

```swift

static func bind(_ view: ListViewController) -> PresenterProtocol  {
        let presenter: PresenterProtocol & InteractoDelegate = Presenter()
        let interactor: InteractorProtocol = Interactor()
        interactor.delegate = presenter
        let router: RouterProtocol = Router()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return presenter
    }
```
 `Interactor` is main business logic class to access API and other data and pass to presenter for processing. 
`Presenter` will process and update data in the view.
`Router` is for navigation logics like push from main page to detail page.
`Entity` - Model class for the data we are using.

