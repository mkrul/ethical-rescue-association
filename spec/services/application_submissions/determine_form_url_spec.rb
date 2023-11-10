require 'spec_helper'

RSpec.describe ApplicationSubmissions::DetermineFormUrl do
  describe '#execute' do
    context 'when given rescue, dogs, and an email' do
      it 'returns the dog rescue form url' do
        result = ApplicationSubmissions::DetermineFormUrl.run(
          organization: 'rescue',
          specialization: 'dogs',
          email: 'misha@test.com'
        ).result

        expect(result).to eq(
          "https://docs.google.com/forms/d/e/1FAIpQLSeclt2wWzmUAaLbaMip2ux1d5Z4jJ3XmmIk2GxP8qONlH2fbA/viewform?entry.1019037625=misha@test.com"
        )
      end
    end

    context 'when given rescue, cats, and an email' do
      it 'returns the cat rescue form url' do
        result = ApplicationSubmissions::DetermineFormUrl.run(
          organization: 'rescue',
          specialization: 'cats',
          email: 'misha@test.com'
        ).result

        expect(result).to eq(
          "https://docs.google.com/forms/d/e/1FAIpQLSfDyptJDDnmKqrGw8HO_GEeiZ5-Xc7sPrhOUOq5ivaoGH50Jw/viewform?entry.1170237906=misha@test.com"
        )
      end
    end

    context 'when given rescue, dogs_and_cats, and an email' do
      it 'returns the dog and cat rescue form url' do
        result = ApplicationSubmissions::DetermineFormUrl.run(
          organization: 'rescue',
          specialization: 'dogs_and_cats',
          email: 'misha@test.com'
        ).result

        expect(result).to eq(
          "https://docs.google.com/forms/d/e/1FAIpQLSdn8K-m1wuAUqIlhvn6zjiJjS4klGzOLj6N9sZrO4fNHbOvHA/viewform?entry.1690243568=misha@test.com"
        )
      end
    end

    context 'when given shelter and an email' do
      it 'returns the shelter form url' do
        result = ApplicationSubmissions::DetermineFormUrl.run(
          organization: 'shelter',
          specialization: 'dogs_and_cats',
          email: 'misha@test.com'
        ).result

        expect(result).to eq(
          "https://docs.google.com/forms/d/e/1FAIpQLSfIlU9glxiIqd4x9zmVPXe1bAN45qDlKt5C46c42wRkV4RXng/viewform?entry.1407910400=misha@test.com"
        )
      end
    end
  end
end
