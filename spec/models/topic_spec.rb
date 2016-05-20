require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:bookmarks) }
end
