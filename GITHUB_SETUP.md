# GitHub Setup Instructions

Follow these steps to upload your ModernOTP package to GitHub:

## 1. Create a New Repository on GitHub

1. Go to [GitHub](https://github.com)
2. Click the "+" icon in the top right → "New repository"
3. Repository name: `ModernOTP`
4. Description: "A beautiful, customizable OTP input component for SwiftUI with animated 3D particle background"
5. Choose Public or Private
6. **Do NOT** initialize with README, .gitignore, or license (we already have these)
7. Click "Create repository"

## 2. Initialize and Push Your Local Repository

Open Terminal and navigate to the ModernOTP directory, then run:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: ModernOTP v1.0.0"

# Add remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/ModernOTP.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

## 3. Create a Release Tag (Optional but Recommended)

This allows users to reference specific versions:

```bash
# Create and push a tag for version 1.0.0
git tag 1.0.0
git push origin 1.0.0
```

## 4. Update README with Correct GitHub URL

After creating the repository, update the installation URL in README.md:

Replace `https://github.com/yourusername/ModernOTP.git` with your actual GitHub URL.

## 5. Add Topics to Your Repository (Optional)

On your GitHub repository page:
1. Click "About" settings (gear icon)
2. Add topics like: `swift`, `swiftui`, `ios`, `otp`, `swift-package-manager`, `ui-components`

## Using the Package in Your Projects

### Method 1: Xcode

1. Open your project in Xcode
2. File → Add Package Dependencies
3. Enter: `https://github.com/YOUR_USERNAME/ModernOTP.git`
4. Select version or branch
5. Add to your target

### Method 2: Package.swift

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/YOUR_USERNAME/ModernOTP.git", from: "1.0.0")
]
```

Then add to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["ModernOTP"]
)
```

## Folder Structure

Your package should have this structure:

```
ModernOTP/
├── Package.swift
├── README.md
├── LICENSE
├── CHANGELOG.md
├── .gitignore
├── Sources/
│   └── ModernOTP/
│       ├── ModernOTPView.swift
│       ├── OTPConfiguration.swift
│       ├── OTPContainerView.swift
│       ├── OTPContainerConfiguration.swift
│       ├── AnimatedParticleBackground.swift
│       └── AnimatedBackgroundConfiguration.swift
└── Examples/
    └── ExampleUsage.swift
```

## Troubleshooting

### If you get authentication errors:

Use a personal access token instead of password:
1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token with `repo` scope
3. Use the token as your password when pushing

### If you need to change the remote URL:

```bash
git remote set-url origin https://github.com/YOUR_USERNAME/ModernOTP.git
```

## Making Updates

After making changes:

```bash
# Stage changes
git add .

# Commit changes
git commit -m "Description of changes"

# Push to GitHub
git push

# If releasing a new version, create a new tag
git tag 1.0.1
git push origin 1.0.1
```

## Documentation

Consider adding to your repository:
- Screenshots or GIFs in README
- Wiki pages for detailed guides
- Issues template
- Contributing guidelines
- Code of conduct

Good luck with your package! 🚀
