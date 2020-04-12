Pod::Spec.new do |spec|

spec.name  = 'Rate'
spec.version = '1.0.6'
spec.summary = 'summary'
spec.license = { :type => 'MIT' }
spec.author = { 'GAO <gwh199099@hotmail.com>' => 'email' }
spec.homepage = 'https://github.com/gwh111/bench_ios'
spec.ios.deployment_target  = '7.0'
spec.source = { :git => 'https://github.com/gwh111/hub_ios_public.git', :tag => "#{spec.name}"+"-"+"#{spec.version}" }
spec.source_files = 'Libs/Rate/Rate/Rate/Rate/**/*.{h,m}'
spec.dependency 'bench_ios'

end
