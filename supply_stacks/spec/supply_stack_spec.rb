require 'pry'
require 'Rspec'
require_relative '../lib/supply_stack.rb'

describe SupplyStack do
  before(:each) do
    test_array = [["Z", "N"], ["M", "C", "D"], ["P"]]
    chall_array = [%w(H C R), %w(B J H L S F), %w(R M D H J T Q), %w(S G R H Z B J), %w(R P F Z T D C B), %w(T H C G), %w(S N V Z B P W L), %w(R J Q G C), %w(L D T R H P F S)]
    @tester = SupplyStack.new(test_array)
    @challenge = SupplyStack.new(chall_array)
    @test_direct = './supply_stacks/crane_commands_test.txt'
    @chall_direct = './supply_stacks/crane_commands.txt'
  end

  it 'exists and has stacks' do
    expect(@tester).to be_an_instance_of(SupplyStack)
    expect(@tester.stacks).to be_an(Array)
    expect(@tester.stacks[0]).to be_an(Array)
  end

  it 'can get directions' do
    @tester.get_directions(@test_direct)
    expect(@tester.directions).to be_an(Array)
    expect(@tester.directions[0]).to be_a(Hash)
  end

  it 'can execute directions' do
    projected = [%w(C), %w(M), %w(P D N Z)]
    @tester.get_directions(@test_direct)
    @tester.execute_directions
    expect(@tester.stacks).to eq(projected)
  end

  it 'can return the "top" of each stack after executing directions as a string' do
    @tester.get_directions(@test_direct)
    @tester.execute_directions
    expect(@tester.end_phrase).to eq("CMZ")
  end

  it 'can get the end phrase for challenge stacks' do
    @challenge.get_directions(@chall_direct)
    @challenge.execute_directions
    expect(@challenge.end_phrase).to eq("SHQWSRBDL")
  end
end