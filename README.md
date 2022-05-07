# AstroFlow Frontend

> A rails frontend for a service oriented application. A user can enter in data about their menstral cycle as well as their horoscope so Astroflow can provided a one stop shop of astrology and flowology. 

## AstroFlow Backend

> To see the Backend application on github for this project [click here](https://github.com/T-willjr/astroflow_be).
> 
> To visit the application on heroku [click here](https://astro-flow.herokuapp.com) 

## Design Principles: 
The design of this application relies on the facade design pattern. Here's a very high level overview: 
* A controller sends a request from the front end and intiates the creation of a facade, and passes it data(params, from JSON or query) in the backend. 
* A facade is a ruby class that initializes a Service, and sends the service data to a PORO. 
* A service calls an external api enpoint(get (https://web.site?optional_param) ) and returns parsed JSON. 
* The parsed JSON is turned into a Ruby object through a PORO. 
* The object is serialized and sent to the route matching the controller action. 
* Additionally, this project uses `Google OAuth 2.0` for users to create and log into their accounts. 

## Contributors
🩹[Jessica Grazulis](https://github.com/jgrazulis)
🌚[TJ Williams](https://github.com/T-willjr)
🌝[Joe Galvin](https://github.com/jwgalvin)
🩸[Sully Birashk](https://github.com/SullyBirashk)
🔮[Sam Ivari](https://github.com/sam-ivari)


# Getting Started

## Development setup
```ruby 2.7.4```

```rails 5.2.6```

## Gems

![pry v badge](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![shoulda-matchers v badge](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers)
![rspec v badge](https://img.shields.io/gem/v/rspec?color=orange&label=rspec)
![simplecov v badge](https://img.shields.io/gem/v/simplecov?color=green&label=simplecov)
![json-apiserializer](https://img.shields.io/badge/json-apiserializer-blue)

![faraday](https://img.shields.io/badge/faraday-red)
![vcr](https://img.shields.io/badge/vcr-orange)
![capybara](https://img.shields.io/badge/capybara-green)
![figaro](https://img.shields.io/badge/figaro-blue)

## Setup

1. clone this repository 
2. cd into 'astroflow_frontend' directory 
3. run ```'bundle install' to install gems```
7. run ```rake db:{drop,create,migrate,seed} to prepare the database ```
8. run ```bundle exec rspec``` to run the test suite
9. run ```rails s``` to launch the production environment
10. send requests to "https://localhost:3000". 

## User Experience
Dashboard 
![Screen Shot 2022-04-21 at 5 13 41 PM](https://user-images.githubusercontent.com/87387139/164566217-a1b2d5e4-bb22-454a-85fc-28af2a07836a.png)
After registering as a user through a google account the user is brought to the user dashboard where they can review their horoscopes.
![Screen Shot 2022-04-21 at 5 14 58 PM](https://user-images.githubusercontent.com/87387139/164566230-1c723b1a-82a7-48e4-bea4-92a4fccffb32.png)
