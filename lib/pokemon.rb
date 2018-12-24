require 'pry'

class Pokemon

  attr_reader :id, :type, :name, :db

  @@all = []

  def initialize(id:, name:, type:, db: 'pokemon.db')
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?" ,id)[0]
    Pokemon.new(id: arr[0], name: arr[1], type: arr[2])
  end

end
