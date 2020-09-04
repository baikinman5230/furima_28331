FactoryBot.define do
  factory :transaction_address do
    postal_code  {"234-2345"}
    city         {"姫路市"}
    house_number {"白川1-2-3"}
    phone_number {"09099998888"}
    prefecture   {"5"}
    token        {"whook_f89db43ea2d7561b2654007468"}
  end
end
