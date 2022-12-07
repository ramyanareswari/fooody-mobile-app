
# A02 - Foody Buddy 🗑️🚮
[![Staging](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/staging.yml/badge.svg)](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/staging.yml)
[![Pre-Release](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/pre-release.yml/badge.svg)](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/pre-release.yml)
[![Release](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/release.yml/badge.svg)](https://github.com/ramyanareswari/fooody-mobile-app/actions/workflows/release.yml)
[![AppCenter Build Status](https://build.appcenter.ms/v0.1/apps/c1c2d3f3-a0b4-4138-aa3f-f39203c8d91e/branches/main/badge)](https://appcenter.ms)

## Tautan Apk 🔗
Download APK [di sini!](https://install.appcenter.ms/users/ramya.nareswari-ui.ac.id/apps/fooody-buddy/distribution_groups/public)

Anda juga dapat melihat versi web [di sini!](https://fooodybuddy.up.railway.app/) 

## Anggota Kelompok A02 👨‍💻
__PBP-A Odd Semester 2022/2023__<br/>
* Ivan Rabbani Cezeliano (2106701892) - Expiry Tracker<br/>
* Vladi Jingga Mentari (2106635631) - Foody Diary<br/>
* Qaniah Zahirah (2106639491) - Auth dan Homepage<br/>
* Shamira Alifanindya Prasetya (2106636376) - Quiz<br/>
* Nikolas Reva Bellie (2106750212) - Send Foodwaste<br/>
* Fauzil Ula Fachrudin (2106702680) - Foodwaste Organization Info<br/>
* Ramya Nareswari Wikantiyoso (2106751606) - Article<br/>

## Latar Belakang dan Manfaat Aplikasi ✨
Makanan adalah hal esensial bagi manusia karena berperan sebagai sumber energi agar manusia dapat bertahan hidup. Sayangnya, makanan yang sudah ataupun belum dikonsumsi sering kali berakhir menjadi limbah dan terbuang begitu saja. Permasalahan serius dapat terjadi akibat limbah makanan yang tidak terolah dengan baik, salah satunya menimbulkan kerugian bagi lingkungan.<br/>

FooodyBuddy hadir sebagai solusi untuk memfasilitasi masyarakat dalam menyalurkan limbah makanan yang diproduksi. Tak hanya itu, kami juga menginisiasi langkah preventif dengan membuat fitur _tracker_ kedaluwarsa makanan. Melalui digitalisasi, kami berharap aplikasi ini dapat meningkatkan kesadaran masyarakat terkait pentingnya pengelolaan _food waste_.<br/>

## Modul Aplikasi 📝
1. <b>Homepage</b><br/>
    Berisi gambaran aplikas, FAQ terkait aplikasi, dan _contact form_.
2. <b>Foody Tips (artikel)</b><br/>
    Berisi artikel-artikel seputar sisa makanan (_food waste_), seperti tips pengelolaan makanan sisa sehari-hari, tips penyimpanan makanan yang baik, dsb.
3. <b>Food Waste Awareness Mini Quiz</b><br/>
    Berisi kuis untuk mengukur seberapa besar pengetahuan masyarakat atas pengelolaan _food waste_. Setelah kuis berakhir, pengguna dapat melihat skor yang didapat.
4. <b>Food Waste Management Organization Information</b><br/>
    Pada page ini, pengguna dapat menambahkan informasi terkait organisasi-organisasi yang berperan dalam mengelola foodwaste. Informasi tersebut nantinya dapat dilihat oleh pengguna lainnya.
5. <b>Foody Diary</b><br/>
    Berisi informasi terkait makanan yang sudah pengguna beli. Informasi yang dapat ditambahkan pengguna melalui form yang ada yaitu: tanggal beli makanan, deskripsi, status apakah makanan dihabiskan atau tidak, serta uang yang dikeluarkan untuk membeli makanan. Tujuan dibentuknya modul ini adalah meningkatkan kesadaran para pengguna untuk tidak menyisakan makanan demi kesehatan lingkungan.
6. <b>Track My Foody</b><br/>
    Berisi expiry tracker dari makanan yang sudah pengguna beli, baik makanan organik maupun nonorganik. Tujuan dibentuknya module ini adalah sebagai pengingat bagi para pengguna bahwa makanan yang dibeli sudah hampir kadaluarsa, karena tidak jarang seseorang membeli makanan dalam jumlah banyak dan tidak sadar akan tanggal kadaluarsanya.
7. <b>Send Organic Food Waste</b><br/>
    Pada page ini, pengguna dapat menyalurkan makanan sisa yang layak makan; seperti buah yang sebentar lagi busuk, roti yang hampir kadaluarsa, dsb kepada organisasi-organisasi terkait. 

## Integrasi dengan Situs Web 🌐
* Mengimplementasikan Desain User Interface (UI) yang sama dengan website yang telah dibuat
* Menggunakan library HTTP untuk mendapatkan data dari endpoint Django yang telah ada sebelumnya
* Mengimplementasikan asynchronous HTTP untuk pengintegrasian front-end dan back-end

## Role Pengguna Aplikasi 🙋‍♀️🙋‍♂️
Aplikasi ini mengharuskan pengguna untuk _login_ terlebih dahulu. User yang telah login dapat mengakses halaman-halaman berikut:
* Homepage and FAQ section
* Foody Tips
* Food Waste Management Organization Information
* Food Waste Awareness Mini Quiz
* Foody Diary
* Track My Foody
* Send Organic Food Waste
