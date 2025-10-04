import 'package:flutter/material.dart';

class DummyNotificationPage extends StatefulWidget {
  const DummyNotificationPage({super.key});

  @override
  State<DummyNotificationPage> createState() => _DummyNotificationPageState();
}

class _DummyNotificationPageState extends State<DummyNotificationPage> {
  // Dummy data untuk notifikasi
  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: "Top Up Berhasil",
      message: "Top up sebesar Rp 500.000 berhasil dilakukan",
      time: "Baru saja",
      icon: Icons.arrow_upward,
      iconColor: Colors.green,
      isRead: false,
    ),
    NotificationItem(
      title: "Transfer Keluar",
      message: "Transfer ke BCA - 1234567890 sebesar Rp 250.000",
      time: "10 menit yang lalu",
      icon: Icons.arrow_downward,
      iconColor: Colors.red,
      isRead: false,
    ),
    NotificationItem(
      title: "Pembayaran Listrik",
      message: "Pembayaran PLN 123456789012 berhasil",
      time: "1 jam yang lalu",
      icon: Icons.flash_on,
      iconColor: Colors.orange,
      isRead: true,
    ),
    NotificationItem(
      title: "Promo Spesial",
      message: "Dapatkan cashback 10% untuk semua transaksi hari ini",
      time: "2 jam yang lalu",
      icon: Icons.local_offer,
      iconColor: Colors.purple,
      isRead: true,
    ),
    NotificationItem(
      title: "Pembelian Pulsa",
      message: "Pulsa sebesar Rp 100.000 untuk 081234567890 berhasil",
      time: "5 jam yang lalu",
      icon: Icons.phone_android,
      iconColor: Colors.blue,
      isRead: true,
    ),
    NotificationItem(
      title: "Pembayaran PDAM",
      message: "Pembayaran tagihan air bulan Oktober berhasil",
      time: "Kemarin",
      icon: Icons.water_drop,
      iconColor: Colors.lightBlue,
      isRead: true,
    ),
  ];

  int _unreadCount = 2; // Jumlah notifikasi belum dibaca

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              label: Text(
                _unreadCount.toString(),
                style: const TextStyle(fontSize: 10),
              ),
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return _buildNotificationCard(notification, index);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 16),
          Text(
            "Tidak ada notifikasi",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Notifikasi akan muncul di sini",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (!notification.isRead) {
            setState(() {
              _notifications[index] = notification.copyWith(isRead: true);
              _unreadCount--;
            });
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: notification.isRead 
                  ? Colors.transparent 
                  : const Color.fromARGB(255, 0, 60, 144),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon notifikasi
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: notification.iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              
              // Konten notifikasi
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.time,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isRead,
  });

  NotificationItem copyWith({
    String? title,
    String? message,
    String? time,
    IconData? icon,
    Color? iconColor,
    bool? isRead,
  }) {
    return NotificationItem(
      title: title ?? this.title,
      message: message ?? this.message,
      time: time ?? this.time,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      isRead: isRead ?? this.isRead,
    );
  }
}