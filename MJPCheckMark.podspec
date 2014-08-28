Pod::Spec.new do |s|

    s.name              = 'MJPCheckMark'
    s.version           = '0.1.0'
    s.summary           = 'iOS Checkmark'
    s.homepage          = 'https://github.com/mikeplatt/MJPCheckMark'
    s.license           = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author            = {
        'mikeplatt' => 'mikeplatt@inboox.com'
    }
    s.source            = {
        :git => 'https://github.com/mikeplatt/MJPCheckMark.git',
        :tag => s.version.to_s
    }
    s.source_files      = 'Source/*.{m,h}'
    s.requires_arc      = true
	s.platform 			= :ios, "7.0"

end