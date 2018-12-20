require 'pry'

class Pokemon
  attr_reader :id, :name, :type, :db
  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db: 'pokemon.db')
    @id = id
    @name = name
    @type = type
    @db = db
    self.class.all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(id: arr[0], name: arr[1], type: arr[2])
  end
end
