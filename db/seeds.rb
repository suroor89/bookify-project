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


user = User.create!(firstname: 'Quoc', lastname: 'Nguyen', email: 'quoc@example.com', password: 'password', password_confirmation: 'password')


user.books.create!([{
  title: "Hyperion",
  author: "Dan Simmons",
  description: "Probably my favorite science fiction book (and series) I've ever
  read. Hyperion is written in a style similar to The Canterbury Tales, in which
  a series of stories are told by the main characters. Each story is a gem in
  itself, but alude to the larger storyline. The scope of the story is ambitious
  - spanning time, planets religion and love.",
  amazon_id: "0553283685",
  categories: [fiction, fantasy]
},
{
  title: "Jony Ive: The Genius Behind Apple's Greatest Products",
  author: "Leander Kahney",
  description: "Even though I respect Ive, I felt this biography only hit skin
  deep. It went over all the major events in his life, his passion for design,
  awards he achieved -- but that's really it. I dont't feel I know him anymore
  than before reading this.",
  amazon_id: "159184617X",
  categories: [education, technology]
},
{
  title: "Mindstorms",
  author: "Seymour A. Papert",
  description: "Although this book focuses on the cognitive advantages to having
  children use technology from an early age, it is also an in depth look at how
  people can learn for themseves. As someone who was often distracted and bored
  at times during school, Mindstorms highlights some of the reasoning behind
  that feeling and what we can do as teachers to help minimize it.",
  amazon_id: "0465046746",
  categories: [education]
}])
