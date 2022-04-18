# WingTracker Client: An App to Track True Hot Wing Spiciness Stats

This application allows users to create an account, and use it to log hot wing restaurants and flavors that they've tried, along with personal quality and spice ratings.

## Important Links

[Client Repo](https://github.com/JoeyGarber/WingTracker-Client)
[Deployed Client](https://joeygarber.github.io/WingTracker-Client/)
Link to Deployed API coming soon.

## Planning Story

First and foremost, I knew this app needed to help users keep log in, and keep track of their wings, restaurants, and ratings. After that functionality was finished, I added some ease-of use things: auto-login on sign-up, a dynamic search-bar, and a cleaner update / delete functionality.

## User stories

- As a user, I'll be able to create a rating for a wing flavor.
 - As a user I'll be able to look up all wing flavors I've created.
 - As a user I'll be able to delete or update wings or restaurants I've created.
 - As a user, I'd like to be able to search for wing restaurants in the search bar.
 - As a user, I'd like to be able to sort wings by spiciness or quality.
 - As a user, I'd like to be able to pick from existing restaurants or create a new one when creating a new wing.
 - As a user, I'd like to be able to see pricing information about the wings on my list.

## Technologies Used

- JavaScript
- Express.js
- MongoDb
- Mongoose
- jQuery
- Bootstrap
- HTML/CSS

## Unsolved Problems

I still haven't added in sorting functionality, which is going to be tricky because the wings are listed as sub-tables inside of the restaurant table. But the search bar aids with ease of finding a restaurant in the meantime.

## Wireframe

[Wireframe](./WingTracker-Wireframe.jpeg)

## ERD

[ERD](./ERD.jpeg)