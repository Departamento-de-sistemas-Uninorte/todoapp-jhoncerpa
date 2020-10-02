require 'rails_helper'

RSpec.describe TasksController, '#create' do
  context "When a task is created with invalid params" do
    it "re-render the task new for" do
      expect { Task.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end