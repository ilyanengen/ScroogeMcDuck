import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let taxInfo = TaxInfo(additionalPensionOptions: [
            AdditionalPensionOption(title: "No", rate: 0),
            AdditionalPensionOption(title: "2.1 %", rate: 0.021),
            AdditionalPensionOption(title: "3 %", rate: 0.03),
        ])
        let viewModel = SalaryViewModelImpl(
            taxInfo: taxInfo,
            sodraApi: SodraAPIImpl(),
            salaryCalculator: SalaryCalculatorImpl()
        )
        let salaryVC = SalaryViewController(viewModel: viewModel)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = salaryVC
        window?.makeKeyAndVisible()
    }
}
