class Answer < ActiveRecord::Base  
  belongs_to :question

  def url
    # url = 'http://imesto.heroku.com/surveys/vote/'+self.id.to_s
    # url = 'http://localhost:3000/surveys/vote/'+self.id.to_s
    url = '/surveys/vote/'+self.id.to_s
    url
  end
  
  def vote
    self.points += 1
    self.save
  end
end