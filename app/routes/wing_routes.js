// Express docs: http://expressjs.com/en/api.html
const express = require('express')
// Passport docs: http://www.passportjs.org/docs/
const passport = require('passport')

// pull in Mongoose model for examples
const Restaurant = require('../models/restaurant.js')

// this is a collection of methods that help us detect situations when we need
// to throw a custom error
const customErrors = require('../../lib/custom_errors')

// we'll use this function to send 404 when non-existent document is requested
const handle404 = customErrors.handle404
// we'll use this function to send 401 when a user tries to modify a resource
// that's owned by someone else
const requireOwnership = customErrors.requireOwnership

// this is middleware that will remove blank fields from `req.body`, e.g.
// { example: { title: '', text: 'foo' } } -> { example: { text: 'foo' } }
const removeBlanks = require('../../lib/remove_blank_fields')
// passing this as a second argument to `router.<verb>` will make it
// so that a token MUST be passed for that route to be available
// it will also set `req.user`
const requireToken = passport.authenticate('bearer', { session: false })

// instantiate a router (mini app that only handles routes)
const router = express.Router()

// CREATE
// POST
router.post('/wings', requireToken, (req, res, next) => {
  const wingData = req.body.wing
  const restaurantId = wingData.restaurantId
  Restaurant.findById(restaurantId)
    // respond to successful `create` with status 201 and JSON of new "example"
    .then(handle404)
    .then(restaurant => {
      requireOwnership(req, restaurant)
      restaurant.wings.push(wingData)
      return restaurant.save()
    })
    .then(restaurant => {
      res.status(201).json({ restaurant: restaurant.toObject() })
    })
    // if an error occurs, pass it off to our error handler
    // the error handler needs the error message and the `res` object so that it
    // can send an error message back to the client
    .catch(next)
})

// DESTROY
// DELETE /examples/5a7db6c74d55bc51bdf39793
router.delete('/wings/:id', requireToken, (req, res, next) => {
  const restaurantId = req.params.id
  const wingId = req.body.wing.wingId
  Restaurant.findById(restaurantId)
    .then(handle404)
    .then(restaurant => {
      // throw an error if current user doesn't own `example`
      requireOwnership(req, restaurant)
      // delete the example ONLY IF the above didn't throw
      restaurant.wings.id(wingId).remove()
      return restaurant.save()
    })
    // send back 204 and no content if the deletion succeeded
    .then(() => res.sendStatus(204))
    // if an error occurs, pass it to the handler
    .catch(next)
})

// UPDATE
// PATCH /examples/5a7db6c74d55bc51bdf39793
router.patch('/wings/:id', requireToken, removeBlanks, (req, res, next) => {
  // if the client attempts to change the `owner` property by including a new
  // owner, prevent that by deleting that key/value pair
  delete req.body.restaurant.owner

  Restaurant.findById(req.params.id)
    .then(handle404)
    .then(restaurant => {
      // pass the `req` object and the Mongoose record to `requireOwnership`
      // it will throw an error if the current user isn't the owner
      requireOwnership(req, restaurant)

      // pass the result of Mongoose's `.update` to the next `.then`
      return restaurant.updateOne(req.body.restaurant)
    })
    // if that succeeded, return 204 and no JSON
    .then(() => res.sendStatus(204))
    // if an error occurs, pass it to the handler
    .catch(next)
})

module.exports = router
