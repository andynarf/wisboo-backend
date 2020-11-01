require 'rails_helper'

RSpec.describe Comment, type: :model do
    # ensure an item record belongs to a single todo record
    it { should belong_to(:video) }
    # Validation test
    # ensure column name is present before saving
    it { should validate_presence_of(:text) }
end
