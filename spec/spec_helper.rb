$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "active_sample"

ActiveRecord::Base.establish_connection adapter: "postgresql", database: "test_active_sample"

ActiveRecord::Migration.create_table :users, force: true do |t|
end

ActiveRecord::Migration.create_table :primary_key_not_id_users, force: true, primary_key: "user_id" do |t|
end

class User < ActiveRecord::Base
end

class PrimaryKeyNotIDUser < ActiveRecord::Base
  self.primary_key = "user_id"
end
