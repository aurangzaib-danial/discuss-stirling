# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



subject_titles = [
  "Accounting and Finance",
  "Aquaculture",
  "Biology",
  "Business and Management",
  "Computer Science and Software Engineering",
  "Criminology",
  "Data Science and Data Analytics",
  "Economics",
  "English and Literature",
  "Environmental Science",
  "Film and Media Studies",
  "Geography",
  "Health and Allied Subjects",
  "History",
  "Journalism and Publishing",
  "Languages and TESOL",
  "Law",
  "Marketing and Public Relations (PR)",
  "Mathematics",
  "Nursing",
  "Philosophy and Religion",
  "Politics",
  "Psychology",
  "Social Studies",
  "Sport",
  "Teaching and Education",
  "General"
]

subject_titles.each {|subject_title| Subject.create!(title: subject_title)}

if Rails.env == "development"

  subjects = Subject.all

  users = [
    User.create(email: "aurangzaib.danial@gmail.com", name: "Aurangzaib Khan", password: "123456", account: "public_account", account_selected: true),
    User.create(email: "ali@gmail.com", name: "Ali", password: "123456", account: "public_account", account_selected: true),
    User.create(email: "george@gmail.com", name: "George", password: "123456", account: "private_account", account_selected: true),
    User.create(email: "henry@gmail.com", name: "Henry", password: "123456", account: "private_account", account_selected: true),
  ]


  100.times do
    Question.create(title: Faker::Lorem.question(word_count: 10), questioner: users.sample, body: Faker::Lorem.paragraph_by_chars(number: 500), subject: subjects.sample)
  end

end
