# JEKYLL AUTO RELATIVE
# This is a plugin for converting urls in markdown files to relative paths required by Jekyll. 
# Author: Qucheng Miao

require "jekyll"

module Jekyll
    class AutoRelative
        class << self
            INLINE_LINK_REGEX = /\[((?:\[(?:\\.|[^\[\]\\])*\]|\\.|`[^`]*`|[^\[\]\\`])*?)\]\(\s*(?:<\s*(\/(?:\\.|[^\n<>\\])+)>|(\/[^\s\x00-\x1f]*))(?:\s+("(?:\\"?|[^"\\])*"|'(?:\\'?|[^'\\])*'|\((?:\\\)?|[^)\\])*\)))?\s*\)/
            INLINE_REFLINK_REGEX = /^\s*\[((?:\[(?:\\.|[^\[\]\\])*\]|\\.|`[^`]*`|[^\[\]\\`])*?)\]:\s*(?:<\s*(\/(?:\\.|[^\n<>\\])+)>|(\/[^\s\x00-\x1f]*))(?:\s+("(?:\\"?|[^"\\])*"|'(?:\\'?|[^'\\])*'|\((?:\\\)?|[^)\\])*\)))?\s*$/

            def convert (doc)
                text = doc.content
                text.gsub!(INLINE_LINK_REGEX, '[\1]({{ "\2\3" | relative_url }} \4)')
                text.gsub!(INLINE_REFLINK_REGEX, '[\1]: {{ "\2\3" | relative_url }} \4')
                # puts text
            end

            def needconvert? (doc)
                site_config = doc.site.config
                extname_list ||= site_config["markdown_ext"].split(",").map! { |e| ".#{e.downcase}" }

                extname_list.include?(doc.extname.downcase) &&
                    site_config["auto-relative"] != false && doc.data["auto-relative"] != false &&
                    (site_config["auto-relative"] == true || doc.data["auto-relative"] == true)
            end
        end
    end
end

Jekyll::Hooks.register [:pages, :documents], :pre_render do |doc|
    Jekyll::AutoRelative.convert(doc) if Jekyll::AutoRelative.needconvert?(doc)
end
