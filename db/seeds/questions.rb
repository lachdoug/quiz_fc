Question.create!([
  {quizbook_id: 1, number: 1, template: "auckland", config: {"preamble"=>"", "left_box"=>"", "centre_box"=>"", "right_box"=>"", "ask"=>"Who is this?", "options"=>["Jack", "Fred", "John", "Mike"], "answer"=>"Jack", "points"=>"", "explanation"=>""}, ask: "Who is this?", answer: "Jack", explanation: nil, points: 1, scoring: {:strategy=>:reg, :map=>{/^Jack$/i=>1}}}
])
