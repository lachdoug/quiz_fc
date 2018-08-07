Question.create!([
  {quiz_id: 1, number: 1, ask: "![Italy photo](/test_images/italy.jpg =300)\r\n\r\nWho is reported to have said?\r\n\r\n> I couldn't settle in Italy. It was like living in a foreign country.", answer: "Ian Rush", form_type: "multiple_choice", config: {"options"=>["Denis Law", "Ian Rush", "John Charles", "Graham Souness"], "button"=>{"class"=>"btn btn-outline-primary"}}},
  {quiz_id: 1, number: 2, ask: "Can you tell who this famous EPL player is, just from a photo of his football boot?\r\n\r\n![](/test_images/pinkdotboot.png)", answer: "Sergio Aguero", form_type: "multiple_choice", config: {"options"=>["Lionel Messi", "Sergio Aguero", "Daniel Strurridge", "Anthony Martial"]}},
  {quiz_id: 1, number: 3, ask: "![](/test_images/west-ham-v-west-brom.jpg =300)\r\n\r\nDuring the 2017/18 EPL season, **West Bromwich Albion** and **West Ham United** collectively received 3 red cards.\r\n\r\nHow many yellow cards did they collectively receive?", answer: "146", form_type: "multiple_choice", config: {"options"=>[146, 55, 45, 22]}},
  {quiz_id: 1, number: 6, ask: "The **2011 FA Cup Final** was played between Manchester City and Stoke City.\r\n\r\n![](/test_images/facupfinal2011.png =500)\r\n\r\nWhat is the result, if you add together the two shirt numbers worn by YaYa Toure and Mario Balotelli on that special day?", answer: "67", form_type: "multiple_choice", config: {"options"=>[14, 17, 45, 67]}},
  {quiz_id: 1, number: 7, ask: "Which Newcastle United footballer has these tattoos on his legs?\r\n\r\n![](/test_images/legtatts.png)", answer: "Jonjo Shelvey", form_type: "input_field", config: nil},
  {quiz_id: 1, number: 8, ask: "Who is this famous ex-EPL footballer?\r\n\r\n![](/test_images/silhouette.png)", answer: "Didier Drogba", form_type: "input_field", config: nil},
  {quiz_id: 1, number: 5, ask: "What is the surname of this famous EPL manager?\r\n\r\n![](/test_images/headshot.png)", answer: "Klopp", form_type: "input_field", config: nil},
  {quiz_id: 1, number: 4, ask: "What name do you think is the middle name in this three name progression?\r\n\r\n![](/test_images/sunderland.png)\r\n\r\nSunderland, _______, Villa?", answer: "Brooking", form_type: "input_field", config: nil},
  {quiz_id: 2, number: 1, ask: "### What jersey number is **Lionel Messi** wearing?\r\n\r\n![](/test_images/messi.png)", answer: "10", form_type: "input_field", config: {"input"=>{"type"=>"number"}}},
  {quiz_id: 2, number: 2, ask: "### Who is this famous number 7?\r\n![](/test_images/ronaldo.jpeg)", answer: "Ronaldo", form_type: "input_field", config: nil},
  {quiz_id: 3, number: 1, ask: "![](/test_images/habs.png =400)\r\n## What is the four-letter name of this team?", answer: "HABS", form_type: "input_field", config: {"input"=>{"size"=>4}}},
  {quiz_id: 3, number: 2, ask: "## Which is the best club in the CDSFA?\r\n\r\n![](/test_images/HPWFC.jpg)\r\n**HPWFC**\r\n\r\n![](/test_images/BTFC.jpg)\r\n**BTFC**\r\n\r\n![](/test_images/MRDFC.jpg)\r\n**MRDFC**\r\n\r\n", answer: "HPWFC", form_type: "multiple_choice", config: {"options"=>["HPWFC", "BTFC", "MRDFC"], "buttons"=>[{"class"=>"btn btn-primary"}, {"class"=>"btn btn-warning"}, {"class"=>"btn btn-danger"}]}},
  {quiz_id: 4, number: 2, ask: "Which game is this map from?\r\n\r\n![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Risk_game_map_fixed.png/1000px-Risk_game_map_fixed.png=500)", answer: "Risk", form_type: "select_menu", config: {"options"=>["Monopoly", "Diplomacy", "Risk", "Quest"]}},
  {quiz_id: 4, number: 3, ask: "## Which is the **lowliest** chess piece?\r\n![](https://cf.geekdo-images.com/opengraph/img/R3tD3P1aOdBq-XlIZDu_OZCk9nU=/fit-in/1200x630/pic260745.jpg=300)\r\n\r\n", answer: "Pawn", form_type: "multiple_choice", config: {"options"=>["King", "Queen", "Bishop", "Knight", "Rook", "Pawn"], "button"=>{"class"=>"btn btn-outline-dark btn-lg btn-block"}}},
  {quiz_id: 4, number: 1, ask: "## In which year between 1930 and 1940 was Monopoly released?\r\n\r\n![](https://c1.staticflickr.com/1/2/1583381_8ba0a9f12f_b.jpg =300)", answer: "1935", form_type: "input_field", config: {"input"=>{"type"=>"number", "max"=>1940, "min"=>1930}}},
  {quiz_id: 2, number: 3, ask: "---\r\n\r\n<span class=\"text-center\">\r\n\r\n#### Which is the best club in the CDSFA?\r\n---\r\n![](/test_images/HPWFC.jpg)\r\n\r\n**HPWFC**\r\n---\r\n![](/test_images/BTFC.jpg)\r\n\r\n**BTFC**\r\n---\r\n![](/test_images/MRDFC.jpg)\r\n\r\n**MRDFC**\r\n---\r\n\r\n</p>", answer: "HPWFC", form_type: "multiple_choice", config: {"options"=>["HPWFC", "BTFC", "MRDFC"], "buttons"=>[{"class"=>"btn btn-primary btn-block"}, {"class"=>"btn btn-warning btn-block"}, {"class"=>"btn btn-danger btn-block"}]}},
  {quiz_id: 2, number: 4, ask: "![](/test_images/habs.png =400)\r\n## What is the name of this team?", answer: "HABS", form_type: "input_field", config: {"input"=>{"size"=>4, "pattern"=>"[A-Z]{4}", "title"=>"Enter 4 uppercase letters"}}}
])
