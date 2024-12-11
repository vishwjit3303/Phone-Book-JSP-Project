
# PhoneBook Application

The **PhoneBook Application** is a web-based project developed using Servlet and JSP that allows users to manage their personal contacts securely. It employs a simple user authentication system and a session-based mechanism to control access to the application features.

---

## Key Features

### User Authentication
- **Registration**: New users can register by creating an account.
- **Login**: Existing users can log in using their email and password.
- **Session Management**: 
  - User session is tracked using `session.setAttribute("user", u);`.
  - Unauthorized access is prevented by checking session validity. Users must log in to access features like adding and viewing contacts.
  - If a user tries to access restricted features without logging in, they are prompted with a message: "Please login first."

### Contact Management
- **Add Contact**: 
  - Users can add multiple contacts.
  - Each contact is linked to the user via their user ID, which is stored in the `contact` table.
- **View Contacts**:
  - Users can view a list of all their saved contacts.
  - The contact list includes options to:
    - **Edit**: Modify existing contact details.
    - **Delete**: Remove unwanted contacts from the list.
- **Data Integrity**: Each user’s data is stored and managed independently using their unique user ID.

### Logout
- Users can securely log out of the application, which terminates the session.

---

## Database Structure

The application uses a database named `phonebook_db` with the following two tables:

1. **`user` Table**:
   - Stores user details such as email, password, and other relevant information.

2. **`contact` Table**:
   - Stores contact details (e.g., name, phone number, email, etc.).
   - Includes a `user_id` column to associate contacts with the respective user.

---

## How It Works

1. **Registration**:
   - Users create an account if they don’t already have one.

2. **Login**:
   - Upon successful login, the user’s email is stored in the session.
   - Logged-in users can then access contact management features.

3. **Add Contact**:
   - Users can add new contacts, which are saved to the database along with the user ID.

4. **View Contacts**:
   - Displays a list of all the contacts added by the logged-in user.
   - Users can choose to edit or delete any contact from the list.

5. **Session Validation**:
   - Before performing any action, the server checks if the user is logged in.
   - If the session is invalid, the application redirects the user to the login page with an appropriate message.

6. **Logout**:
   - Ends the session and ensures no unauthorized access.

---

## Technologies Used

- **Backend**: Servlet
- **Frontend**: JSP
- **Database**: MySQL
- **Server**: Apache Tomcat

---

## Setup and Installation

1. **Database Setup**:
   - Create the database `phonebook_db`.
   - Create the `user` and `contact` tables as per the schema requirements.

2. **Deploy Application**:
   - Deploy the project on an Apache Tomcat server.
   - Ensure database connection settings (e.g., username, password) are correctly configured.

3. **Run the Application**:
   - Open the application in a web browser.
   - Register, log in, and start managing your contacts!

---

## Future Enhancements

- Add functionality to search contacts.
- Implement pagination for viewing a large list of contacts.
- Enable profile management for users (e.g., update password, email).

---

## License

This project is open-source and available for modification and enhancement.

---

**Developed By**: Pallavi
