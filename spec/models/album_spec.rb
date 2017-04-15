# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Album do
  subject {build(:album)}

    context "scope" do
      # .popular is call method called popular
      describe ".popular" do
        # ! bang will create a record before running let method
        #let!(:popular_album) {create(:album, popular: true)} 
        #Replaced with traits in factory
        let!(:popular_album) {create(:popular_album)}
        let!(:ordinary_album) {create(:album)}
        
        specify { expect(described_class.popular.size).to eq(1)}
      end
    end  

  context "Validations" do  
  #fixtures :albums  #replaed with factory girl   
    #subject {Album.new}
    it "is not valid without a title" do
      subject.title = ' '
      expect(subject).not_to be_valid
    end
    it "is not valid with a title longer than 100 characters" do
      #album = Album.new(title: 'a' * 101 )
      subject.title = 'a' * 101
      expect(subject).not_to be_valid
    end
    it "is valid with proper data" do 
      #subject.title = 'a' * 50
      #expect(subject).to be_valid  
      #expect(albums(:the_game)).to be_valid  #fixture included #replaced with factory-girl
      expect(subject).to be_valid
    end
  end
end

