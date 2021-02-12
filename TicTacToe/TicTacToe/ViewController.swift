//
//  ViewController.swift
//  TicTacToe
//
// 
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var turnXImage: UIImageView!
    @IBOutlet weak var turnOImage: UIImageView!
    
    @IBOutlet weak var space1: UIButton!
    @IBOutlet weak var space2: UIButton!
    @IBOutlet weak var space3: UIButton!
    @IBOutlet weak var space4: UIButton!
    @IBOutlet weak var space5: UIButton!
    @IBOutlet weak var space6: UIButton!
    @IBOutlet weak var space7: UIButton!
    @IBOutlet weak var space8: UIButton!
    @IBOutlet weak var space9: UIButton!
    
    var board = [[String]]()
    var spaces = [UIButton]()
    var turn = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
        spaces = [space1, space2, space3, space4, space5, space6, space7, space8, space9]
        setupDisplay()
    }
    
    func changeTurn(to: String) {
        turn = to
        if turn == "O" {
            turnXImage.tintColor = .darkGray
            turnOImage.tintColor = UIColor(named: "o-blue")
        } else {
            turnXImage.tintColor = UIColor(named: "x-red")
            turnOImage.tintColor = .darkGray
        }
    }
    
    func updateSpace(space: UIButton) {
        if turn == "O" {
            space.setImage(UIImage(named: "o"), for: .normal)
        } else {
            space.setImage(UIImage(named: "x"), for: .normal)
        }
        space.isEnabled = false
        
        for row in 0..<board.count {
            var abc = ""
            for column in 0..<board[row].count {
                abc += "\(board[row][column]) "
            }
            print(abc)
        }
        
        if !isGameOver()  {
            if turn == "O" {
                changeTurn(to: "X")
            } else {
                changeTurn(to: "O")
            }
        }
    }
    
    func clearSpace(space: UIButton) {
        var i : [Int] = [3, 43, 2,3 ,556, 345]
        i[4] = 32
        space.setImage(.none, for: .normal)
        space.isEnabled = true
        
    }
    
    func setupDisplay() {
        for space in spaces {
            space.adjustsImageWhenDisabled = false
            clearSpace(space: space)
        }
    }
    
    func isGameOver() -> Bool {
        for row in 0..<board.count {
            if board[row][0] == turn && board[row][1] == turn && board[row][2] == turn {
                spaces[(row*3)+0].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(row*3)+0].tintColor = .green
                spaces[(row*3)+1].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(row*3)+1].tintColor = .green
                spaces[(row*3)+2].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(row*3)+2].tintColor = .green
                showWinner(winner: turn)
                print("\(turn) wins")
                return true
            }
        }
        
        for column in 0..<board[0].count {
            if board[0][column] == turn && board[1][column] == turn && board[2][column] == turn {
                spaces[(0*3)+column].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(0*3)+column].tintColor = .green
                spaces[(1*3)+column].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(1*3)+column].tintColor = .green
                spaces[(2*3)+column].setImage(UIImage(named: "\(turn)-green"), for: .normal)
                spaces[(2*3)+column].tintColor = .green
                showWinner(winner: turn)
                print("\(turn) wins")
                return true
            }
        }
        
        if board[0][0] == turn && board[1][1] == turn && board[2][2] == turn {
            spaces[(0*3)+0].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(0*3)+0].tintColor = .green
            spaces[(1*3)+1].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(1*3)+1].tintColor = .green
            spaces[(2*3)+2].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(2*3)+2].tintColor = .green
            showWinner(winner: turn)
            print("\(turn) wins")
            return true
        }
        
        if board[0][2] == turn && board[1][1] == turn && board[2][0] == turn {
            spaces[(0*3)+2].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(0*3)+2].tintColor = .green
            spaces[(1*3)+1].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(1*3)+1].tintColor = .green
            spaces[(2*3)+0].setImage(UIImage(named: "\(turn)-green"), for: .normal)
            spaces[(2*3)+0].tintColor = .green
            showWinner(winner: turn)
            print("\(turn) wins")
            return true
        }
            
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                if board[row][column] == "-" {
                    print("Game's not done")
                    return false
                }
            }
        }
        
        showWinner(winner: "tie")
        print("Tie")
        return true
    }
    
    func showWinner(winner: String) {
        if (winner == "X") {
            turnXImage.tintColor = .green
            turnOImage.tintColor = .darkGray
        } else if (winner == "O") {
            turnOImage.tintColor = .green
            turnXImage.tintColor = .darkGray
        } else {
            turnXImage.tintColor = .darkGray
            turnOImage.tintColor = .darkGray
        }
        for space in spaces {
            space.isEnabled = false
        }
    }
    
    
    @IBAction func refreshPressed(_ sender: UIButton) {
        board = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
        if turn=="O" {
            changeTurn(to: "X")
        } else {
            changeTurn(to: "O")
        }
        
        for space in spaces {
            clearSpace(space: space)
        }
    }
    
    @IBAction func space1Pressed(_ sender: UIButton) {
        board[0][0] = turn
        updateSpace(space: space1)
        
    }
    
    @IBAction func space2Pressed(_ sender: UIButton) {
        board[0][1] = turn
        updateSpace(space: space2)
        
    }
    
    @IBAction func space3Pressed(_ sender: UIButton) {
        board[0][2] = turn
        updateSpace(space: space3)
        
    }
    
    @IBAction func space4Pressed(_ sender: Any) {
        board[1][0] = turn
        updateSpace(space: space4)
        
    }
    
    @IBAction func space5Pressed(_ sender: Any) {
        board[1][1] = turn
        updateSpace(space: space5)
        
    }
    
    @IBAction func space6Pressed(_ sender: Any) {
        board[1][2] = turn
        updateSpace(space: space6)
        
    }
    
    @IBAction func space7Pressed(_ sender: Any) {
        board[2][0] = turn
        updateSpace(space: space7)
        
    }
    
    @IBAction func space8Pressed(_ sender: Any) {
        board[2][1] = turn
        updateSpace(space: space8)
        
    }
    
    @IBAction func space9Pressed(_ sender: Any) {
        board[2][2] = turn
        updateSpace(space: space9)
    }
    
}
