Gem::Specification.new do |s|
  s.name    = 'hotcocoa_graphics'
  s.version = '0.0.0'

  s.summary      = 'HotCocoa Graphics Library'
  s.description  = 'HotCocoa Graphics Library for simplifyin the use of Cocoa Core Graphics and Core Image frameworks.'
  s.authors      = ['Richard Kilmer',     'Mark Rada',              'Dr.Toast',            'Matt Aimonetti']
  s.email        = ['rich@infoether.com', 'mrada@marketcircle.com', 'drtoast@drtoast.com', 'mattaimonetti@gmail.com']
  s.homepage     = 'http://github.com/HotCocoa/hotcocoa'
  s.licenses     = ['MIT']
  s.has_rdoc     = 'yard'

  s.files            = ['Rakefile', '.yardopts'] + Dir.glob('lib/**/*.rb')
  s.test_files       =                             Dir.glob('test/**/*.rb')
  s.extra_rdoc_files = ['README.markdown']

  s.add_development_dependency 'minitest',  '~> 2.10'
  s.add_development_dependency 'yard',      '~> 0.7.4'
  s.add_development_dependency 'redcarpet', '~> 1.17'
end
