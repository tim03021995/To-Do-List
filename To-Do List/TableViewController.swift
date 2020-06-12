import UIKit

class TableViewController: UITableViewController{
    //  var myTask = ["string1","string2","string3"]
    var myTask = [String]()
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        print(myTask.count)
        super.viewDidLoad()
    }
    // MARK: IBAtion
    @IBAction func addItem(_ sender: Any) {
        myAlert()
    }
    // MARK: Alert
    func myAlert(){
        let controller  = UIAlertController(title: "代辦事項", message: "請輸入內容", preferredStyle: .alert)
        controller.addTextField { (textField) in
            textField.placeholder = "內容"
            textField.keyboardType = UIKeyboardType.default
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let msg = controller.textFields?[0].text
            if (msg != nil)
            {
                self.myTask.append(msg!)
                print("save \(msg!)")
                print(self.myTask.count)
                self.tableView.reloadData()
            }else{
                print("is nil")
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(okAction)
        controller.addAction(cancelAction)
        present (controller, animated: true, completion: nil)
    }
    //MARK: -LifeCircle
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            print(indexPath.row)
            self.myTask.remove(at: indexPath.row)
            self.tableView.reloadData()
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller =
            storyboard?.instantiateViewController(withIdentifier: "secondPage"){
            present(controller, animated: true, completion: nil)
        }
        print(self.myTask[indexPath.row])
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTask.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = myTask[indexPath.row]
        return cell
    }
    // MARK: -Funtion
    let sb = UIViewController(nibName: "book", bundle: nil)
}
