require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:bookmarks) }
  it { should validate_length_of(:title).is_at_least(3).is_at_most(20) }
end
