#!/usr/bin/env rspec
require 'spec_helper'

describe 'Json2Graphite' do

  let(:time) do
    1000000001
  end

  let(:hash) do
    YAML.load_file(fixture('munin_hash.yaml'))
  end

  let(:array) do
    YAML.load_file(fixture('graphite_array_strings.yaml'))
  end

  describe 'dump' do
    it 'should output an array of graphite dot notated strings' do
      Json2Graphite.dump(hash, time).sort.should == array.sort
    end
  end

  describe 'aliased method to_graphite' do
    it 'should output an array of graphite dot notated strings' do
      Json2Graphite.to_graphite(hash, time).sort.should == array.sort
    end
  end
end
