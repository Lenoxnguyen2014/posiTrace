# Positrace

Positarce is an REST API app that return geolocations, limited to authenticate users only
based data with IPstacks

## Install and set up postman

Create a user and login
```
POST: localhost:3000/signup. Params { user: { email: "", password: "" } }
GET:  localhost:3000/login. Params {user: { email: "", password: "" } }
```

## API Queries
```
Input either ip address or url address ( accept ipv4 only)

GET:  localhost:3000/all. Return all geolocations
GET:  localhost:3000/geolocations/:id. Return geolocation by id
POST: localhost:3000/geolocations. Params: { geolocation: { ip: "", url: "" }}. Return new geolocation
UPDATE/PUT: localhost:3000/geolocations. Params:  { geolocation: { ip: "", url: "" }}
DELETE: localhost:3000/geolocations/:id

```

## Installation

Clone this repo and make sure you have docker installed in your local machine.

```bash
docker compose up
```

## Or Deploy mannually by following these steps

```Ruby On rails
Install Ruby on your machine
https://www.ruby-lang.org/en/downloads/

Install Postgresql and setup
https://www.postgresql.org/download/

Spining up rails and postgresql
Edit .env, uncomment: POSITRACE_DATABASE_URL with (#run locally)
and comment out POSITRACE_DATABASE_URL(on docker)

# Start the server
rails s
```

## How to tests

Test Manually
```
From postman, creeate a user, login. Try to run all the API queries
```
Run test
```
rake spec 'copy relative path from spec folder'
```
