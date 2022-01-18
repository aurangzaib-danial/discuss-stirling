# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
  User.create(email: "aurangzaib.danial@gmail.com", name: "Aurangzaib Khan", password: "123456", account: "public_account", account_selected: true),
  User.create(email: "ali@gmail.com", name: "Ali", password: "123456", account: "public_account", account_selected: true)
]

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

10.times do |index|
  q = Question.new
  q.title = "This is a dummy title for this question. The question number is #{index + 1}"
  q.questioner = User.first
  q.body = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  q.subject = Subject.first
  q.save!
end

first_question = Question.first
5.times do |index|
  first_question.comments.create!(body: "This is comment #{index + 1}", commentator: users.sample)
end
