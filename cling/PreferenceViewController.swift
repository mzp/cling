import UIKit

class PreferenceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView!.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView!.setEditing(false, animated: true)
        view.addSubview(tableView!)
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: NSInteger) -> NSString {
        return "Settings"
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return 2
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel!.text = "URL"
            } else if (indexPath.row == 1) {
                cell.textLabel!.text = "Interval"
            }
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }

    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        if (indexPath.section != 0) {
            return
        }
        if (indexPath.row == 0) {
            self.navigationController!.pushViewController(ViewControllers.sharedInstance.urlPreferenceViewController, animated: true)
        } else if (indexPath.row == 1) {
            self.navigationController!.pushViewController(ViewControllers.sharedInstance.intervalPreferenceViewController, animated: true)
        }
    }
}
