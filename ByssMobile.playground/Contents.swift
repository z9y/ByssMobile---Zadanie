import Foundation

var remoteTodos: [[String : Any]] = [["id": 1, "title": "delectus aut autem", "completed": 0],
                                     ["id": 2, "title": "quis ut nam facilis et officia qui", "completed": 0],
                                     ["id": 3, "title": "fugiat veniam minus", "completed": 1],
                                     ["id": 4, "title": "et porro tempora", "completed": 1],
                                     ["id": 5, "title": "laboriosam mollitia et enim quasi adipisci quia provident illum", "completed": 0],
                                     ["id": 6, "title": "qui ullam ratione quibusdam voluptatem quia omnis", "completed": 0],
                                     ["id": 7, "title": "illo expedita consequatur quia in", "completed": 0],
                                     ["id": 8, "title": "quo adipisci enim quam ut ab", "completed": 1],
                                     ["id": 9, "title": "molestiae perspiciatis ipsa", "completed": 0],
                                     ["id": 10, "title": "illo est ratione doloremque quia maiores aut", "completed": 1]]

class TodoViewControler {
    var textField = ""
    var completed = 0
    var id = 1
    
    //funkcja imitujaca interfejs zwracania textu z textfield
    func fillImaginaryTextField(with text: String?) {
        //sprawdzenie czy text istnieje oraz czy nie jest to pusty string
        if text == "" || text == nil {
            print("Nie podano tutułu")
        } else if let text {
            textField = text
        }
    }
    
    //funkcja imitujaca interfejs przelaczenia checkbox
    func toggleImaginaryCheckbox() {
        switch completed {
        case 0:
            completed = 1
        case 1:
            completed = 0
        default:
            completed = 0
        }
        print("Zmieniono")
    }
    
    //funkcja imitujaca przycisniecie przycisku AddNewToDo
    func imaginaryButtonActionAddNewToDo() {
        if textField != "" {
            for remoteTodo in remoteTodos {
                //nadanie unikalnego id nowemu ToDo, tutaj będzie użyte pierszy id który jeszcze nie istnieje, była również możliwość przypisania zmiennej, która będzie rosła po każdym prawidłowo dodanym ToDo
                if let uniqueID = remoteTodo["id"] {
                    if id == uniqueID as? Int {
                        id += 1
                    }
                }
            }
            //dodanie do remoteTodos nowego ToDo
            let newToDo: [String: Any] = ["id": id, "title": textField, "completed": completed]
            remoteTodos.append(newToDo)
            print("Dodano nowe ToDo")
            print(remoteTodos)
            
            //zerowanie danych do nowego ToDo
            completed = 0
            textField = ""
            id = 1
        } else {
            print("Nie podano tutułu ( użyj funkcji fillImaginaryTextField ) ")
        }
    }
    
    //funkcja imitujaca przycisniecie przycisku RemoveTodo dla obiektu z id
    func imaginaryButtonActionRemoveTodo(with id: Int) {
        if let index = remoteTodos.firstIndex(where: { $0["id"] as? Int == id }) {
            remoteTodos.remove(at: index)
            print(remoteTodos)
        } else {
            print("Nie ma takiego id - sprawdź ponownie")
        }
    }

    //funkcja imitujaca przelaczenie checkbox dla obiektu z id
    func imaginaryButtonActionToggleTodo(with id: Int) {
        if let index = remoteTodos.firstIndex(where: { $0["id"] as? Int == id }) {
            if remoteTodos[index]["completed"] as? Int == 0 {
                remoteTodos[index]["completed"] = 1
                print("Zmieniono ToDo z id: \(id) na WYKONANO")
            } else {
                remoteTodos[index]["completed"] = 0
                print("Zmieniono ToDo z id: \(id) na NIE WYKONANO")
            }
        } else {
            print("Nie ma takiego id - sprawdź ponownie")
        }
    }
}

let foo = TodoViewControler()

//próba podania nil oraz pustego tekstu w textField - wyświetla błąd
foo.fillImaginaryTextField(with: nil)
foo.fillImaginaryTextField(with: "")

print("---")

//Wpisanie tekstu w TextField
foo.fillImaginaryTextField(with: "Test 123")

//zmiana checkbox na "wykonane" (1)
foo.toggleImaginaryCheckbox()

print("---")

//dodanie ToDo
foo.imaginaryButtonActionAddNewToDo()

print("---")

//Próba dodania nowego ToDo - wyświetla błąd, ponieważ textField jest puste
foo.imaginaryButtonActionAddNewToDo()

print("---")

//zmiana wykonania ToDo
foo.imaginaryButtonActionToggleTodo(with: 11)
print(remoteTodos.first(where: { $0["id"] as? Int == 11 }) ?? "Błąd")

print("---")

//usunięcie ToDo
foo.imaginaryButtonActionRemoveTodo(with: 11)

print("---")

//próba usunięcia już nie istniejącego ToDo - wyświetli nam się błąd
foo.imaginaryButtonActionRemoveTodo(with: 11)
