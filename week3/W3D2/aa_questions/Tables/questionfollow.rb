class QuestionFollow 
  attr_accessor :user_id, :question_id
  
  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        question_follows
      WHERE
        id = ?
    SQL
    return nil if found.empty?
    
    QuestionFollow.new(found.first)
  end 
  
  def self.followers_for_question_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        users.id, fname, lname
      FROM 
        question_follows
      JOIN 
        users ON question_follows.user_id = users.id
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        question_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| User.new(el)}
  end
  
  def self.followed_questions_for_user_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        questions.id, questions.title, questions.body, questions.user_id
      FROM 
        question_follows
      JOIN 
        users ON question_follows.user_id = users.id
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| Question.new(el)}
  end
  
  def self.most_followed_questions(n)
    found = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.id, questions.title, questions.body, questions.user_id
      FROM 
        question_follows
      JOIN 
        users ON question_follows.user_id = users.id
      JOIN
        questions ON questions.id = question_follows.question_id
      GROUP BY
        question_id
      ORDER BY 
        COUNT(*) DESC
      LIMIT ? 
    SQL
      
      return nil if found.empty?
      found.map {|el| Question.new(el)}
  end 
   
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end 
end

 

