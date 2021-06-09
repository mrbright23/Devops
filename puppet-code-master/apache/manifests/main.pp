# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::main
class apache::main {

  include apache::install
  include apache::service
  include apache::sitedata

}
