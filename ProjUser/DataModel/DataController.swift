
import Foundation
import CoreData

class DataController:ObservableObject {
     
   func save (context:NSManagedObjectContext ){
        
       do{
           try context.save()
       }catch{
           
            print("erro ao salvar dados \(error)")
       }
    }// save
  
    func addUser(name:String, lastName:String, pass:String, email:String, context:NSManagedObjectContext){
        
        let user = User(context : context)
        
        user.name = name
        user.lastName = lastName
        user.pass = pass
        user.email = email
        user.id = UUID()
        user.date = Date()
        
        save(context: context)

    }//addUser
}//DataController
