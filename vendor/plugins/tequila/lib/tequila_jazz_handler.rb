#-*- coding: utf-8 -*-

require 'treetop'
require 'tequila_grammar'
require 'preprocessor'
require 'tree'

module Tequila
  class JazzHandler < ActionView::TemplateHandler
    include ActionView::TemplateHandlers::Compilable

    def compile(template)
      <<CODE.gsub('\n',';')
        controller.response.content_type = Mime::JSON
        src = ::TequilaPreprocessor.run(template.source)
        _tequila_out =::TequilaParser.new.parse(src).eval(binding).build_hash.to_json
CODE
    end

    def cache_fragment(block, name = {}, options = nil)
      @view.fragment_for(block, name, options) do
        eval("_tequila_out", block.binding)
      end
    end

  end
end

ActionView::Template.register_template_handler :jazz, Tequila::JazzHandler

# exempt_from_layout is no longer needed, because layouts in Rails 3
# are restricted to the content-type of the template that was rendered.
if Rails::VERSION::MAJOR < 3
  ActionView::Template.exempt_from_layout(/.jazz$/)
end
