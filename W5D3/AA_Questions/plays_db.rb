require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end
class User
    # attr_accessor :fname, :lname
    def self.all
        data = QuestionDBConnection.instance.execute("Select * from users")
        data.map {|dt| User.new(dt)}
    end

    def self.find_by_id(idx)
        id = QuestionDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM users
            WHERE id = ?
        SQL
        return nil unless id.length > 0
        User.new(id.first)
        
    end

    def initialize(data)
        @id = data['id']
        @fname = data['fname']
        @lname = data['lname']
    end

end
class Question
    # attr_accessor :title, :body, 
    def self.all
        data = QuestionDBConnection.instance.execute("Select * from questions")
        data.map {|dt| Question.new(dt)}
    end

    def self.find_by_id(idx)
        id = QuestionDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL
        return nil unless id.length > 0
        Question.new(id.first)
    end

    def initialize(data)
        @id = data['id']
        @title = data['title']
        @body = data['body']
        @user_id = data['user_id']
    end
    def self.find_by_author_id(author_id)
        id = QuestionDBConnection.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions
            WHERE user_id = ?
        SQL
        return nil unless id.length > 0
        Question.new(id.first)
    end
    def followers
        QuestionFollows.followers_for_question_id(@id)
    end

end
class QuestionFollows
    # attr_accessor :fname, :lname
    def self.all
        data = QuestionDBConnection.instance.execute("Select * from questions_follows")
        data.map {|dt| QuestionFollows.new(dt)}
    end

    def self.find_by_id(idx)
        id = QuestionDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM questions_follows
            WHERE id = ?
        SQL
        return nil unless id.length > 0
        QuestionFollows.new(id.first)
    end

    def self.followers_for_question_id(question_id)
        followers = QuestionDBConnection.instance.execute(<<-SQL, question_id)
            SELECT users.*
            FROM users
            JOIN questions_follows ON users.id = questions_follows.user_id
            JOIN questions ON questions_follows.question_id = questions.id
            WHERE questions.id = ? 
        SQL
        return nil unless followers.length > 0

        followers.map { |follower| User.new(follower)}
    end

    def initialize(data)
        @id = data['id']
        @user_id = data['user_id']
        @question_id = data['question_id']
    end

end
class Reply
    # attr_accessor :fname, :lname
    def self.all
        data = QuestionDBConnection.instance.execute("Select * from replies")
        data.map {|dt| Reply.new(dt)}
    end

    def self.find_by_id(idx)
        id = QuestionDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM replies
            WHERE id = ?
        SQL
        return nil unless id.length > 0
        Reply.new(id.first)
        
    end

    def initialize(data)
        @id = data['id']
        @body = data['body']
        @parent_id = data['parent_id']
        @user_id = data['user_id']
        @question_id = data['question_id']
    end

end
class QuestionLike
    # attr_accessor :fname, :lname
    def self.all
        data = QuestionDBConnection.instance.execute("Select * from question_likes")
        data.map {|dt| QuestionLike.new(dt)}
    end

    def self.find_by_id(idx)
        id = QuestionDBConnection.instance.execute(<<-SQL, idx)
            SELECT *
            FROM question_likes
            WHERE id = ?
        SQL
        return nil unless id.length > 0
        QuestionLike.new(id.first)
        
    end

    def initialize(data)
        @id = data['id']
        @user_id = data['user_id']
        @question_id = data['question_id']
    end

end

