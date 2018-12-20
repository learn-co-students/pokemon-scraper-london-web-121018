require 'pry'
class Pokemon
    
    attr_reader :id , :name, :type, :db


    def initialize(id: , name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    #binding.pry

    end

    def self.save(name, type, db_connection)
        db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db_connection)
        retrieved = 0
        retrieved = db_connection.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
        createdpk = Pokemon.new(id: retrieved[0],name: retrieved[1],type: retrieved[2],db: db_connection)
        createdpk
        #binding.pry
    end
end
