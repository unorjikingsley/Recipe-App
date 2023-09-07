# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
I18n.reload!

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    puts 'Recreating the database...'

    # recreate the database
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke

    puts 'Creating sample users...'

    test = User.create!(
      name: 'test',
      email: 'testuser@test.com',
      password: 'password',
      confirmed_at: Time.now
    )

    5.times do
      Food.create!(
        name: Faker::Food.vegetables,
        measurement_unit: 'kg',
        price: Faker::Number.non_zero_digit,
        quantity: Faker::Number.non_zero_digit,
        user_id: test.id
      )
    end

    3.times do
      Recipe.create!(
        name: Faker::Food.dish,
        preparation_time: Faker::Number.number(digits: 2),
        cooking_time: Faker::Number.number(digits: 2),
        description: Faker::Lorem.sentence,
        public: Faker::Boolean.boolean,
        user_id: test.id
      )
    end

    3.times do
      RecipeFood.create!(
        quantity: Faker::Number.non_zero_digit,
        food_id: Food.all.sample.id,
        recipe_id: Recipe.all.sample.id
      )
    end

    # create sample users
    5.times do
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password'
      )

      puts 'Creating sample foods...'

      # create sample foods
      5.times do
        Food.create!(
          name: Faker::Food.vegetables,
          measurement_unit: 'kg',
          price: Faker::Number.non_zero_digit,
          quantity: Faker::Number.non_zero_digit,
          user_id: user.id
        )
      end

      puts 'Creating sample recipes...'

      # create sample recipes
      3.times do
        Recipe.create!(
          name: Faker::Food.dish,
          preparation_time: Faker::Number.number(digits: 2),
          cooking_time: Faker::Number.number(digits: 2),
          description: Faker::Lorem.paragraph,
          public: Faker::Boolean.boolean,
          user_id: user.id
        )
      end

      puts 'Creating sample recipe foods...'

      # create sample recipe foods
      3.times do
        RecipeFood.create!(
          quantity: Faker::Number.non_zero_digit,
          recipe_id: Recipe.all.sample.id,
          food_id: Food.all.sample.id
        )
      end
    end
  end
end
