require './lib/item'
require './lib/food_truck'

 RSpec.describe FoodTruck do
 	before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
 	end

    context 'Iteration 1' do

     	it 'exists' do
     		expect(@food_truck).to be_a(FoodTruck)
     	end

     	it 'has attributes' do
     		expect(@food_truck.name).to eq("Rocky Mountain Pies")
     		expect(@food_truck.inventory).to eq({})
     	end

      it 'can check the stock of an item' do
        expect(@food_truck.check_stock(@item1)).to eq(0)
      end

      it 'can add/remove stock and count the quantity of an item in stock' do
        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory).to eq({@item1 => 30})
        expect(@food_truck.check_stock(@item1)).to eq(30)

        @food_truck.stock(@item1, 25)
        expect(@food_truck.check_stock(@item1)).to eq(55)

        @food_truck.stock(@item2, 12)
        expect(@food_truck.inventory).to eq(@item1 => 55, @item2 => 12)
      end

    end
 end
