require 'pry'
require 'Rspec'
require_relative '../lib/data_stream_decode.rb'

describe DataStreamDecoder do
  before(:each) do
    @decoder = DataStreamDecoder.new
  end
  it 'exists' do    

    expect(@decoder).to be_an_instance_of(DataStreamDecoder)
  end

  it 'can read a signal' do
    @decoder.read_signal('./tuning_trouble/data_stream_buffer.txt')
    expect(@decoder.stream).to be_an(Array)
    expect(@decoder.stream.empty?).to eq(false)
  end
end