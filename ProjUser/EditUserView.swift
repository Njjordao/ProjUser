
import SwiftUI
import CoreData

struct EditUserView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State var name : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var pass : String = ""
    @State var birthday : Date = Date()
    
    var user:FetchedResults<User>.Element
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Nome Usuario", text: $name)
                    TextField("Sobrenome", text: $lastName)
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    DatePicker(selection: $birthday, in:...Date(),displayedComponents: .date){
                        Text("Nascimento")}
                                       
                    SecureField("Senha", text: $pass)
                    Text(pass)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                        .onAppear(){
                            if let name = user.name{
                                self.name=name
                            }
                            
                            if let lastName = user.lastName{
                                self.lastName=lastName
                            }
                            
                            if let email = user.email{
                                self.email=email
                            }
                            
                            if let birthday = user.birthday{
                                self.birthday=birthday
                            }
                            
                            if let pass = user.pass{
                                self.pass=pass
                            }
                            
                        }
                    
                    Button(action: {
                        DataController().editUser(userOld: user, name: self.name, lastName: self.lastName, pass: self.pass, email: self.email, birthday: self.birthday, context: managedObjectContext)
                        
                        dismiss()
                    },label: { Label("Salvar", systemImage: "square.and.arrow.down")})
                    .frame(width: 300, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
                
            }
        }
    }
}

