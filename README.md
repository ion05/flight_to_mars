# Flight to Mars

This is a flutter app created for InTech'21. It's a robust platform that can be used by NASA to register applicants for the first flight to mars - for tourism. It uses Firebase Auhtentication to register users with their email and password. It also sends their detials to a firestore collection with user data like Name, Age, Country and Passport ID. It has an admin panel which is accessible only by admins who need to verify themselves using an OTP which is sent to their phone. The Admin Panel shows all details of all users.
The app is secure and the admins have no way to access the password of a particular user. 

# Run the App 

To run the app on your physical device/emulator - 

1) Fork it (optional)

2) Clone it - 
    ```git
    git clone https://github.com/ion05/flight_to_mars.git 
    ``` 
    OR 
    ```
    gh repo clone ion05/flight_to_mars
   ```
 3) Navigate to its directory - 
       ``` 
       cd flight_to_mars
       ```
4) Install all packages 
      ```
      flutter pub get 
      ```
5) Run it 
      ```
      flutter run 
      ```
      
# Admin Panel
To access the admin panel: \n
Number = +11234567890 (Country code is must) \n
Code = 111111
