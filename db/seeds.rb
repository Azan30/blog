77.times do
  title = Faker::Name.name
  text = Faker::Gender.binary_type
  Article.create(title: title, text: text)
end
