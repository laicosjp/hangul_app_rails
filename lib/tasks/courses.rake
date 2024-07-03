namespace :courses do
  task import_default: :environment do
    data = [
      { title: 'ハングル検定5級', slug: 'hangul_test_fifth' },
      { title: 'ハングル検定4級', slug: 'hangul_test_fourth' },
      { title: 'ハングル検定3級', slug: 'hangul_test_third' },
      { title: 'ハングル検定2級', slug: 'hangul_test_second' },
      { title: 'ハングル検定1級', slug: 'hangul_test_first' }
    ]

    Course.create!(data)
  end
end
