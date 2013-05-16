# Author:		Chris Wailes <chris.wailes@gmail.com>
# Project: 	Filigree
# Date:		2013/05/14
# Description:	Simple application framework.

############
# Requires #
############

# Standard Library

# Filigree
require 'filigree/class_methods_module'
require 'filigree/configuration'

##########
# Errors #
##########

###########
# Methods #
###########

#######################
# Classes and Modules #
#######################

module Filigree; end

module Filigree::Application
	include ClassMethodsModule
	
	#############
	# Constants #
	#############
	
	REQUIRED_METHODS = [
		:kill,
		:pause,
		:resume,
		:run,
		:stop
	]

	####################
	# Instance Methods #
	####################
	
	attr_accessor :configuration
	alias :config :configuration
	
	def initialize
		@configuration = self.class::Configuration.new(ARGV)
		
		# Set up signal handlers.
		Signal.trap('ABRT')	{ self.stop }
		Signal.trap('INT')	{ self.stop }
		Signal.trap('QUIT')	{ self.stop }
		Signal.trap('TERM')	{ self.stop }
		
		Signal.trap('KILL')	{ self.kill }
		
		Signal.trap('CONT')	{ self.resume }
		Signal.trap('STOP')	{ self.pause  }
	end
	
	#################
	# Class Methods #
	#################
	
	module ClassMethods
		def finalize
			REQUIRED_METHODS.each do |m|
				raise(NoMethodError, "Application missing method: #{m}") if not self.instance_methods.include?(m)
			end
		end
	end
	
	#############
	# Callbacks #
	#############
	
	class << self
		alias :old_included :included
		
		def included(klass)
			old_included(klass)
			
			klass.const_set(:Configuration, Class.new do
				include Filigree::Configuration
			end)
		end
	end
end
