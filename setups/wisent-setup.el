
(require 'semantic-wisent)

(load "wisent-ruby-wy")
(load "wisent-ruby")

(require 'ruby-setup)
(add-hook 'ruby-mode-hook 'wisent-ruby-default-setup)

(provide 'wisent-setup)
