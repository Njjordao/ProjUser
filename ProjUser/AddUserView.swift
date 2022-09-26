
import SwiftUI
import CoreData

struct AddUserView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State var name : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var pass : String = ""
    @State var birthday : Date = Date()
    
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
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    SecureField("Senha", text: $pass)
                    Text(pass)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Button(action: {
                        DataController().addUser(name: name, lastName: lastName, pass: pass, email: email, birthday: birthday, context: managedObjectContext)
                        dismiss()
                    },label: { Label("Adicionar", systemImage: "person.badge.plus")})
                        .frame(width: 300, height: 40)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}   

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
