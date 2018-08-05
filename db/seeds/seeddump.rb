User.create!([
  {email: "lach@engines.org", encrypted_password: "$2a$11$POSTsdIkg7navB4y3TNogO.eS0gYBSdGtLTACs0jMISATXfZdEl/m", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-08-05 07:34:52", last_sign_in_at: "2018-08-05 07:15:22", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: "KwGQJGJDoePzr4u2AjWJ", confirmed_at: "2018-08-02 05:51:48", confirmation_sent_at: "2018-08-02 05:41:49", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil},
  {email: "lachdoug@gmail.com", encrypted_password: "$2a$11$XabYba1zhqs9ypGlsCzw9ufKSM6R0KSyH6YcVM5EhRt9bVnWGZFpu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "KxGQJGJDoePzr4u2AjWJ", confirmed_at: nil, confirmation_sent_at: "2018-08-02 05:41:49", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil},
  {email: "alfs@bigpond.com", encrypted_password: "$2a$11$ciaTVUuYHR3LJIu/smX2zOEXISLO2IfP/HE/9AhkIn9gj5TO0nu6a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "KxGQJGJDoePzr4u2AjWx", confirmed_at: "2018-08-02 05:51:48", confirmation_sent_at: "2018-08-02 05:41:49", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil},
  {email: "matt@axissocial.com.au", encrypted_password: "$2a$11$sGW4.A6LLqgUawC79vkXuO2WYMisTZze//VY7YGdI4WRrpIU2dHRW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "KxGQJGJDoePzr4u2AjWq", confirmed_at: "2018-08-02 05:51:48", confirmation_sent_at: "2018-08-02 05:41:49", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil}
])
Admin.create!([
  {email: "lachlan@engines.org", encrypted_password: "$2a$11$98ygkNulqJWJIlOzwvieF.TPMCTkuQ4ZlI9odumEgmCTm7TDv2f96", sign_in_count: 2, current_sign_in_at: "2018-08-05 07:35:13", last_sign_in_at: "2018-08-05 06:59:02", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", role: "developer"},
  {email: "alfs@bigpond.com", encrypted_password: "$2a$11$GVH3yFsY391olhEAb1JHfOI92vtXvU.e9SMA3Bn25tsWyxAUFMZaK", sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role: "developer"}
])
Play.create!([
  {quiz_id: 4, profile_id: 1, answers: ["Denis Law", "Lionel Messi", "146"], score: 3},
  {quiz_id: 1, profile_id: 1, answers: ["1935", "Risk", "Pawn"], score: 3},
  {quiz_id: 2, profile_id: 1, answers: [], score: nil},
  {quiz_id: 1, profile_id: 1, answers: ["1935", "Risk", "Pawn"], score: 3},
  {quiz_id: 4, profile_id: 1, answers: ["Denis Law", "Lionel Messi"], score: nil}
])
Profile.create!([
  {user_id: 1}
])
Question.create!([
  {quiz_id: 1, number: 2, ask: "Which game is this map from?\r\n\r\n<img src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Risk_game_map_fixed.png/1000px-Risk_game_map_fixed.png\" class=\"img-fluid\">", answer: "Risk", form_type: "select_menu", config: {"options"=>["Monopoly", "Diplomacy", "Risk", "Quest"]}},
  {quiz_id: 1, number: 3, ask: "## Which is the **lowliest** chess piece?\r\n![](https://cf.geekdo-images.com/opengraph/img/R3tD3P1aOdBq-XlIZDu_OZCk9nU=/fit-in/1200x630/pic260745.jpg)\r\n\r\nHint: there are 8 of these per side\r\n", answer: "Pawn", form_type: "multiple_choice", config: {"options"=>["King", "Queen", "Bishop", "Knight", "Rook", "Pawn"], "button"=>{"class"=>"btn btn-outline-dark btn-lg"}}},
  {quiz_id: 1, number: 1, ask: "## In which year between 1930 and 1940 was Monopoly released?\r\n\r\n![](https://c1.staticflickr.com/1/2/1583381_8ba0a9f12f_b.jpg)", answer: "1935", form_type: "input_field", config: {"input"=>{"type"=>"number", "max"=>1940, "min"=>1930}}},
  {quiz_id: 2, number: 1, ask: "What is jersey number is **Lionel Messi** wearing?\r\n\r\n![](https://upload.wikimedia.org/wikipedia/commons/a/aa/ECUADOR_VS_ARGENTINA_%2836956136633%29.jpg)", answer: "10", form_type: "input_field", config: {"input"=>{"type"=>"number"}}},
  {quiz_id: 2, number: 2, ask: "### Who is this?\r\n![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlIiMthwLOenH7jMylcsMRUTuctC0oi7OvrA5ovK9bx1Yv4_-F7g)", answer: "Ronaldo", form_type: "input_field", config: nil},
  {quiz_id: 3, number: 1, ask: "![](https://35b7f1d7d0790b02114c-1b8897185d70b198c119e1d2b7efd8a2.ssl.cf1.rackcdn.com/team_photo/3466410/original/7badf668-a5f1-42ee-962d-c92cf51d6f5b.jpg)\r\n## What is the four-letter name of this team?", answer: "HABS", form_type: "input_field", config: {"input"=>{"size"=>4}}},
  {quiz_id: 3, number: 2, ask: "## Which is the best club in the CDSFA?\r\n\r\n![](/test_images/HPWFC.jpg)\r\n**HPWFC**\r\n\r\n![](/test_images/BTFC.jpg)\r\n**BTFC**\r\n\r\n![](/test_images/MRDFC.jpg)\r\n**MRDFC**\r\n\r\n", answer: "HPWFC", form_type: "multiple_choice", config: {"options"=>["HPWFC", "BTFC", "MRDFC"], "buttons"=>[{"class"=>"btn btn-primary"}, {"class"=>"btn btn-warning"}, {"class"=>"btn btn-danger"}]}},
  {quiz_id: 4, number: 1, ask: "![](/test_images/italy.jpg)\r\n\r\nWho is reported to have said?\r\n\r\n> I couldn't settle in Italy. It was like living in a foreign country.", answer: "Denis Law", form_type: "multiple_choice", config: {"options"=>["Denis Law", "Ian Rush", "John Charles", "Graham Souness"], "button"=>{"class"=>"btn btn-outline-primary"}}},
  {quiz_id: 4, number: 2, ask: "Can you tell who this famous EPL player is, just from a photo of his football boot?\r\n\r\n![](/test_images/pinkdotboot.png)", answer: "Lionel Messi", form_type: "multiple_choice", config: {"options"=>["Lionel Messi", "Sergio Aguero", "Daniel Strurridge", "Anthony Martial"]}},
  {quiz_id: 4, number: 3, ask: "![](/test_images/west-ham-v-west-brom.jpg)\r\n\r\nDuring the 2017/18 EPL season, **West Bromwich Albion** and **West Ham United** collectively received 3 red cards.\r\n\r\nHow many yellow cards did they collectively receive?", answer: "146", form_type: "multiple_choice", config: {"options"=>[146, 55, 45, 22]}},
  {quiz_id: 5, number: 1, ask: nil, answer: nil, form_type: "input_field", config: nil}
])
Quiz.create!([
  {start: "2018-08-14 16:04:00", duration: nil, status: "queued"},
  {start: "2018-08-15 16:04:00", duration: nil, status: "queued"},
  {start: "2018-08-05 12:06:00", duration: nil, status: "queued"},
  {start: "2018-08-05 12:17:00", duration: nil, status: "queued"},
  {start: nil, duration: nil, status: "draft"}
])
