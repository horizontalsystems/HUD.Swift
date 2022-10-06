import UIKit

protocol HUDViewInterface: AnyObject {
    var presenter: HUDViewPresenterInterface { get }

    func adjustPlace()
    var showCompletion: (() -> ())? { get set }
    var dismissCompletion: (() -> ())? { get set }
    func safeCorrectedOffset(for inset: CGPoint, style: HUDBannerStyle?, relativeWindow: Bool) -> CGPoint
}

protocol HUDViewRouterInterface: AnyObject {
    var view: HUDView? { get set }
    func show()
    func hide()
}

protocol HUDViewPresenterInterface: AnyObject {
    var interactor: HUDViewInteractorInterface { get }
    var view: HUDViewInterface? { get set }
    var feedbackGenerator: HUDFeedbackGenerator? { get set }

    func viewDidLoad()
    func addActionTimers(_ timeActions: [HUDTimeAction])
    func updateCover()
    func show(animated: Bool, completion: (() -> ())?)
    func dismiss(animated: Bool, completion: (() -> ())?)
}

protocol HUDViewInteractorInterface: AnyObject {
    var delegate: HUDViewInteractorDelegate? { get set }
}

protocol HUDViewInteractorDelegate: AnyObject {
    func updateCover()
    func showContainerView(animated: Bool, completion: (() -> ())?)
    func dismiss(animated: Bool, completion: (() -> ())?)
}

