Book.delete_all
Category.delete_all
User.delete_all

fiction = Category.create!(name: 'Fiction')
technology = Category.create!(name: 'Technology')
education = Category.create!(name: 'Education')
fantasy = Category.create!(name: 'Fantasy')
entertainment = Category.create!(name: 'Entertainment')
politics = Category.create!(name: 'Politics')
science = Category.create!(name: 'Science')
non-fiction = Category.create!(name: 'Non-Fiction')


user = User.create!(firstname: 'Quoc', lastname: 'Nguyen', email: 'quoc@example.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(firstname: 'Jay', lastname: 'Nguyen', email: 'jay@example.com', password: 'password', password_confirmation: 'password')

10.times do |n|
  firstname = Faker::Name.first_name
  User.create!(firstname: firstname, lastname: Faker::Name.last_name, email: "#{firstname}@example.com", password: 'password', password_confirmation: 'password')
end

user.books.create!([{
  title: "Hyperion",
  author: "Dan Simmons",
  description: "On the world called Hyperion, beyond the law of the Hegemony of
  Man, there waits the creature called the Shrike.  There are those who worship
  it.  There are those who fear it.  And there are those who have vowed to
  destroy it.  In the Valley of the Time Tombs, where huge, brooding structures
  move backward through time, the Shrike waits for them all.",
  amazon_id: "0553283685",
  categories: [fiction, fantasy]
},
{
  title: "Jony Ive: The Genius Behind Apple's Greatest Products",
  author: "Leander Kahney",
  description: "In 1997, Steve Jobs returned to Apple as CEO with the unenviable
  task of turning around the company he had founded. One night, Jobs discovered
  a scruffy British designer toiling away at Apple’s corporate headquarters,
  surrounded by hundreds of sketches and prototypes. It was then that Jobs
  realized he had found a talent who could reverse the company’s long decline.
  That young designer was Jony Ive. ",
  amazon_id: "159184617X",
  categories: [education, technology]
},
{
  title: "Mindstorms",
  author: "Seymour A. Papert",
  description: "Mindstorms has two central themes: that children can learn to
  use computers in a masterful way and that learning to use computers can change
  the way they learn everything else. Even outside the classroom, Papert had a
  vision that the computer could be used just as casually and as personally for
  a diversity of purposes throughout a person’s entire life. Seymour Papert
  makes the point that in classrooms saturated with technology there is actually
  more socialization and that the technology often contributes to greater
  interaction among students and among students and instructors.",
  amazon_id: "0465046746",
  categories: [education]
}])
