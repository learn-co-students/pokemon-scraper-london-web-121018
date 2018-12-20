



class Pokemon
  attr_accessor :id,:name,:type,:db


  def initialize(id:id,name:name,type:type,db:db,hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    name1 = {}
    db.execute("SELECT * FROM pokemon WHERE id = ?",id) do |row|
      name1 = Pokemon.new(id:id,name:row[1],type:row[2],db:db,hp:60)
    end

    name1
  end
  def alter_hp
    db.execute("ALTER TABLE pokemon ADD COLUMN hp")
    db.execute("UPDATE pokemon SET hp = 59 WHERE id = 1")
    db.execute("UPDATE pokemon SET hp = 0 WHERE id = 2")



  end


end
