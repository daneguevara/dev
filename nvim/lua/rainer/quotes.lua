local quotes = {
  { "That's what she said.", '', 'Michael Scott' },
  { "I am Beyoncé, always.", '', 'Michael Scott' },
  { "I declare bankruptcy!", '', 'Michael Scott' },
  { "Bears. Beets. Battlestar Galactica.", '', 'Jim Halpert' },
  { "Dwight, you ignorant slut!", '', 'Michael Scott' },
  { "I want people to be afraid of how much they love me.", '', 'Michael Scott' },
  { "I’m not superstitious, but I am a little stitious.", '', 'Michael Scott' },
  { "Identity theft is not a joke, Jim! Millions of families suffer every year!", '', 'Dwight Schrute' },
  { "I'm an early bird and a night owl. So I'm wise and I have worms.", '', 'Michael Scott' },
  { "I wish there was a way to know you’re in the good old days before you’ve actually left them.", '', 'Andy Bernard' },
  { "I talk a lot, so I’ve learned to just tune myself out.", '', 'Kelly Kapoor' },
  { "Sometimes I’ll start a sentence, and I don’t even know where it’s going. I just hope I find it along the way.", '', 'Michael Scott' },
  { "I’m about to do something very bold in this job that I’ve never done before: try.", '', 'Jim Halpert' },
  { "Whenever I'm about to do something, I think, 'Would an idiot do that?' And if they would, I do not do that thing.", '', 'Dwight Schrute' },
  { "I am running away from my responsibilities. And it feels good.", '', 'Michael Scott' },
  { "I understand nothing.", '', 'Michael Scott' },
  { "I’m not usually the butt of the joke. I’m usually the face of the joke.", '', 'Michael Scott' },
  { "I am fast. To give you a reference point, I am somewhere between a snake and a mongoose… And a panther.", '', 'Dwight Schrute' },
  { "How is it possible that in five years, I’ve had two engagements and only one chair?", '', 'Pam Beesly' },
  { "You miss 100% of the shots you don’t take. – Wayne Gretzky", '', 'Michael Scott' },
  { "I am a black belt in gift wrapping.", '', 'Jim Halpert' },
  { "I would not miss it for the world. But if something else came up, I would definitely not go.", '', 'Michael Scott' },
  { "Oh, it is on, like a prawn who yawns at dawn.", '', 'Andy Bernard' },
  { "Did I stutter?", '', 'Stanley Hudson' },
  { "Sometimes the clothes at Gap Kids are just too flashy.", '', 'Angela Martin' },
  { "I am the lizard king.", '', 'Creed Bratton' },
  { "I’m an early bird and I’m a night owl. So I’m wise and I have worms.", '', 'Michael Scott' },
  { "It’s never too early for ice cream.", '', 'Michael Scott' },
  { "I’m always thinking one step ahead. Like a carpenter that makes stairs.", '', 'Andy Bernard' },
  { "I'm not a hero. I’m a mere defender of the office. You know who’s a real hero? Hiro from Heroes. That’s a hero.", '', 'Dwight Schrute' },
  { "I have cause. It is beets.", '', 'Dwight Schrute' },
  { "Well, well, well, how the turntables.", '', 'Michael Scott' },
  { "I just want to lie on the beach and eat hot dogs. That’s all I’ve ever wanted.", '', 'Kevin Malone' },
  { "I’m not here to make friends. I’m here to win.", '', 'Angela Martin' },
  { "The worst thing about prison was the Dementors.", '', 'Michael Scott' },
  { "I am better than you have ever been or ever will be.", '', 'Dwight Schrute' },
  { "You don't even know my real name. I’m the [expletive] Lizard King.", '', 'Creed Bratton' },
  { "I am the Regional Manager, not the Assistant to the Regional Manager.", '', 'Dwight Schrute' },
  { "I do not apologize unless I think I’m wrong, and if you don’t like it, you can leave.", '', 'Stanley Hudson' },
  { "I am a big fan of justice.", '', 'Michael Scott' },
  { "And I feel God in this Chili’s tonight.", '', 'Pam Beesly' },
  { "I’m the king of forwards. It’s how I like to do business: get things done by sending an email with the message ‘Please see below.’", '', 'Ryan Howard' },
  { "Sometimes I get so bored I just want to scream, and then sometimes I actually do scream.", '', 'Kelly Kapoor' },
  { "I just want to be friends. Plus a little extra. Also, I love you.", '', 'Dwight Schrute' },
  { "I am one of the few people who looks hot eating a cupcake.", '', 'Kelly Kapoor' },
  { "I don’t hate it. I just don’t like it at all, and it’s terrible.", '', 'Michael Scott' },
  { "I have been Michael’s number two guy for about five years. And we make a great team. We’re like one of those classic famous teams. He’s like Mozart, and I’m like… Mozart’s friend. No. I’m like Butch Cassidy, and Michael is like… Mozart. You try and hurt Mozart? You’re gonna get a bullet in your head courtesy of Butch Cassidy.", '', 'Dwight Schrute' },
  { "The eyes are the groin of the head.", '', 'Dwight Schrute' },
  { "I don’t care what they say about me. I just want to eat.", '', 'Pam Beesly' },
  { "I love inside jokes. I’d love to be a part of one someday.", '', 'Michael Scott' },
  { "There’s a lot of beauty in ordinary things. Isn’t that kind of the point?", '', 'Pam Beesly' },
  { "I don’t want to work. I just want to bang on this mug all day.", '', 'Jim Halpert' },
  { "I am Michael, and I am part English, Irish, German, and Scottish. Sort of a virtual United Nations.", '', 'Michael Scott' },
  { "I’m not the way they portrayed me on television. My personality is my own, and I am unique.", '', 'Creed Bratton' },
  { "Why waste time say lot word when few word do trick?", '', 'Kevin Malone' },
  { "I am a great artist and I know it.", '', 'Pam Beesly' },
  { "I’m always thinking one step ahead. Like a carpenter that makes stairs.", '', 'Andy Bernard' },
  { "And I knew exactly what to do. But in a much more real sense, I had no idea what to do.", '', 'Michael Scott' },
  { "I just want to lie on the beach and eat hot dogs. That’s all I’ve ever wanted.", '', 'Kevin Malone' },
  { "I would not miss it for the world. But if something else came up, I would definitely not go.", '', 'Michael Scott' },
  { "If I were buying my coffin, I would get one with thicker walls so you couldn’t hear the other dead people.", '', 'Dwight Schrute' },
  { "If I don’t have some cake soon, I might die.", '', 'Stanley Hudson' },
  { "You are a thief of joy.", '', 'Dwight Schrute' },
  { "I have to speak to Angela and Oscar about some office issues. But I’m sorry, that will have to wait. What’s more important is that Angela and Oscar have been sleeping together.", '', 'Michael Scott' },
  { "I am not a hero. You know who’s a hero? Hiro from Heroes. That’s a hero.", '', 'Dwight Schrute' },
  { "I don't care what they say about me. I just want to eat.", '', 'Pam Beesly' },
  { "I don’t care what they say about me. I just want to eat.", '', 'Pam Beesly' },
  { "I just want to be friends. Plus a little extra. Also, I love you.", '', 'Dwight Schrute' },
  { "I talk a lot, so I’ve learned to just tune myself out.", '', 'Kelly Kapoor' },
  { "I’m not a hero. I’m a mere defender of the office. You know who’s a real hero? Hiro from Heroes. That’s a hero.", '', 'Dwight Schrute' },
  { "I feel like all my kids grew up and then they married each other. It’s every parent’s dream.", '', 'Michael Scott' },
  { "I’m not here to make friends. I’m here to win.", '', 'Angela Martin' },
  { "The worst thing about prison was the Dementors.", '', 'Michael Scott' },
  { "I am better than you have ever been or ever will be.", '', 'Dwight Schrute' },
  { "I’m not here to make friends. I’m here to win.", '', 'Angela Martin' },
  { "The worst thing about prison was the Dementors.", '', 'Michael Scott' },
  { "I am better than you have ever been or ever will be.", '', 'Dwight Schrute' },
  { "I'm an early bird and a night owl. So I'm wise and I have worms.", '', 'Michael Scott' },
  { "It’s never too early for ice cream.", '', 'Michael Scott' },
  { "I’m always thinking one step ahead. Like a carpenter that makes stairs.", '', 'Andy Bernard' },
  { "I'm not a hero. I’m a mere defender of the office. You know who’s a real hero? Hiro from Heroes. That’s a hero.", '', 'Dwight Schrute' },
  { "I have cause. It is beets.", '', 'Dwight Schrute' },
  { "Well, well, well, how the turntables.", '', 'Michael Scott' },
  { "I just want to lie on the beach and eat hot dogs. That’s all I’ve ever wanted.", '', 'Kevin Malone' },
  { "I’m not here to make friends. I’m here to win.", '', 'Angela Martin' },
  { "The worst thing about prison was the Dementors.", '', 'Michael Scott' },
  { "I am better than you have ever been or ever will be.", '', 'Dwight Schrute' },
  { "You don't even know my real name. I’m the [expletive] Lizard King.", '', 'Creed Bratton' },
  { "I am the Regional Manager, not the Assistant to the Regional Manager.", '', 'Dwight Schrute' },
  { "I do not apologize unless I think I’m wrong, and if you don’t like it, you can leave.", '', 'Stanley Hudson' },
  { "I am a big fan of justice.", '', 'Michael Scott' },
  { "And I feel God in this Chili’s tonight.", '', 'Pam Beesly' },
  { "I’m the king of forwards. It’s how I like to do business: get things done by sending an email with the message ‘Please see below.’", '', 'Ryan Howard' },
  { "Sometimes I get so bored I just want to scream, and then sometimes I actually do scream.", '', 'Kelly Kapoor' },
  { "I just want to be friends. Plus a little extra. Also, I love you.", '', 'Dwight Schrute' },
  { "I am one of the few people who looks hot eating a cupcake.", '', 'Kelly Kapoor' },
  { "I don’t hate it. I just don’t like it at all, and it’s terrible.", '', 'Michael Scott' },
  { "I have been Michael’s number two guy for about five years. And we make a great team. We’re like one of those classic famous teams. He’s like Mozart, and I’m like… Mozart’s friend. No. I’m like Butch Cassidy, and Michael is like… Mozart. You try and hurt Mozart? You’re gonna get a bullet in your head courtesy of Butch Cassidy.", '', 'Dwight Schrute' },
  { "The eyes are the groin of the head.", '', 'Dwight Schrute' },
  { "I don’t care what they say about me. I just want to eat.", '', 'Pam Beesly' }
}

-- Returns a random quote from the office
local quote = function()
    math.randomseed(os.clock())
    local index = math.random() * #quotes
    return quotes[math.floor(index) + 1]
end

return quote