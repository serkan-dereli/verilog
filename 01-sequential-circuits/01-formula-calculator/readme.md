C = 2 * t – a – b (a>b ise t=a, değilse t=b) İşlemini 5-bit olarak gerçekleştiren kodlamayı toplayıcı ve çıkarıcılarla gerçekleştiriniz. ÖNEMLİ DURUMLAR:

İşlem şu şekle dönüştürülebilir:
C = t + t – (a + b)
Önce i1=t+t işlemi yapılacak
Sonra i2=a+b işlemi yapılacak
En son i3=i1-i2 işlemi yapılacak
İşlem adımları:

Resetle ilk duruma geçilir.
a ve b girişleri içeri alınır.
a ve b girişleri karşılaştırılır
Koşula göre t=a veya t=b ataması yapılır
i1=t+t işlemi yapılır
i2=a+b işlemi yapılır
i3=i1-i2 işlemi yapılır
c=i3 ataması yapılır