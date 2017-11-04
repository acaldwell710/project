require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  it { is_expected.to belong_to(:wiki) }

  it { is_expected.to validate_presence_of(:collaborator) }
end
