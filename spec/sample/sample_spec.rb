# coding: utf-8
describe 'Sample' do
  describe '2で割った余りは、変数Numが' do
    context '1のとき' do
      before do
        @num = 1
      end

      it do
        expect(@num % 2).to eq 1
      end

      context '2のとき' do
        before do
          @num = 2
        end

        it do
          expect(@num % 2).to eq 0
        end
        
      end
    end
  end
end
