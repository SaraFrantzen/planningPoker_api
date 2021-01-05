require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have a valid Factory' do
    expect(create(:comment)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :comment }
    it { is_expected.to have_db_column :user_name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :comment }
    it { is_expected.to validate_presence_of :user_name }
  end
end
