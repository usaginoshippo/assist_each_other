require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end
  
  describe 'スケジュールを登録する' do
    context 'スケジュールを登録できる場合' do
      it '日時,項目,相手の情報がある場合スケジュール登録できる' do
        expect(@schedule).to be_valid
      end
    end

    context 'スケジュールを登録できない場合' do
      it '日時の情報がない場合スケジュール登録できない' do
        @schedule.start_time = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start timeを入力してください")
      end
      
      it '項目を選択していない場合スケジュール登録できない' do
        @schedule.content_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Contentcan't be blank")
      end
      
      it '相手の情報がない場合スケジュール登録できない' do
        @schedule.assisted = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Assistedを入力してください")
      end
      
      it 'groupが紐付いていないと保存できない' do
        @schedule.group = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('Groupを入力してください')
      end

      it 'userが紐付いていないと保存できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('Userを入力してください')
      end
    end
   end
end
