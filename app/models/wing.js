const mongoose = require('mongoose')

const wingSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      unique: true,
      sparse: true
    },
    spiciness: {
      type: Number,
      required: true,
      min: 1,
      max: 10
    },
    quality: {
      type: Number,
      required: true,
      min: 1,
      max: 10
    }
  },
  {
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

module.exports = wingSchema
