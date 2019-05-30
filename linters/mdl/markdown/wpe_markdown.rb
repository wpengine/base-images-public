all

# Set line length to 120 characters from 80.
rule 'MD013', :line_length => 120

# Allow headers to share names if separated by a larger header.
rule 'MDO24', :allow_different_nesting => true

# Set numbered lists to expect an increment in value.
rule 'MD029', :style => "ordered"
