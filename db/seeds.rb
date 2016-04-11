# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Governor",
  name: "Jay Inslee",
  klass: "Delegates::WA::Inslee"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Senator",
  name: "Patty Murray",
  klass: "Delegates::WA::Murray"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Senator",
  name: "Maria Cantwell",
  klass: "Delegates::WA::Cantwell"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Representative",
  name: "Rick Larsen",
  klass: "Delegates::WA::Larsen"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Representative",
  name: "Adam Smith",
  klass: "Delegates::WA::Smith"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Representative",
  name: "Derek Kilmer",
  klass: "Delegates::WA::Kilmer"

Delegate.find_or_create_by! \
  state: 'WA',
  position: "Representative",
  name: "Denny Heck",
  klass: "Delegates::WA::Heck"
