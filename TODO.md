# Import Wallet Flow Implementation

## Pending Tasks
- [x] Create import_slide1_metode.dart: Page for selecting import method (Recovery Phrase, Private Key, File Keystore) with "Lanjutkan" button.
- [x] Create import_slide2_input.dart: Page for input based on selected method (multi-line for phrase, single-line for key, file picker for keystore) with "Lanjutkan" button.
- [x] Create import_slide3_password.dart: Page for setting up new password with validation, similar to slide2_password.dart, navigates to loading.
- [x] Create import_slide4_loading.dart: Loading page with progress indicator and "Mengimpor dompet..." text, auto-navigates to success after 3 seconds.
- [x] Create import_slide5_success.dart: Success page showing dummy wallet address and balance, with "Masuk ke Dompet" button.
- [x] Update buat_dompet_page.dart: Add navigation from "IMPOR DOMPET YANG ADA" to import_slide1_metode.
- [x] Test the flow for navigation and UI consistency (flutter analyze completed, no errors in new files).

# Recovery Wallet Flow Implementation

## Pending Tasks
- [ ] Create recovery_slide1_context.dart: Context slide with illustration, title "Pemulihan Dompet", description, reasons list, "Mulai Pemulihan" button.
- [ ] Create recovery_slide2_input.dart: Input recovery phrase with multi-line text area, validation (12/24 words), tips section.
- [ ] Create recovery_slide3_validation.dart: Validation results display, checkbox for confirmation, "Lanjutkan Pemulihan" button.
- [ ] Create recovery_slide4_security.dart: Setup new password with confirm field, biometric toggle option.
- [ ] Create recovery_slide5_process.dart: Progress steps with loading animation, auto-navigate after 3 seconds.
- [ ] Create recovery_slide6_success.dart: Success screen with wallet summary, button to setup_keamanan_page.dart.
- [ ] Update buat_dompet_page.dart: Add onTap navigation from "MEMULIHKAN DOMPET" to recovery_slide1_context.dart.
- [ ] Update TODO.md: Add new section for recovery flow tasks (completed).
- [ ] Test the recovery flow for navigation and UI consistency.
