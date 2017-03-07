# coding: utf-8
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  password   :string           not null
#  grade      :string           not null
#  snum       :string           not null
#  account    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_admin   :boolean          default("false")
#

describe User, type: :model do
  let(:saved_user) do
    User.create(
      name: 'ふが',
      grade: 'Semi2999',
      snum: '13T299',
      account: 'huga',
      password: Digest::SHA256.hexdigest('hogehoge'),
      password_confirmation: Digest::SHA256.hexdigest('hogehoge')
    )
  end

  let(:new_user) do
    User.new(
      name: 'ほげ',
      grade: 'Semi2999',
      snum: '13T200',
      account: 'hoge',
      password: Digest::SHA256.hexdigest('hogehoge'),
      password_confirmation: Digest::SHA256.hexdigest('hogehoge')
    )
  end

  context '全てのカラムが適切な場合' do
    it '正常に保存できる' do
      expect(new_user.save).to eq true
    end
  end

  describe '.snum' do
    context 'nilの場合' do
      it '保存できない' do
        new_user.snum = nil
        expect{new_user.save}.to raise_error(ActiveRecord::StatementInvalid)
      end
    end

    context '重複している場合' do
      it 'バリデーションチェックに引っかかる' do
      new_user.snum = saved_user.snum
      expect(new_user.valid?).to eq false
      expect(new_user.errors.messages.keys.first).to eq :snum
      end
    end
  end    
end
