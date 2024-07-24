namespace :languages do
  task import_default: :environment do
    data = [
      { name: 'English', code: 'en', flag: '🇬🇧' },
      { name: '日本語', code: 'jp', flag: '🇯🇵' },
      { name: '한국어', code: 'ko', flag: '🇰🇷' }
    ]

    Language.create!(data)
  end
end
