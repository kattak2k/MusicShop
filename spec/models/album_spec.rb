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
 fixtures :albums

  subject {Album.new}
  it "is not valid without a valid class" do
    #album = Album.new
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
    expect(albums(:the_game)).to be_valid  #fixture included
  end
end
