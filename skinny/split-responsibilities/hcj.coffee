# ========================================================= #
# ================== HTML / Structure ===================== #
# ========================================================= #

.tweet
  .left.thumb
    = image user.thumb.url, height: "50px"
  .right
    .name
      = user.name
    .text
      = link tweet.text, to: tweet.url
  .message


# ===================================================== #
# ================== CSS / Styles ===================== #
# ===================================================== #

# generic
.left, .right
  display: inline-block

# tweet
.tweet < .card

  .message
    color: green
    padding: 8px
    resize: (event) ->

      # based on properties
      if self.text.count > 10
        self.padding = "15px"

      # based on events
      if event == "click"
        self.padding = "20px"


# ============================================================ #
# ================== Javascript / Events ===================== #
# ============================================================ #

# locate layers
layers = $ ".tweet"

# how to response to events
layers.click -> message.text "You clicked the tweet!"
layers.on "fancy event", (event) ->
  name = self.find ".name"
  name.text "I am fancy #{event}!"
