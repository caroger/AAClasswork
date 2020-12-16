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
    # attr_accessor :fname, :lname
    def self.all
        data = PlayDBConnection.instance.execute("Select * from users")
        data
    end

    def self.find_by_id(idx)
        id = PlayDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM users
            WHERE id = ?
        SQL
        return nil unless id.length > 0

        id

        # Users.new(id.first)
        
    end

    # def initialize(data)
    #     @id = data['id']
    #     @fname = data['fname']
    #     @lname = data['lname']
    # end


end

