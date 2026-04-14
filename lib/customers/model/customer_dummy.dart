import 'package:totaliclient/customers/model/customers.dart';

class CustomerDummy {
  static List<Customers> getCustomers(){
    return[
      Customers(City: "New York", Name: "John Smith", Email: "john.smith@email.com", Mobile_Number: "+1 555-123-4567", id: "02789231"),
      Customers(City: "Los Angeles", Name: "Emma Johnson", Email: "emma.j@email.com", Mobile_Number: "+1 555-234-5678", id: "03841562"),
      Customers(City: "Chicago", Name: "Michael Brown", Email: "michael.brown@email.com", Mobile_Number: "+1 555-345-6789", id: "04127389"),
      Customers(City: "Houston", Name: "Sophia Garcia", Email: "sophia.garcia@email.com", Mobile_Number: "+1 555-456-7890", id: "05918234"),
      Customers(City: "Phoenix", Name: "James Wilson", Email: "james.wilson@email.com", Mobile_Number: "+1 555-567-8901", id: "06349752"),
      Customers(City: "San Antonio", Name: "Olivia Martinez", Email: "olivia.martinez@email.com", Mobile_Number: "+1 555-678-9012", id: "07128463"),
      Customers(City: "San Diego", Name: "William Anderson", Email: "william.anderson@email.com", Mobile_Number: "+1 555-789-0123", id: "08295671"),
      Customers(City: "Dallas", Name: "Ava Taylor", Email: "ava.taylor@email.com", Mobile_Number: "+1 555-890-1234", id: "09413785"),
      Customers(City: "Austin", Name: "Benjamin Thomas", Email: "ben.thomas@email.com", Mobile_Number: "+1 555-901-2345", id: "10347892"),
      Customers(City: "Jacksonville", Name: "Mia Moore", Email: "mia.moore@email.com", Mobile_Number: "+1 555-012-3456", id: "11562984"),
      Customers(City: "Fort Worth", Name: "Lucas Jackson", Email: "lucas.jackson@email.com", Mobile_Number: "+1 555-123-4567", id: "12834715"),
      Customers(City: "Columbus", Name: "Isabella White", Email: "isabella.white@email.com", Mobile_Number: "+1 555-234-5678", id: "13459276"),
      Customers(City: "Charlotte", Name: "Ethan Harris", Email: "ethan.harris@email.com", Mobile_Number: "+1 555-345-6789", id: "14782369"),
      Customers(City: "Indianapolis", Name: "Amelia Martin", Email: "amelia.martin@email.com", Mobile_Number: "+1 555-456-7890", id: "15294738"),
      Customers(City: "Seattle", Name: "Alexander Lee", Email: "alex.lee@email.com", Mobile_Number: "+1 555-567-8901", id: "16837254")

    ];
  }
}