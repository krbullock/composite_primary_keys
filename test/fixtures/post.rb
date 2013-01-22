class Post < ActiveRecord::Base
  set_primary_keys :id, :version
  has_many :versions, :as => :model,
    :foreign_key => [:model_id, :version]
  has_one :first_version, :as => :model, :class_name => 'Version',
    :foreign_key => [:model_id, :version]
end