require 'rails_helper'

RSpec.describe TransactionAddress, type: :model do
  before do
    @address = FactoryBot.build(:transaction_address)
  end

  it "指定された全ての情報があれば購入できる" do
    expect(@address).to be_valid
  end

  it "postal_codeが空では購入できない" do
    @address.postal_code = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeに(-)がないと購入できない" do
    @address.postal_code = "2343456"
    @address.valid?
    expect(@address.errors.full_messages).to include("Postal code is invalid")
  end

  it "cityが空では購入できない" do
    @address.city = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("City can't be blank")
  end

  it "house_numberが空では購入できない" do
    @address.house_number = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが空では購入できない" do
    @address.phone_number = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberが11文字以外なら購入できない" do
    @address.phone_number = "0908232345"
    @address.valid?
    expect(@address.errors.full_messages).to include("Phone number is invalid")
  end

  it "prefectureが空では購入できない" do
    @address.prefecture = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("Prefecture is not a number")
  end

  it "prefectureが１の時、購入できない" do
    @address.prefecture = 1
    @address.valid?
    expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "tokenが空では購入できない" do
    @address.token = nil
    @address.valid?
    expect(@address.errors[:token])
  end


end
