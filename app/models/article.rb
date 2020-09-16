class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  after_validation :check_validation
  validates :title, presence: true, length: { minimum: 5 }
  private

  def check_validation
    puts 'Workasdadsasdasdaing'
  end
end
