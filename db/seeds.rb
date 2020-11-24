# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    Activity.create(
      title: 'soccer',
      description: 'We are a team of dedicated professionals offering children from 3 years-old the opportunity to discover and play soccer in a convenient environement.',
      price: 300,
      rating: 4
    )

    Activity.create(
      title: 'tennis',
      description: 'Tennis is a very good sport for children, even from 4 years-old. It helps developping motricity and senses, while giving children a taste of performance and socialization',
      price: 250,
      rating: 3
    )

    Activity.create(
      title: 'dance',
      description: 'Amalya brings dance to children, actually a lot of different dances! Come try and fin a nice way for your children to discover music, its own body and creative soul!',
      price: 200,
      rating: 5
    )