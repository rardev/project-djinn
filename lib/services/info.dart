class Info
{
   String first_name;
   String last_name;
   String username;
   String phone_number;

   void changeInfo(String fName, String lName, String username, String phone)
   {
     first_name = fName;
     last_name = lName;
     this.username = username;
     phone_number = phone;
   }
  Info({required this.first_name, required this.last_name, required this.username, required this.phone_number});
}