require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @cols ||= DBConnection.execute2(<<-SQL)
    SELECT 
      *
    FROM 
      #{self.table_name}
    
    SQL
    
    @cols.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method col do
        attributes[col]
      end
      
      define_method("#{col}=") do |value|
        attributes[col] = value 
      end 
    end
    
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ? @table_name : "#{self}".tableize
  end

  def self.all
    rows = DBConnection.execute(<<-SQL)
    SELECT 
      #{self.table_name}.*
    FROM 
      #{self.table_name}
        
    SQL
    
    self.parse_all(rows)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash.map {|k,v| [k.to_sym,v]}.to_h )
    end  
  end
  
  

  def self.find(id)
    self.all.each do |obj|
      return obj if obj.id == id
    end
    nil
  end

  def initialize(params = {})
    
    params.each do |col,v|
      raise "unknown attribute '#{col}'" unless self.class.columns.include?(col)
      self.send("#{col}=",v)
    end
    
  end

  def attributes
    @attributes ||= Hash.new { |hash, key| hash[key] = [] }
  end

  def attribute_values
    
  end

  def insert
    col_names = self.class.columns.join(',')
    question_marks = (["?"] * self.class.columns.length - 1).join(',')
    rows = DBConnection.execute(<<-SQL, *self.attributes.values)
    INSERT INTO
      #{self.table_name} (#{col_names})
    VALUES
      (#{question_marks})
        
    SQL
    
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
