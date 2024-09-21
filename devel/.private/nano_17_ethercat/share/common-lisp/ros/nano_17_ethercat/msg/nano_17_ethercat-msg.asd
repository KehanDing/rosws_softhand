
(cl:in-package :asdf)

(defsystem "nano_17_ethercat-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FT_nano17" :depends-on ("_package_FT_nano17"))
    (:file "_package_FT_nano17" :depends-on ("_package"))
  ))