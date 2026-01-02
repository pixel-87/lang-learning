package main

func isValidPassword(password string) bool {
	if l := len(password); l < 5 || l > 12 {
		return false
	}
	con_upper := false
	con_digit := false

	for _, char := range password {
		switch {
		case char >= 'A' && char <= 'Z':
        con_upper = true
    case char >= '0' && char <= '9':
        con_digit = true
		}
	}
	
	return con_upper && con_digit
}

