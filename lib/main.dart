// Import thư viện Material Design của Flutter chứa các UI widget chuẩn
import 'package:flutter/material.dart';

// Hàm main() là điểm bắt đầu (entry point) của ứng dụng Flutter
void main() {
  // runApp() nhận vào widget gốc và khởi chạy ứng dụng
  runApp(const MyApp());
}

// Widget MyApp đại diện cho toàn bộ ứng dụng (StatelessWidget: không thay đổi trạng thái nội tại)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp cấu hình khung ứng dụng, giao diện, tuyến đường (routes)...
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Ẩn biểu tượng "DEBUG" ở góc trên bên phải màn hình
      home: ProfileScreen(), // Đặt ProfileScreen làm màn hình khởi đầu mặc định
    );
  }
}

// Giao diện trang cá nhân (ProfileScreen)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold cung cấp cấu hình giao diện cơ bản (nền, appBar, body, drawer...)
    return Scaffold(
      backgroundColor:
          Colors.grey[300], // Màu nền xám bên ngoài khung điện thoại
      body: Center(
        // Căn giữa giao diện điện thoại trên màn hình
        child: SingleChildScrollView(
          // Cho phép cuộn màn hình khi nội dung dài hơn chiều cao màn hình
          child: Container(
            width: 390, // Cố định chiều rộng giao diện mô phỏng màn hình điện thoại
            padding: const EdgeInsets.only(
              // Căn lề bên trong (margin trong)
              top: 44,
              right: 24,
              bottom: 36,
              left: 24,
            ),
            decoration: BoxDecoration(
              // Trang trí khung chứa giao diện
              color: const Color(0xFFF8FAFC), // Màu nền trắng xám nhạt
              borderRadius: BorderRadius.circular(
                44,
              ), // Bo tròn 4 góc khung điện thoại
              border: Border.all(
                color: const Color(0xFFCBD5E1),
                width: 3,
              ), // Viền bo xám xung quanh
            ),
            child: Column(
              // Sắp xếp các phần tử con theo chiều dọc
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Căn trái các phần tử
              children: [
                _buildTopBar(), // Thanh tiêu đề trên cùng (Back icon, Title, Share icon)
                const SizedBox(height: 24), // Khoảng trống giữa các phần
                _buildProfileHeader(), // Phần Avatar, Tên, Chức danh, Địa điểm
                const SizedBox(height: 24),
                _buildStatsCard(), // Thẻ chỉ số thống kê (Dự án, Kinh nghiệm, Đánh giá)
                const SizedBox(height: 24),
                _buildAboutMe(), // Phần đoạn văn giới thiệu bản thân
                const SizedBox(height: 24),
                _buildSkillsExpertise(), // Danh sách thẻ kỹ năng chuyên môn
                const SizedBox(height: 24),
                _buildFeaturedProjects(), // Danh sách các dự án nổi bật
                const SizedBox(height: 24),
                _buildContactCard(), // Thẻ thông tin liên hệ (Email, SĐT)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Phương thức tạo thanh Top Bar ở trên cùng
  Widget _buildTopBar() {
    return SizedBox(
      height: 42,
      child: Row(
        // Sắp xếp các thành phần theo chiều ngang
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn đều khoảng cách giữa 3 phần tử (Back, Title, Share)
        children: [
          _buildIconButton(
            Icons.arrow_back_ios_new_rounded,
          ), // Nút mũi tên quay lại
          const Text(
            'Profile', // Tiêu đề trang
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold, // Chữ in đậm
              color: Color(0xFF0F172A), // Màu chữ xanh đen sẫm
            ),
          ),
          _buildIconButton(Icons.share_outlined), // Nút chia sẻ
        ],
      ),
    );
  }

  // Widget tạo nút bấm hình vuông nhỏ chứa icon dùng chung
  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white, // Nền trắng
        borderRadius: BorderRadius.circular(12), // Bo góc nhẹ
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1,
        ), // Đường viền mảnh
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: 18,
        height: 18,
        child: Center(
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF0F172A),
          ), // Hiển thị icon được truyền vào
        ),
      ),
    );
  }

  // Phương thức tạo phần thông tin cá nhân (Avatar + Tên + Chức danh + Vị trí)
  Widget _buildProfileHeader() {
    return SizedBox(
      width: double.infinity, // Mở rộng tối đa chiều rộng
      child: Column(
        // Sắp xếp theo chiều dọc
        crossAxisAlignment:
            CrossAxisAlignment.center, // Căn giữa theo chiều ngang
        children: [
          // Khung Avatar có viền Gradient dải màu và tích xanh Verified
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              // Xếp chồng các lớp lên nhau (Gradient background -> Trắng -> Ảnh avatar -> Icon tích xanh)
              alignment: Alignment.center,
              children: [
                // Vòng tròn màu viền ngoài dạng Gradient chuyển màu
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFB088),
                        Color(0xFFFF8080),
                        Color(0xFFFFCF71),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // Vòng tròn đệm màu trắng để tách avatar với viền gradient
                Container(
                  width: 132,
                  height: 132,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                // Ảnh đại diện cá nhân (Avatar) từ thư mục assets 'images/avatar.png'
                const SizedBox(
                  width: 124,
                  height: 124,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                ),
                // Biểu tượng dấu tích xanh "Verified" ở góc dưới bên phải avatar
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0284C7), // Màu xanh lam
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ), // Viền trắng bao quanh nút tích
                    ),
                    child: const SizedBox(
                      width: 16,
                      height: 16,
                      child: Center(
                        child: Icon(Icons.check, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Tên cá nhân
          const Text(
            'Alex Rivers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          // Vị trí/Chức danh công việc
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),
          // Thẻ hiển thị địa điểm (Location chip)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9), // Màu nền xám xanh nhạt
              borderRadius: BorderRadius.circular(
                20,
              ), // Bo tròn dạng viên thuốc (Pill)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Chiều rộng vừa đủ theo nội dung
              children: [
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: Center(
                    child: Icon(
                      Icons.location_on_outlined, // Icon vị trí
                      size: 14,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Tokyo, Japan', // Tên thành phố, quốc gia
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Phương thức tạo thẻ thống kê (Số dự án, Số năm kinh nghiệm, Đánh giá)
  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // Đổ bóng nhẹ phía dưới thẻ
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Căn đều các mục thống kê
        children: [
          _buildStatItem('148', 'Projects'), // Mục 1: Số lượng dự án
          Container(
            width: 1,
            height: 28,
            color: const Color(0xFFE2E8F0),
          ), // Dải phân cách dọc 1
          _buildStatItem('9 Yrs', 'Experience'), // Mục 2: Số năm kinh nghiệm
          Container(
            width: 1,
            height: 28,
            color: const Color(0xFFE2E8F0),
          ), // Dải phân cách dọc 2
          _buildStatItem(
            '4.9 ★',
            'Rating',
            isHighlight: true,
          ), // Mục 3: Điểm đánh giá (Nổi bật màu cam)
        ],
      ),
    );
  }

  // Widget hiển thị một phần tử thông số thống kê
  Widget _buildStatItem(
    String value,
    String label, {
    bool isHighlight =
        false, // Biến kiểm tra xem có làm nổi bật màu chữ hay không
  }) {
    return Column(
      children: [
        Text(
          value, // Giá trị con số (VD: 148, 9 Yrs, 4.9 ★)
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: isHighlight
                ? const Color(0xFFF59E0B) // Màu cam vàng nếu là mục nổi bật
                : const Color(0xFF0F172A), // Màu xanh đen sẫm mặc định
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label, // Nhãn mô tả bên dưới (VD: Projects, Experience, Rating)
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // Phương thức tạo phần "About Me" (Mô tả bản thân)
  Widget _buildAboutMe() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me', // Tiêu đề mục
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant', // Nội dung mô tả bản thân
          style: TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF475569)),
        ),
      ],
    );
  }

  // Phương thức tạo phần "Skills & Expertise" (Kỹ năng chuyên môn)
  Widget _buildSkillsExpertise() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise', // Tiêu đề mục kỹ năng
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        // Wrap tự động xuống dòng khi danh sách các thẻ quá dài theo chiều ngang
        Wrap(
          spacing: 8, // Khoảng cách ngang giữa các thẻ chip
          runSpacing: 8, // Khoảng cách dọc giữa các dòng
          children: [
            _buildSkillChip(
              'Flutter',
              Icons.flutter_dash,
              const Color(0xFF0284C7),
              const Color(0xFFE0F2FE),
            ),
            _buildSkillChip(
              'Dart',
              Icons.code,
              const Color(0xFF16A34A),
              const Color(0xFFDCFCE7),
            ),
            _buildSkillChip(
              'Clean Arch',
              Icons.layers,
              const Color(0xFFE11D48),
              const Color(0xFFFFE4E6),
            ),
            _buildSkillChip(
              'UI/UX',
              Icons.design_services,
              const Color(0xFF9333EA),
              const Color(0xFFF3E8FF),
            ),
            _buildSkillChip(
              'Firebase',
              Icons.local_fire_department,
              const Color(0xFFD97706),
              const Color(0xFFFEF3C7),
            ),
          ],
        ),
      ],
    );
  }

  // Widget tạo thẻ Chip hiển thị tên kỹ năng kèm icon và màu sắc tương ứng
  Widget _buildSkillChip(
    String label,
    IconData icon,
    Color contentColor, // Màu chữ và màu icon
    Color bgColor, // Màu nền của thẻ chip
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8), // Bo góc thẻ chip
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Center(child: Icon(icon, size: 14, color: contentColor)),
          ),
          const SizedBox(width: 6),
          Text(
            label, // Tên kỹ năng
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: contentColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  // Phương thức tạo phần "Featured Projects" (Các dự án tiêu biểu)
  Widget _buildFeaturedProjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Projects', // Tiêu đề mục dự án
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        // Hàng chứa 2 thẻ dự án nằm song song
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProjectCard(
              'E-Shop Flutter',
              'Mobile App • 2026',
              'images/project1.png',
            ),
            _buildProjectCard(
              'Crypto Vault',
              'Finance • Clean Arch',
              'images/project2.png',
            ),
          ],
        ),
      ],
    );
  }

  // Widget tạo thẻ hiển thị thông tin 1 dự án (Hình ảnh, Tiêu đề, Phụ đề)
  Widget _buildProjectCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 165,
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cắt bo góc phía trên của ảnh cho trùng với viền thẻ
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath, // Nguồn ảnh từ assets
              width: 165,
              height: 85,
              fit: BoxFit.cover, // Cắt ảnh tỉ lệ phù hợp khung
              // errorBuilder: Hiển thị giao diện thay thế nếu ảnh bị lỗi hoặc không tìm thấy
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 165,
                  height: 85,
                  color: const Color(0xFFE2E8F0),
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF94A3B8),
                    size: 32,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // Tên dự án
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle, // Mô tả ngắn/Thể loại dự án
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Phương thức tạo thẻ danh sách thông tin liên hệ (Contact Information)
  Widget _buildContactCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildContactRow(
            Icons.alternate_email,
            'Contact Information',
          ), // Dòng tiêu đề liên hệ
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF1F5F9),
          ), // Đường gạch ngang phân cách
          _buildContactRow(
            Icons.mail_outline,
            'alex.rivers@email.com',
          ), // Dòng Email liên hệ
          const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
          _buildContactRow(
            Icons.phone_outlined,
            '+81 (90) 1234-5678',
          ), // Dòng Số điện thoại
          const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
        ],
      ),
    );
  }

  // Widget tạo từng dòng hàng mục liên hệ dùng chung
  Widget _buildContactRow(
    IconData icon,
    String text, {
    bool hideChevron = false, // Ẩn/hiện mũi tên chỉ sang phải
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Khung vuông nhỏ chứa Icon đại diện cho mục liên hệ
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: 16,
              height: 16,
              child: Center(
                child: Icon(icon, size: 16, color: const Color(0xFF475569)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Đoạn text nội dung (Email / SĐT / Tiêu đề)
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
          // Nếu hideChevron = false thì hiển thị thêm icon mũi tên sang phải '>'
          if (!hideChevron)
            const Icon(Icons.chevron_right, size: 20, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }
}
