
(cl:in-package :asdf)

(defsystem "visual_servo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "object_position" :depends-on ("_package_object_position"))
    (:file "_package_object_position" :depends-on ("_package"))
  ))