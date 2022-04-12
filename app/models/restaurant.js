const mongoose = require('mongoose')
const wingSchema = require('./wing.js')

const restaurantSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      unique: true
    },
    website: {
      type: String,
      unique: true
    },
    wings: [wingSchema],
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User'
    }
  }, {
    timestamps: true,
    toObject: {
      // remove `hashedPassword` field when we call `.toObject`
      transform: (_doc, user) => {
        delete user.hashedPassword
        return user
      }
    }
  }
)

module.exports = mongoose.model('Restaurant', restaurantSchema)
