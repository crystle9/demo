Feature: validates users

  Scenario Outline: proper email, unique email, proper password, password confirmation
    When validates email "<email>" and  name "<name>" and password"<password>" and confirms "<password_confirmation>"
    Then comes out "<result>"
    
    Examples:
      | email | name | password | password_confirmation | result |
      | a@b.cn | testuser | 12345 | 12345		| true	 |
      | abc    | emailf	  | 222dd | 111dd		| false	 |
      | a@b.cn | emails	  | 333dd | 111dd		| false	 |
      | d@a.cn | passwordf | 	  | 			| false	 |
      | d@c.cn | passwordn | 123dd | 321dd		| false	 |
      | a@e.cn | gsus	   | 123   | 123		| false	 |
