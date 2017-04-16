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

RSpec.describe User do #, type: :model do
=begin #std fixture replacing with factory girls below# 
  fixtures :users

  it 'is valid' do
    expect(users(:maurya)).to be_valid
  end  
=end  

  context "Validations" do  # wrapping the tests into groups using the context
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
  end  

  context "Callbacks" do
   #subject {create(:user, upcased: true)}   
   subject {build_stubbed(:user, upcased: true)}
    it 'converts user to downcase' do
      #user = create(:user, upcased: true)
      #expect(user.email).to eq(user.email.downcase)
      expect(subject.email).to eq(subject.email.downcase)
    end
  end 

#=begin
describe "#add_to_cart!" do
    let(:album) {create(:album)}
    let(:user) {create(:user)}
    it "is expected to have quantity 1 after adding one item" do
      user.add_to_cart! album
      expect(user.cart_items.size).to eq(1)
    end
    it "is expected to have quantity 2 after adding two items" do
      2.times { user.add_to_cart! album }
      expect(user.cart_items.size).to eq(1)
      expect(user.cart_items.first.quantity).to eq(2)
    end
  end

  describe "#remove_from_cart!" do
    let(:album) {create(:album)}
    let(:user) {create(:user)}
    let!(:cart_item) {create(:cart_item, quantity: 2, user: user, album: album)}
    it "is expected to have quantity 1 after removing one item" do
      user.remove_from_cart! album
      expect(user.cart_items.find(cart_item.id).quantity).to eq(1)
    end
    it "is expected to have cart item destroyed after removing all items" do
      cart_item.quantity.times { user.remove_from_cart! album }
      expect(user.cart_items).not_to include(cart_item)
    end
  end
#=end

end
