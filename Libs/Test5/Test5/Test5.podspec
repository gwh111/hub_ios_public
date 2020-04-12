Pod::Spec.new do |spec|

spec.name  = 'Test5'
spec.version = '1.0.0'
spec.summary = 'summary'
spec.license = { :type => 'MIT' }
spec.author = { 'gwh <173695508@qq.com>' => 'email' }
spec.homepage = 'https://github.com/gwh111/bench_ios'
spec.ios.deployment_target  = '7.0'
spec.source = { :git => 'https://github.com/gwh111/hub_ios_public.git', :tag => "#{spec.name}"+"-"+"#{spec.version}" }
spec.source_files = 'Libs/Test5/Test5/Test5/Test5/**/*.{h,m}'
spec.dependency 'bench_ios'

end
