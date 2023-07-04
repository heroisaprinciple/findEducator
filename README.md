<h1>A findEducator platform to find a tutor for a particular subject.</h1>
Stack: Rails + Postgres, React.js

<h1>How to run application:</h1>

1. Clone a repository.

2. Go to the project and enter there `bundle install` to install all gems (packages) needed for the application.

3. `rails db:create` to create a db.

4. `rails db:migrate` to run migrations.

5. Run `rails db:seed` to populate your database with necessary info.

6. Run `rails s` in one terminal.

7. Go to educator directory (which is a React app) and run `npm install` there (in second terminal).

8. Run `npm start` to start the React app.

9. Enter 'Yes' when it is asked to change the server as rails api runs on port 3000, but React app runs on port 3001.

Good. Let's go.


<h2>Rails Part Documentation:</h2>

<h3>The gems used:</h3>
Authentication: devise, devise-security (for better passwords), devise-jwt, email-validator.

Payment: stripe, pay.

<h1> Goals for this project: </h1>
<h3> Mentor has only one subject for now. And there is one price for the subject. </h3>
<h3> In nearest future: one mentor has many subjects, but the price for the subject is constant. </h3>
<h3> Finally, one mentor has many subjects and many prices for subjects. Thus, a mentor can 
select their own price for the subject. In essence, there are two mentors who teach Anatomy. Both of them
can select prices for the subject. </h3>





