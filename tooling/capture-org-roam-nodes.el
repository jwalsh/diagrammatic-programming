(setq topics
      '(("Agents" 25)
        ("Autonomous agents" 4)
        ("Chatbots" 46)
        ("Classification" 5)
        ("Code understanding" 12)
        ("Code writing" 13)
        ("Evaluation" 17)
        ("Extraction" 31)
        ("Interacting with APIs" 4)
        ("Multi-modal" 1)
        ("QA over documents" 40)
        ("Self-checking" 7)
        ("SQL" 4)
        ("Summarization" 49)
        ("Tagging" 6)))

(defun capture-org-roam-nodes ()
  (dolist (topic topics)
    (let ((topic-name (car topic))
          (topic-count (cadr topic)))
      (org-roam-capture
       :keys "t"
       :template "d"
       :title topic-name
       :file-name (format "%s.org" topic-name)
       :head
       (format "#+title: %s\n#+roam_tags: %s\n\n* %s\n\n"
               topic-name
               topic-name
               topic-name))
      (dotimes (i topic-count)
        (org-roam-capture
         :keys "t"
         :template "n"
         :title (format "%s %d" topic-name (1+ i))
         :file-name (format "%s.org" topic-name)
         :immediate-finish t)))))

(capture-org-roam-nodes)
