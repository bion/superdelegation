class DelegateMessage < ActiveRecord::Base
  belongs_to :message
  belongs_to :delegate
end
