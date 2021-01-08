require 'rails_helper'

RSpec.describe Poll, type: :model do

  it "should have a valid Factory" do
    expect(create(:poll)).to be_valid
  end

  describe "Database table" do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :tasks }
    it { is_expected.to have_db_column :points }
    it { is_expected.to have_db_column :team }
    it { is_expected.to have_db_column :votes }
    it { is_expected.to have_db_column :state }
    it { is_expected.to have_db_column :result }
    it { is_expected.to have_db_column :category }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to have_db_column :tasks }
    it { is_expected.to have_db_column :points }
    it { is_expected.to have_db_column :category }
  end
end
