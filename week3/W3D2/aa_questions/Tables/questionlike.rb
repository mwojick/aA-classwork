class QuestionLike
  attr_accessor :user_id, :question_id
  
  def self.find_by_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions_likes
      WHERE
        id = ?
    SQL
    return nil if found.empty?
    
    QuestionLike.new(found.first)
  end 
  
  
  def self.likers_for_question_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        users.id, fname, lname
      FROM 
        question_likes
      JOIN 
        users ON question_likes.user_id = users.id
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        question_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| User.new(el)}
  end
  
  def self.num_likes_for_question_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        COUNT(*)
      FROM 
        question_likes
      JOIN 
        users ON question_likes.user_id = users.id
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        question_id = ?;
    SQL
    return nil if found.empty?
    found.first.values.first
  end
  
  def self.liked_questions_for_user_id(id)
    found = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT 
        questions.id, questions.title, questions.body, questions.user_id
      FROM 
        question_likes
      JOIN 
        users ON question_likes.user_id = users.id
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    return nil if found.empty?
    
    found.map {|el| Question.new(el)}
  
  end 
  
  def self.most_liked_questions(n)
    found = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        questions.id, questions.title, questions.body, questions.user_id
      FROM 
        question_likes
      JOIN 
        users ON question_likes.user_id = users.id
      JOIN
        questions ON questions.id = question_likes.question_id
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