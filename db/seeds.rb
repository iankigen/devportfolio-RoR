# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create(
    title: "Topic #{topic}"
  )
end

10.times do |blog|
  Blog.create!(
    title: "Blog Post #{blog}",
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
laboris nisi ut aliquip ex ea commodo onsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
laborum.',
    topic_id: Topic.last.id
  )
end
skills = %w[Python Django Flask Rails Javascript]
5.times do |skill|
  Skill.create(
    title: skills[skill],
    percent_utilized: 20
  )
end

6.times do |portfolio|
  Portfolio.create(
    title: "Portfolio #{portfolio}",
    subtitle: 'Ruby on Rails',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
laboris nisi ut aliquip ex ea commodo onsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
laborum.',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/356x280'
  )
end

3.times do |portfolio|
  Portfolio.create(
    title: "Portfolio #{portfolio}",
    subtitle: 'Angular',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et
dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
laboris nisi ut aliquip ex ea commodo onsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
laborum.',
    main_image: 'https://via.placeholder.com/600x400',
    thumb_image: 'https://via.placeholder.com/356x280'
  )
end

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts 'Database seeded successfully'
