import UIKit
import HUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let hudButton = UIButton()
        view.addSubview(hudButton)

        hudButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(100)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
        }

        hudButton.setTitleColor(.black, for: .normal)
        hudButton.setTitle("Show HUD", for: .normal)
        hudButton.addTarget(self, action: #selector(showHud), for: .touchUpInside)
    }

    @objc func showHud() {
        show(title: "Hello World")
    }

    private func show(title: String?) {
        var config = HUDConfig()
        config.style = .center
        config.startAdjustSize = 0.8
        config.finishAdjustSize = 0.8
        config.preferredSize = CGSize(width: 146, height: 114)
        config.backgroundColor = .gray
        config.blurEffectStyle = .regular

        HUD.instance.config = config

        HUDStatusFactory.instance.config.customProgressValue = nil
        let content = HUDStatusFactory.instance.view(type: .progress(.custom), title: "Hello world")
        HUD.instance.showHUD(content, onTapHUD: { hud in
            hud.hide()
        })
    }

}
