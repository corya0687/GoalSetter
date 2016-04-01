require_relative './config/enviorment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use GoalController
use PlanController
use UserController
use Rack::MethodOverride
run ApplicationController
