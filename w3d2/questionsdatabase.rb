require 'singleton'
require 'sqlite3'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class SuperClass
  def self.find_by_id(id_num,class_val)
    super_hash = {Question=>"questions",User=>'users',Reply =>"replies"}
    table_name = super_hash[class_val]
    output = QuestionsDatabase.instance.execute(<<-SQL,id_num)
      SELECT *
      FROM #{table_name}
      WHERE id = ?
    SQL
    class_val.new(output.first)
  end

  def self.all
    class_val = self
    super_hash = {Question=>"questions",User=>'users',Reply =>"replies"}
    table_name = super_hash[class_val]
    output = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL
    output.map {|x| class_val.new(x)}

  end

end

class Question < SuperClass
  attr_accessor :title, :body, :user_id, :id
  def self.find_by_id(id_num)
    question = QuestionsDatabase.instance.execute(<<-SQL, id_num)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE user_id = ?
    SQL
    output = []
    question.each do |x|
      output << self.new(x)
    end
    output
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL,@title,@body, @user_id)
      INSERT INTO questions(title, body, user_id)
      VALUES (?,?,?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL,@title,@body,@user_id,@id)
      UPDATE questions
      SET title = ?, body = ?, user_id = ?
      WHERE id = ?
      SQL
    end
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    author = User.find_by_id(@user_id)
  end

  def replies
    replies = Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

end




class User < SuperClass
  attr_accessor :fname, :lname, :id

  def self.find_by_id(id)
    super(id,self)
  end
  # def self.find_by_id(id_num)
  #   user = QuestionsDatabase.instance.execute(<<-SQL, id_num)
  #     SELECT *
  #     FROM users
  #     WHERE id = ?
  #   SQL
  #   User.new(user.first)
  # end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL,@fname,@lname)
      INSERT INTO users(fname,lname)
      VALUES (?,?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL,@fname,@lname,@id)
      UPDATE users
      SET fname = ?,lname = ?
      WHERE id = ?
      SQL
    end
  end


  def self.find_by_name(fname,lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname,lname)
      SELECT *
      FROM users
      WHERE fname = ?, lname = ?
    SQL
    output = []
    user.each do |x|
      output << self.new(x)
    end
    output
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    # @is_instructor
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end

  def average_karma
    total_questions = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT COUNT(DISTINCT questions.id) AS total_questions,
      FROM questions
        LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id
      WHERE questions.user_id = ?
    SQL

    total_likes = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT COUNT(*) AS total_likes
      FROM questions
        LEFT OUTER JOIN question_likes ON questions.id = question_likes.question_id
      WHERE question_likes.question_id IS NOT NULL AND questions.user_id = ?
    SQL

    puts "total likes #{total_likes.first["total_likes"].to_f}"
    puts "total questions #{ total_questions.first["total_questions"].to_f}"
    total_likes.first["total_likes"].to_f/ total_questions.first["total_questions"].to_f

  end
end

class Reply < SuperClass
  attr_accessor :id, :question_id, :user_id, :reply_id, :body
  def self.find_by_id(id_num)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id_num)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL
    output = []
    reply.each do |x|
      output << Reply.new(x)
    end
    output
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE quetion_id = ?
    SQL
    output = []
    reply.each do |x|
      output << Reply.new(x)
    end
    output
  end

  def save
    if @id.nil?
      QuestionsDatabase.instance.execute(<<-SQL,@question_id, @user_id, @reply_id, @body)
      INSERT INTO replies(question_id, user_id, reply_id, body)
      VALUES (?,?,?,?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL,@question_id, @user_id, @reply_id, @body,@id)
      UPDATE replies
      SET question_id = ?, user_id = ?, reply_id = ?, body = ?
      WHERE id = ?
      SQL
    end
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply_id = options['reply_id']
    @body = options['body']
  end

  def author
    User.find_by_author_id(@user_id)
  end

  def question
    Question.find_by_question_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@reply_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT *
      FROM replies
      WHERE reply_id = ?
    SQL
    output = []
    reply.each do |x|
      output << Reply.new(x)
    end
    output
  end

end

class QuestionFollow
  attr_accessor :id, :question_id, :user_id
  def self.find_by_id(id_num)
    questionfollows = QuestionsDatabase.instance.execute(<<-SQL,id_num)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    QuestionFollow.new(questionfollows.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.followers_for_question_id(question_id)
    questionfollows = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT users.*
      FROM question_follower
      JOIN users ON question_follower.user_id = users.id
      WHERE question_id = ?
    SQL
    questionfollows.map{|x| User.new(x)}
  end

  def self.followed_questions_for_user_id(user_id)
    questionfollows = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT questions.*
      FROM question_follower
      JOIN users ON question_follower.user_id = users.id
      WHERE user_id = ?
    SQL
    questionfollows.map{|x| User.new(x)}
  end

  def self.most_followed_questions(n)
    questionfollows = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT COUNT(user_id), question_id
      FROM question_follower
      JOIN questions ON questions.id = question_follower.question_id
      GROUP BY question_id
      ORDER BY COUNT(user_id) DESC
      LIMIT ?
    SQL
    questionfollows.map {|x| Question.new(x)}
  end


end

class QuestionLikes
  attr_accessor :id,:question_id,:user_id
  def self.find_by_id(id_num)
    questionlike = QuestionsDatabase.instance.execute(<<-SQL, id_num)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    QuestionLikes.new(questionlike.first)
  end

  def self.likers_for_question_id(question_id)
    questionlike = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.*
      FROM users
      JOIN question_likes ON question_likes.user_id = users.id
      WHERE question_likes.question_id = ?
    SQL
    questionlike.map {|x| User.new(x)}
  end

  def self.num_likes_for_question_id(question_id)
    questionlike = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(*)
      FROM question_likes
      WHERE question_id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    questionlike = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.*
      FROM questions
      JOIN question_likes ON question_likes.question_id = questions.id
      WHERE question_likes.user_id = ?
    SQL
    questionlike.map {|x| Question.new(x)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def most_liked_questions(n)
    questionlikes = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT COUNT(user_id), question_id
      FROM question_likes
      JOIN questions ON questions.id = question_likes.question_id
      GROUP BY question_id
      ORDER BY COUNT(user_id) DESC
      LIMIT ?
    SQL
    questionlikes.map {|x| Question.new(x)}
  end

end
