
import Foundation
import CoreData
import SwiftUI

class DataController:ObservableObject {
    
    static let shareed=DataController()
    
    let container = NSPersistentContainer(name: "UserModel")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("erro ao carregar os dados \(error)")
                
            }
        }
    }
     
    func save (context:NSManagedObjectContext ){
        
       do{
           try context.save()
           
       }catch{
           print("erro ao salvar dados \(error)")
           
       }
    }
  
    func addUser(name:String, lastName:String, pass:String, email:String, birthday:Date, context:NSManagedObjectContext){
        
        let user = User(context: context)
        
        user.name = name
        user.lastName = lastName
        user.pass = pass
        user.email = email
        user.birthday = birthday
        user.id = UUID()
        user.date = Date()
 
        save(context: context)

    }
    
    func editUser (userOld: User, name:String, lastName:String, pass:String, email:String, birthday:Date, context:NSManagedObjectContext){
        
        userOld.name = name
        userOld.lastName = lastName
        userOld.pass = pass
        userOld.email = email
        userOld.birthday = birthday
        userOld.date = Date()
        
        save(context: context)
    }
    
    func deleteUser (offset:IndexSet, context: NSManagedObjectContext, user: FetchedResults<User>){
        offset.map{user[$0]}
            .forEach(context.delete)
        
        save(context: context)
    }
}
