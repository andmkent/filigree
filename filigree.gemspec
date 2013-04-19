# Author:		Chris Wailes <chris.wailes@gmail.com>
# Project: 	Filigree
# Date:		2013/4/19
# Description:	Gem specification for the Filigree project.

require File.expand_path("../lib/filigree/version", __FILE__)

Gem::Specification.new do |s|
	s.platform = Gem::Platform::RUBY
	
	s.name		= 'Filigree'
	s.version		= Filigree::VERSION
	s.summary		= ''
	s.description	= ''
	
	s.files = [
			'LICENSE',
			'AUTHORS',
			'README.md',
			'Rakefile',
			] +
			Dir.glob('lib/**/*.rb')
			
			
	s.require_path	= 'lib'
	
	s.author		= 'Chris Wailes'
	s.email		= 'chris.wailes@gmail.com'
	s.homepage	= ''
	s.license		= 'University of Illinois/NCSA Open Source License'
	
	s.required_ruby_version = '1.9.3'
	
	################
	# Dependencies #
	################
	
	############################
	# Development Dependencies #
	############################
	
	s.test_files	= Dir.glob('test/tc_*.rb') + Dir.glob('test/ts_*.rb')
end
