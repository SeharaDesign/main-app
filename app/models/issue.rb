class Issue < ActiveRecord::Base

  validates :title, :body, :priority, presence: true

  def completed?
    self.complete ? "Yes" : "No"
  end
end
