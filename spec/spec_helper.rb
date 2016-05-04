$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "active_sample"

ActiveRecord::Base.establish_connection adapter: "postgresql", database: "test_active_sample"

ActiveRecord::Migration.create_table :users, force: true do |t|
end

class User < ActiveRecord::Base
end
