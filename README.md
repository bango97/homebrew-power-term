# homebrew-power-term

Homebrew tap for [power-term](https://github.com/bango97/power-term) — SSH client và terminal manager hiện đại, xây dựng trên Tauri + React + xterm.js.

**Tính năng chính:**
- Terminal local (PTY) và SSH với nhiều tab, split pane
- Quản lý host với nhóm, tag, tìm kiếm
- SFTP dual-pane file browser
- Database browser (MySQL, Postgres, SQLite, MSSQL, Redis) qua SSH tunnel
- Port forwarding (local/remote)
- Snippet library cho các lệnh hay dùng
- **Sync đa thiết bị** — mã hóa AES-256-GCM trước khi upload

---

## Cài đặt

```bash
brew tap bango97/power-term
brew install --cask power-term
```

> **Lưu ý:** power-term chưa được Apple code-sign/notarize. Cask tự chạy `xattr -cr` sau khi cài, nhưng nếu macOS vẫn chặn khi mở lần đầu, hãy chạy thêm:
>
> ```bash
> xattr -cr /Applications/power-term.app
> ```

### Cài thủ công (DMG)

Tải DMG từ [Releases](https://github.com/bango97/power-term/releases), kéo vào `/Applications`, rồi chạy lệnh trên.

---

## Cập nhật

```bash
brew update
brew upgrade --cask power-term
```

---

## Hướng dẫn sử dụng

### 1. Thêm SSH key

Trước khi thêm host dùng xác thực bằng key, hãy đăng ký key vào registry để app quản lý tập trung.

1. Mở **Settings → SSH Keys** (hoặc panel Keys ở sidebar)
2. Nhấn **Add key**
3. Có hai cách nhập key:

   **Cách A — chọn file:**
   - Nhấn **Browse…** và chọn file private key (ví dụ `~/.ssh/id_ed25519`)
   - App tự đọc và lưu nội dung key vào database nội bộ
   - SSH vẫn hoạt động kể cả khi file bị xóa hoặc di chuyển sau này

   **Cách B — paste nội dung:**
   - Chuyển sang tab **Paste content**
   - Dán toàn bộ nội dung private key (từ `-----BEGIN OPENSSH PRIVATE KEY-----` đến `-----END OPENSSH PRIVATE KEY-----`)
   - Không cần file trên disk

4. Đặt tên dễ nhớ (ví dụ: `Personal`, `Work`) rồi nhấn **Save**

> **Tại sao nên dùng registry?** Khi sync, nội dung key được mã hóa và đồng bộ sang thiết bị khác — bạn không cần copy file key thủ công.

---

### 2. Thêm host

1. Nhấn **+** ở sidebar hoặc **Add host**
2. Điền thông tin:

   | Trường | Ví dụ |
   |--------|-------|
   | Name | `Production Web` |
   | Hostname | `192.168.1.10` hoặc `example.com` |
   | Port | `22` |
   | Username | `ubuntu` |
   | Group | `Work` (tùy chọn, để nhóm host trong sidebar) |
   | Tags | `prod`, `linux` (tùy chọn) |

3. Chọn phương thức xác thực:
   - **SSH agent** — dùng ssh-agent đang chạy trên máy
   - **Private key** — chọn key từ registry hoặc nhập đường dẫn trực tiếp; nhập passphrase nếu key có mã hóa (có thể lưu vào macOS Keychain)
   - **Password** — nhập password; có thể lưu vào macOS Keychain

4. Nhấn **Save**

Để kết nối, nhấn đúp vào host hoặc nhấn **Connect**.

---

### 3. Sync đa thiết bị

Sync dùng GitHub OAuth để xác thực và mã hóa dữ liệu nhạy cảm bằng **sync key** trước khi upload — server không bao giờ thấy password hay nội dung SSH key của bạn.

#### Lần đầu thiết lập sync (thiết bị chính)

1. Mở **Settings → Sync**
2. Nhấn **Sign in with GitHub** và hoàn tất OAuth
3. App tự tạo một **sync key** ngẫu nhiên (32 bytes, hiển thị dạng Base58 ~44 ký tự)
4. Nhấn **Show** rồi **Copy** để lấy sync key
5. **Lưu sync key này lại** — đây là chìa khóa giải mã dữ liệu trên thiết bị mới

> ⚠️ **Quan trọng:** Nếu mất sync key, dữ liệu mã hóa (password, SSH key content) trên cloud sẽ không thể giải mã. Lưu key vào password manager hoặc nơi an toàn.

#### Thiết lập sync trên thiết bị mới

1. Cài power-term và mở **Settings → Sync**
2. Nhấn **Sign in with GitHub** (cùng tài khoản)
3. Sau khi đăng nhập, app báo *"No sync key on this device"*
4. Dán sync key đã lưu từ thiết bị cũ vào ô **Paste base58 sync key…**
5. Nhấn **Save key**
6. Nhấn **Sync now** để kéo dữ liệu về

Tất cả host, snippet, SSH key, và settings sẽ được giải mã và khôi phục.

#### Sync thủ công

Nhấn **Sync now** bất cứ lúc nào trong tab Sync. Mọi thay đổi (thêm/sửa/xóa host, snippet, key) cũng được đẩy lên tự động ngay khi thực hiện.

---

### 4. Lưu và khôi phục sync key

Sync key là chuỗi Base58 khoảng 44 ký tự, ví dụ:

```
7xKp3mNqR8vWzYcBdFgHjLtUeAoSiXnPkQwMvCrZb2T
```

**Cách lưu an toàn:**
- Lưu vào password manager (1Password, Bitwarden, v.v.) với nhãn `power-term sync key`
- Hoặc lưu vào file text được mã hóa ở nơi an toàn

**Cách xem lại key trên thiết bị hiện tại:**
1. Mở **Settings → Sync**
2. Đăng nhập nếu chưa
3. Nhấn **Show** bên cạnh ô sync key

**Cách thay key (nếu muốn rotate):**
1. Dán chuỗi Base58 mới vào ô **Replace with key from another device**
2. Nhấn **Save key** — app sẽ re-encrypt và đẩy lại toàn bộ dữ liệu với key mới

---

### 5. Các tính năng khác

**SFTP:** Nhấn icon folder ở host → mở dual-pane file browser, kéo thả file giữa local và remote.

**Port forwarding:** Vào tab **Forwards** của host → thêm tunnel local hoặc remote → bật/tắt từng tunnel.

**Database browser:** Thêm DB connection vào host → mở tab DB để chạy query trực tiếp qua SSH tunnel.

**Snippets:** Lưu các lệnh hay dùng, tìm kiếm theo tên/tag, chèn vào terminal bằng một click.

**Split pane:** Kéo tab sang pane khác hoặc dùng layout picker (solo / 2 cột / 2 hàng / 3 cột / 2×2).

---

## Kiến trúc bảo mật

| Dữ liệu | Lưu ở đâu | Mã hóa |
|---------|-----------|--------|
| Host metadata (hostname, port, username) | Supabase (cloud) | Không (plaintext) |
| Password / passphrase | macOS Keychain (local) + Supabase | AES-256-GCM với sync key |
| SSH key content | SQLite (local) + Supabase | AES-256-GCM với sync key |
| Snippet content | SQLite (local) + Supabase | AES-256-GCM với sync key |
| Sync key | macOS Keychain (local only) | Không upload lên server |

Sync key **không bao giờ rời khỏi thiết bị của bạn** qua Supabase — bạn phải tự copy nó sang thiết bị mới.
