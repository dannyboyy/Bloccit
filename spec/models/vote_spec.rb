require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validations" do
      it "only allows -1 or 1 as values" do
        expect(Vote.new(value: 1).valid?).to eq(true)
        expect(Vote.new(value: -1).valid?).to eq(true)
        expect(Vote.new(value: 2).valid?).to eq(false)
      end
    end
  end
end