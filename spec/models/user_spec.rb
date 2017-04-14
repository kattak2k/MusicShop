# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
=begin #std fixture replacing with factory girls below# 
  fixtures :users

  it 'is valid' do
    expect(users(:maurya)).to be_valid
  end  
=end  
  subject {build(:user)}
  
  it 'is valid' do
    expect(subject).to be_valid
  end  

  it 'is not valid without a name' do
    subject.name = ' '
    expect(subject).not_to be_valid
  end  

  it 'is not valid without a email' do
    subject.email = ' '
    expect(subject).not_to be_valid
  end

  it 'is not valid without a valid email' do
    subject.email = '123@'
    expect(subject).not_to be_valid
  end

 it 'converts user to downcase' do
    user = create(:user, upcased: true)
    expect(user.email).to eq(user.email.downcase)
  end
end
