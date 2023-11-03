module ApplicationHelper
  def truncate_words(text, length, separator = ' ')
    return if text.nil?

    words = text.split(separator)
    truncated_words = words[0...[length, words.length].min].join(separator)
    truncated_words += '...' if words.length > length
    truncated_words
  end
end
