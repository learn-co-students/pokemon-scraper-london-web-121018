class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name:, id:, type:, db: 'pokemon.db' )
      @name = name
      @id = id
      @type = type
      @db = db
      @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("insert into pokemon (name, type) values (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute('select * from pokemon where id = (?)', id).flatten
    Pokemon.new(name: pokemon[1], id: pokemon[0], type: pokemon[2])
  end



end
