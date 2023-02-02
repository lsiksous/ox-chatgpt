;;; ox-chatgpt.el --- org-babel mode for openai api  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Laurent Siksous

;; Author: Laurent Siksous <lss@free.fr>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; You must first install dangirsh/openai-api.el package

;; (use-package openai-api
;;   :straight (openai-api :type git :host github :repo "dangirsh/openai-api.el")
;;   :config
;;   ;; required
;;   (setq openai-api-secret-key <Token>) ; https://beta.openai.com/account/api-keys
;;   ;; optional
;;   (setq openai-api-engine "text-davinci-003") ; *-codex models require private beta access
;;   (setq openai-api-completion-params '((max_tokens . 100)
;;                                        (temperature . 0.0)
;;                                        (frequency_penalty . 0)
;;                                        (presence_penalty . 0)
;;                                        (n . 1))))

;;; Code:
(provide 'ox-chatgpt)
;;; ox-chatgpt.el ends here

;; Define the chatgpt-mode for org-babel
(defun org-babel-execute:chatgpt (body params)
  "Interpret a chatgpt source block in org-mode using the ChatGPT API."
  (openai-api-get-completions body))

;; Add chatgpt-mode to org-babel's list of supported languages
(add-to-list 'org-babel-load-languages '(chatgpt . t))

;; Set the default header arguments for chatgpt-mode blocks
(setq org-babel-default-header-args:chatgpt '())
