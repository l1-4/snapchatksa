#!/bin/bash

# واجهة إدخال اسم المستخدم لسناب
read -p "أدخل اسم المستخدم لحساب سناب شات: " SNAP_USER

# بناء الرابط تلقائيًا
SNAP_LINK="https://www.snapchat.com/add/$SNAP_USER"

# هاشتاقات وحقوق
HASHTAGS="#سناب #snapchat #ضيفوني #explore #ترند #fyp #ksa"
CREDIT="حقوق النشر: AL-F snapchat:LSLF instagram:LSLF_6 KSA | GitHub: https://github.com/l1-4"

# مدة التكرار (ثواني)
WAIT_TIME=600

# عرض ترحيب وتشغيل أولي
clear
echo "========================================"
echo "      سكربت ترويج حساب سناب شات"
echo "========================================"
echo "تم تجهيز الترويج للحساب: $SNAP_USER"
echo "$CREDIT"
echo "لإيقاف السكربت اضغط Ctrl+C"
echo "----------------------------------------"

# فتح صورة عند بداية السكربت (اختياري)
xdg-open "/mnt/data/F02ACDE3-31C3-4830-8D15-E012FA607428.jpeg" &>/dev/null

# بدء الحلقة الترويجية
while true
do
  echo "[*] فتح رابط سناب شات في المتصفح..."
  xdg-open "$SNAP_LINK"

  # تجهيز التغريدة
  TWEET="ضيفوني على سنابي $SNAP_LINK $HASHTAGS $CREDIT"

  echo "[*] نشر على تويتر..."
  twurl -d "status=$TWEET" /1.1/statuses/update.json

  echo "[✓] تم الترويج. إعادة الترويج بعد $((WAIT_TIME/60)) دقيقة..."
  sleep $WAIT_TIME
done
