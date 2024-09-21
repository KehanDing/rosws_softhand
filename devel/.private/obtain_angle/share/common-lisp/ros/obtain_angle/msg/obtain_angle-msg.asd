
(cl:in-package :asdf)

(defsystem "obtain_angle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "fingerpose" :depends-on ("_package_fingerpose"))
    (:file "_package_fingerpose" :depends-on ("_package"))
  ))