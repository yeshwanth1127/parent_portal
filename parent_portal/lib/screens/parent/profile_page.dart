import 'package:flutter/material.dart';
import '../../models/child_profile.dart';

/// Opening page of the app: child profile (picture, details, teacher, helpline).
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, ChildProfile? profile})
      : _profile = profile ?? ChildProfile.placeholder();

  final ChildProfile _profile;

  void _onEditPhoto(BuildContext context) {
    // TODO: Open image picker / camera for profile picture
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        title: const Text('Profile page'),
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          color: colorScheme.onPrimary,
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildProfilePicture(context),
            const SizedBox(height: 32),
            _buildInfoSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: colorScheme.primary.withOpacity(0.2),
              backgroundImage: _profile.profileImageUrl != null
                  ? NetworkImage(_profile.profileImageUrl!)
                  : null,
              child: _profile.profileImageUrl == null
                  ? Icon(
                      Icons.person,
                      size: 56,
                      color: colorScheme.primary,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => _onEditPhoto(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 20,
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(Edit)',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row(context, 'Name:', _profile.name),
          _row(context, "Parent's name:", _profile.parentName),
          _row(context, 'Ph. number:', _profile.phoneNumber),
          _row(context, 'E-mail:', _profile.email),
          _row(context, 'Address:', _profile.address),
          _row(context, 'Class:', _profile.className),
          _row(
            context,
            'Teacher assigned name & ph. no:',
            '${_profile.teacherName}  ${_profile.teacherPhoneNumber}',
          ),
          _row(context, 'Helpline no:', _profile.helplineNumber ?? '—'),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 16,
            color: colorScheme.onSurface,
            height: 1.4,
          ),
          children: [
            TextSpan(
              text: '$label ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: colorScheme.onSurface.withOpacity(0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
