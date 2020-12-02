(defun advent ()
  "https://adventofcode.com/2020/day/2"
  (interactive)
  (save-excursion
    (let ((count 0))
      (goto-char (point-min))
      (cl-loop
       while (re-search-forward "^\\([0-9]+\\)-\\([0-9]+\\) \\([a-z]\\): \\([0-9a-z]+\\)$" nil t)
       do (let* ((p1 (string-to-number (match-string 1)))
		 (p2 (string-to-number (match-string 2)))
		 (char (string-to-char (match-string 3)))
		 (pass (match-string 4)))
	    (if (or (eq char (nth (1- p1) (string-to-list pass)))
		    (eq char (nth (1- p2) (string-to-list pass))))
		(incf count))))
      (message (format "%d matches" count)))))
