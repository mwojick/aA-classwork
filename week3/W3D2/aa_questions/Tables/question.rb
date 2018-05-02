class Question
  attr_accessor :title, :body, :user_id
  attr_reader :id
  
  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions
      WHERE
        id = ?
    SQL
    return nil if found.empty?
    
    Question.new(found.first)
  end 
  
  def self.find_by_author_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions
      WHERE
        user_id = ?
    SQL
    return nil if found.empty?
    
    found.map  {|el| Question.new(el)}
  end
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end 
  
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end 
  
  def create
    if @id
      self.update
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @user_id)
        INSERT INTO
          questions (title, body, user_id)
        VALUES
          (?, ?, ?)
      SQL
      @id = QuestionsDBConnection.instance.last_insert_row_id
    end
  end
  
  def update
    unless @id
      self.create
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @user_id, @id)
     UPDATE
       questions
     SET
       title = ?, body = ?, user_id = ?
     WHERE
       id = ?
     SQL
   end   
  end 
  
  def likers
    QuestionLike.likers_for_question_id(self.id)
  end 
  
  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end 
  
  def author
    User.find_by_id(self.user_id)
  end
  
  def replies
    Reply.find_by_question_id(self.id)
  end 
  
  def followers
    QuestionFollow.followers_for_question_id(self.id)
  end
  
end 