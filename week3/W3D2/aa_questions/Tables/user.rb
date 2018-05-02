class User
  attr_accessor :fname, :lname
  attr_reader :id
  
  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        users
      WHERE
        id = ?;
    SQL
    return nil if found.empty?
    
    User.new(found.first)
  end 
  
  def self.find_by_name(fname, lname)
    found = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM 
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil if found.empty?
    
    User.new(found.first)
  end 
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end 
  
  def create
    if @id
      self.update
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDBConnection.instance.last_insert_row_id
    end 
  end
  
  def update
    unless @id
      self.create
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
     UPDATE
       users
     SET
       fname = ?, lname = ?
     WHERE
       id = ?
     SQL
   end   
  end 
  
  def authored_questions
    Question.find_by_author_id(self.id)
  end 
  
  def authored_replies
    Reply.find_by_user_id(self.id)
  end 
  
  def followed_questions 
    QuestionFollow.followed_questions_for_user_id(self.id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end 
  
  def average_karma
    questions = self.authored_questions
    count = 0
    questions.each { |q| count += QuestionLike.num_likes_for_question_id(q.id) }
    count.to_f / questions.length
  end
  
end 