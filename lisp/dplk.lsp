(defun c:DPLK()
  (setvar "cmdecho" 0)
  (setq fileph (getfiled "ѡ���ļ��洢·��" "" "csv" 1));ѡ���ļ��洢·��
  (princ "\n��ѡ����̱��(����):")
  (setq ss (entsel))
  (setq ptlist "")
  (while ss
    (setq ss (car ss))
    (setq ss_data (entget ss))
    (setq wb (cdr (assoc 1 ss_data)));��ȡ���̱��/����
    (princ "\n��ѡ��õ���������:");��ȡ����������
    (setq el (car (entsel)))
    (foreach n (entget el)
      (if (= 10 (car n))
      (setq ptlist (cons (cdr n) ptlist)))
     )
    (setq aa (list wb ":" ptlist))
    ;�ı���ѡ����������ɫ
    (entmod(append(entget el)'((62 . 2))))
    ;�ı���ѡ�������ߵĴ�ϸ
    (entmod(append(entget el)'((370 . 50))))
    ;ȷ�Ϲ�ѡ���������ݻ����¹�ѡ���������
    (princ "\n������ѡ<Enter>���¹�ѡ<Z>")
    (setq j (getstring))
    (if (= j "")
      (writedata))
    (if (= j "z")
      (setq el_data (subst k (assoc 62 el_data) el_data)))
    (if (= j "z")
      (setq el_data (subst h (assoc 360 el_data) el_data)))
    (entmod el_data)
    (setq ptlist "")
    (princ "\n��ѡ����̱��(����):")
    (setq ss (entsel))
    )
  (princ)
 )


(defun writedata()
  (setq file (open fileph "a"))
  (princ aa file)
  (princ "\n" file)
  (close file)
  )
