![](https://img.shields.io/badge/Microverse-blueviolet)

# Tempu API

> This project is an API for the back end of the Tempus time Tracker application using Ruby on Rails.

![screenshot](https://www.thoughtwavesoft.com/wp-content/uploads/2018/09/api1-2.png)

All the information is stored in a PostGres database managed using Rails Active Record and the endpoint are used by the [Tempus Time Tracker](https://tempus-mm.herokuapp.com/) front end to validate, get and insert information into the API.

Check the [Tempus Time Tracker repository here](https://github.com/mateomh/tempus-time-tracker.git)

## Built With

- Rails,
- Ruby,
- Active Record,
- PostGres

## Live Demo

[Tempus Link](https://tempus-mm-api.herokuapp.com/)

# How to use it

The API has several endpoint to get different types of data.

For **User** data the endpoint are the following:

**GET /users/:name** validates if the username already exists. If it doesn't exist the api responds with a 404 error code. If the users exists the information about the user is sent in JSON format

**POST /users** creates a new user if the name is not already taken. The information about the user is sent in the bosy of the request in JSON format.

For the **Categories** data the endpoints are the following:

**GET /categories** Sends all the available categories in the database in JSON format
**POST /categories** Creates a new category in the database. the category information is sent in the body of the request in JSON format

For the **Tasks* data the endpoints are the following:

**GET /tasks/:name** This enpoint sends the tasks that belong to the user name provided.

**POST /tasks** Creates a new task with the provided information inside the body of the request.


## Setup Locally

### Install before you start

To run the app you need to install RUBY on your computer. For windows, you can go to [Ruby installer](https://rubyinstaller.org/), for MAC and LINUX you can go to [Ruby official site](https://www.ruby-lang.org/en/downloads/) for instructions on how to install it.

After installing ruby, run the following command to install RAILS

```
gem install rails -v 5.2.3
```

And you can verify that is properly installed by running

```
rails -v
```

That's it, you are ready to go to the next step.

### Getting ready

Clone the [repository](https://github.com/mateomh/tempus-api.git), get into the root project folder, open a terminal there and install the gems required for the project by running.

```
bundle install
```

Then run the creation and migrations for the database to get the project ready for the server.

```
rails db:create

rails db:migrate
```

### Run the Tests

This project comes with a suite of test with it. You can run them all by opening a terminal in the root folder and excecuting the following command

```
rspec
```

You will see the results of all the test in your command line.

### Run the app

To run the app you should run this command in the terminal that you opened earlier.

```
rails server
```

And then got to your browser and enter the following address in the address bar.

> http://localhost:5000/

And you are ready to go and enjoy the app


## Authors

👤 **Mateo mojica**

- Github: [@mateomh](https://github.com/mateomh)
- Twitter: [@mateo_m_h](https://twitter.com/mateo_m_h)
- Linkedin: [Mateo mojica](https://linkedin.com/mateo_mojica_hernandez)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Heroku

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
