const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    Validate: {
      Validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Plz Enter Valid Email",
    },
  },
  pass: {
    required: true,
    type: String,
    Validate: {
      Validator: (value) => {
        return value.length > 6 ;
      },
      message: "Plz Enter Valid Email",
    },
  },
  address: {
    type: String,
    default: "",
  },
  // cart
});

const User = mongoose.model("User", userSchema);
module.exports = User;
