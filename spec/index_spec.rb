require 'rubygems'

require File.dirname(__FILE__) + '/spec_helper'
require BASE_PATH + '/lib/dictionary'
require BASE_PATH + '/lib/jmdict'
require BASE_PATH + '/lib/index'

require 'fileutils'

module IndexSpecHelper
end

describe DictIndex do
  include IndexSpecHelper
  
  before do
    @index = DictIndex.new(INDEX_PATH, JMDICT_PATH)
  end
  
  # Searching
  it "is searchable" do
    @index.should respond_to(:search)
  end
  
  # Building
  it "is buildable" do
    @index.should respond_to(:build) # and return an index
  end
  it "is rebuildable" do
    @index.should respond_to(:rebuild)
  end
  it "tells whether it's built or not" do
    @index.should respond_to(:built?)
  end
  
  # Destroying
  it "is destroyable" do
    @index.should respond_to(:destroy)
  end
  
  it "raises an error if an invalid dictionary path is specified" do
    lambda { DictIndex.new(INDEX_PATH, 'bad_dictionary_path') }.should raise_error
  end
end

describe DictIndex, "after initialization" do
  it "the path should be set" do
    @index = DictIndex.new(INDEX_PATH)
    @index.path.should_not be(nil)
    @index.path.should_not be('')
  end
end

describe DictIndex, "when building," do
  it "it is created on the file system" do
    @index = DictIndex.new(INDEX_PATH, JMDICT_PATH)
    @index.build
    File.exists?(INDEX_PATH).should == true
  end
  
  it "its directory on the file system shouldn't be empty" do
    @index = DictIndex.new(INDEX_PATH, JMDICT_PATH,
                           false) #no lazy loading
    @index.build
    # .
    # ..
    # ^-------- an empty directory has only these 2 entries
    Dir.entries(INDEX_PATH).should have_at_least(3).things
  end
  
  it "loads from a dictionary file"
end

describe DictIndex, "when rebuilding" do
  include FileUtils
  
  it "raises an error if it doesn't already exist" do
    rm_rf(INDEX_PATH)
    File.exists?(INDEX_PATH).should == false
    lambda {
      DictIndex.new(INDEX_PATH, JMDICT_PATH).rebuild
      }.should raise_error
  end
end