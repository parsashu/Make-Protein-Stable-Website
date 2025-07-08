# Make Protein Stable 🧬

### AI-Powered Protein Stability Enhancement Tool

https://github.com/user-attachments/assets/WebSite.mp4

---

## 🚀 Overview

**Make Protein Stable** is an innovative web application that leverages artificial intelligence to enhance protein thermal stability through intelligent single amino acid modifications. Our custom-trained machine learning model analyzes protein sequences and suggests optimal mutations while preserving the original protein's functionality and 3D structure.

## ✨ Key Features

### 🔬 **AI-Powered Analysis**

- **Custom-Trained Model**: Developed from scratch and fine-tuned on curated datasets
- **Single-Point Mutations**: Intelligently suggests single amino acid modifications
- **Biological Constraints**: Uses BLOSUM substitution matrices and hydrophobicity patterns
- **High Accuracy**: Spearman's correlation coefficient of 0.7232

### 🎯 **Functionality Preservation**

- **Structure-Aware**: Maintains the original protein's 3D structure
- **Function Retention**: Designed to preserve biological functionality
- **Thermal Stability**: Enhances protein stability under varying temperature conditions

### 🎨 **User Experience**

- **Responsive Design**: Fully responsive across all device sizes
- **Easy Input**: Simple protein sequence text input
- **Real-time Results**: Instant analysis and mutation suggestions
- **Professional UI**: Modern, scientific interface design

## 🛠️ Technical Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Flask (Python) - API server for protein analysis
- **AI/ML**: Custom machine learning model for protein stability prediction
- **Deployment**: Web-based application (Chrome, Firefox, Safari, Edge)

## 📋 Installation & Setup

### Prerequisites

- Flutter SDK (latest stable version)
- Python 3.8+ (for API server)
- Chrome/Firefox/Safari/Edge browser

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/make_protein_stable.git
cd make_protein_stable
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

### 3. Set Up Python API Server (Optional)

```bash
# Install Python dependencies
pip install flask flask-cors numpy pandas scikit-learn

# The API server code can be found in api_server.py
# Run the server on localhost:5000
python api_server.py
```

### 4. Run the Application

```bash
# For web development
flutter run -d chrome

# For other platforms
flutter run -d <device>
```

## 🎯 Usage

1. **Open the Application**: Launch the app in your web browser
2. **Navigate to Tool**: Click "Try It Now" or scroll to the analysis section
3. **Input Sequence**: Paste your protein sequence in the text area
4. **Analyze**: Click "Improve Sequence" to start the analysis
5. **Review Results**: View the suggested mutations and optimized sequence

### Example Input

```
MGDVEKGKKIFVQKCAQCHTVEKGGKHKTGPNLHGLFGRKTGQAPGFTYTDANKNKGITWKEETLMEYLENPKKYIPGTKMIFAGIKKKTEREDIAYKKATNE
```

### Example Output

- **Mutation**: Position 19: H → E
- **Stability Change**: +10.84°C (approximate)
- **Status**: Enhanced thermal stability
- **Optimized Sequence**: Complete sequence with mutation applied

## 📁 Project Structure

```
make_protein_stable/
├── lib/
│   ├── main.dart                 # Application entry point
│   ├── models/                   # Data models
│   ├── screens/                  # App screens
│   ├── services/                 # API services
│   ├── themes/                   # App theming
│   └── widgets/                  # Reusable UI components
├── assets/
│   └── images/                   # Static images
├── web/                          # Web-specific files
├── pubspec.yaml                  # Flutter dependencies
└── README.md                     # This file
```

## 🔬 Scientific Background

### Methodology

Our AI system follows a comprehensive approach:

1. **Input Analysis**: Protein sequence analysis and feature extraction
2. **Variant Generation**: AI generates single-point amino acid variants
3. **Biological Filtering**: Applies BLOSUM and hydrophobicity constraints
4. **Stability Prediction**: Ranks variants based on predicted thermal stability (Tm)
5. **Optimization**: Suggests the most stable version for enhanced structural integrity

### Performance Metrics

- **Spearman's Correlation**: 0.7232 (strong correlation accuracy)
- **Model Type**: Custom-trained machine learning model
- **Training Data**: Curated protein stability datasets
- **Validation**: Rigorous cross-validation and testing protocols

## 📖 Documentation

For comprehensive technical documentation, including:

- Machine learning methodology
- Training process details
- Validation results
- Scientific foundation

**Access the full technical report**: [ML on Proteins.pdf](https://drive.google.com/drive/folders/1DIdfQ7AvZC-VDNecDFXa6xZILHpR8JKC?usp=sharing)

## 🤝 Contributing

We welcome contributions to improve the Make Protein Stable tool! Please feel free to:

1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

**Developed by Protein Stability Lab**

- Advanced AI/ML research in protein engineering
- Computational biology and bioinformatics
- Web application development

## 📞 Contact

- **Email**: a.zshahidi91@gmail.com
- **Project Repository**: [GitHub](https://github.com/your-username/make_protein_stable)

---

### 🌟 Made with ❤️ for the scientific community

_Enhancing protein stability through intelligent single amino acid modifications._
