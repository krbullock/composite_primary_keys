class Version < ActiveRecord::Base
  set_primary_keys :model_id, :model_type, :version
  belongs_to :model, :polymorphic => true,
    :foreign_key => [:model_id, :version]
end
