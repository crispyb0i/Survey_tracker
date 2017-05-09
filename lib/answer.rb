class Answer < ActiveRecord::Base
  belongs_to(:question)
  validates(:name, {:presence => true})
  before_save(:upcase_name)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
