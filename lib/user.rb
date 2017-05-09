class User <ActiveRecord::Base
  has_many(:surveys)
  belongs_to(:survey)
  validates(:name, {:presence => true})

  scope(:not_done, -> do
    where({:done => false})
  end)
end
