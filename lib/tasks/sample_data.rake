namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_statuses
  end

  def make_users
    admin = User.create!(first_name: "Hidetaka",
                         last_name: "Miyazaki",
                         profile_name: "Souls",
                         email: "dsouls@fs.com",
                         password: "foobar",
                         password_confirmation: "foobar")

    admin = User.create!(first_name: "Joss",
                         last_name: "Whedon",
                         profile_name: "Firefly",
                         email: "jwhedon@disney.com",
                         password: "avengers",
                         password_confirmation: "avengers")
  end

  def make_statuses
    users = User.all
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.statuses.create(content: content)  }
    end
  end
end