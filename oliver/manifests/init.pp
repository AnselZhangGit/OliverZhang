class oliver {
  $username='oliver'
  notice("Running with ID defined")
  include "oliver::user"
  include "oliver::git"
  include "oliver::apache"
  include "oliver::ruby"
  include "oliver::passenger"
}

