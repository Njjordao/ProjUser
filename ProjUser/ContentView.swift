
import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isAddView : Bool = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order:.reverse)]) var user:FetchedResults<User>
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(user){user in
                        NavigationLink(destination: EditUserView(user:user), label: {
                            Text(user.name ?? "")
                        })
                    }   
                    .onDelete(perform: delete)
                }
                //.navigationTitle("IUsers")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal){
                        VStack{
                            HStack{
                                Image(systemName: "person.circle")
                                Text("IUser")
                                    .font(.headline)
                            }
                            Text("Total \(getTotalUser())")
                                .font(.subheadline)
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddView = true
                        }label: {
                            Label("add label",systemImage: "person.crop.circle.badge.plus")
                        }
                    }
                }
                .sheet(isPresented: $isAddView){
                    AddUserView()
                }
            }
        }
    }
    
    func delete(offset:IndexSet){
        DataController().deleteUser(offset: offset, context:managedObjectContext, user:user)
    }
    
    func getTotalUser()->Int{
        
        return user.count
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
