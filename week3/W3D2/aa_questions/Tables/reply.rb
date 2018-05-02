class Reply
  attr_accessor :user_id, :question_id, :reply_id, :body
  attr_reader :id
  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        replies
      WHERE
        id = ?
    SQL
    return nil if found.empty?
    
    Reply.new(found.first)
  end 
  
  def self.find_by_user_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        replies
      WHERE
        user_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| Reply.new(el)}
  end 
  
  def self.find_by_question_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        replies
      WHERE
        question_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| Reply.new(el)}
  end 
  
  def self.find_by_reply_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        replies
      WHERE
        reply_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| Reply.new(el)}
  end 
  
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @reply_id = options['reply_id']
    @body = options['body']
  end 
  
  def create
    if @id
      self.update 
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @question_id, @reply_id, @body)
        INSERT INTO
          replies (user_id, question_id, reply_id, body)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDBConnection.instance.last_insert_row_id
    end 
  end
  
  def update
    unless @id
      self.create
    else 
      QuestionsDBConnection.instance.execute(<<-SQL, @user_id, @question_id, @reply_id, @body, @id)
     UPDATE
       replies
     SET
       user_id = ?, question_id = ?, reply_id = ?, body = ?
     WHERE
       id = ?
     SQL
   end   
  end 
  
  
  def author 
    User.find_by_id(self.user_id)
  end 
  
  def question
    Question.find_by_id(self.question_id)
  end
  
  def parent_reply
    Reply.find_by_id(self.reply_id)
  end 
  
  def child_replies
    Reply.find_by_reply_id(self.id)
  end 
end 