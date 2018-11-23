Admin.create!([
  {email: "lachlan@engines.org", password: "password", password_confirmation: "password", developer: true, quizmaster: true, comptroller: true, auditor: true },
  {email: "alfs@bigpond.com", password: "password", password_confirmation: "password", developer: false, quizmaster: true, comptroller: true, auditor: true },
  {email: "matt@axissocial.com.au", password: "password", password_confirmation: "password", developer: false, quizmaster: true, comptroller: true, auditor: true },
])
