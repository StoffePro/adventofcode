(defun advent ()
  "https://adventofcode.com/2020/day/2"
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char (point-min))
      (cl-loop
       while (re-search-forward "^\\([0-9]+\\)-\\([0-9]+\\) \\([a-z]\\): \\([0-9a-z]+\\)$" nil t)
       do (let* ((min (string-to-number (match-string 1)))
		 (max (string-to-number (match-string 2)))
		 (char (match-string 3))
		 (pass (match-string 4))
		 (matches (count-matches char (match-beginning 4) (match-end 4))))
	    (if (and matches (>= matches min) (<= matches max))
		(incf count))))
      (message (format "%d matches" count)))))
