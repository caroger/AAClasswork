require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end
class Users
    attr_accessor :fname, :lname
    def self.all
        data = PlayDBConnection.instance.execute("Select * from users")
        data.map { |data| Users.new(data) }
    end
    def initialize(data)
        @id = data['id']
        @fname = data['fname']
        @lname = data['lname']
    end

    def find_by_id(id)
        

    end

end

