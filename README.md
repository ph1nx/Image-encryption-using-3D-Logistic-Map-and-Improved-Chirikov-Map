# Image Encryption using 3D Logistic Map and Improved Chirikov Map

A MATLAB implementation of a novel image encryption algorithm that combines 3D Logistic Map and Improved Chirikov Map for secure and robust image encryption with enhanced randomization and cryptographic strength. ([Research Paper](https://ieeexplore.ieee.org/document/10009076))

## 🔒 Overview

This repository contains the **original implementation** of the scripts used in the research paper "[A Novel Image Encryption using 3D Logistic Map and Improved Chirikov Map](https://ieeexplore.ieee.org/document/10009076)" published in the 2022 International Conference on Advances in Computing, Communication and Materials (ICACCM). The implementation utilizes chaotic maps for superior security performance through a two-phase approach combining confusion and diffusion techniques to achieve high-level encryption security.

## ✨ Key Features

- **Dual-Phase Encryption**: Combines 3D Logistic Map (diffusion) and Improved Chirikov Map (confusion)
- **High Key Sensitivity**: Minor key changes result in completely different outputs  
- **Superior Randomization**: 3D Logistic Map provides better chaos characteristics
- **Bit-Level Scrambling**: Enhanced security through binary manipulation
- **Multi-Channel Support**: Works with RGB color images

## 🛠️ Algorithm Components

### 3D Logistic Map
- Generates highly chaotic sequences with improved randomness
- Uses coupled equations: `x(i+1) = l*x(i)*(1-x(i)) + b*y(i)²*x(i) + a*z(i)³`
- Provides diffusion through XOR operations with chaotic sequences

### Improved Chirikov Map  
- Modified version of standard Chirikov map for pixel position shuffling
- Enhanced parameters: `kk = 2 + exp(mod(h + 10*sin(k) + k, 2π))`
- Bit-level scrambling for maximum confusion

## 🔄 Encryption Process

1. **3D Logistic Map Generation**: Creates chaotic sequences for R, G, B channels
2. **Diffusion Phase**: Pixel values multiplied with chaotic sequences and XORed
3. **Confusion Phase**: Bit-level scrambling using Improved Chirikov Map
4. **Final Encryption**: Combined output of both phases

## 📁 File Structure

- `main.m` - Main encryption/decryption pipeline
- `encrypt.m` - Encryption function
- `decrypt.m` - Corresponding decryption function
- `lena.png` - Sample test image

## 🚀 Usage

```
% Run the complete encryption/decryption process
run main.m

% Individual encryption with custom key
key = [1.5, 2.3, 0.8, 1.2];
[encrypted, key] = encrypt(image, key);

% Encryption with random key
[encrypted, key] = encrypt(image);

% Decryption
decrypted = decrypt(encrypted, key);
```


## 📊 Security Analysis Features

The implementation includes:
- **Entropy Analysis**: Measures randomness of encrypted images
- **Histogram Analysis**: Visual comparison of pixel distributions
- **Key Space**: Large key space with 4-parameter keys for Chirikov Map
- **Chaotic Behavior**: 3D Logistic Map with parameters (a=0.0125, b=0.0157, l=3.77)

## 🔧 Requirements

- MATLAB R2018b or later
- Image Processing Toolbox

## 📈 Performance Metrics

The algorithm generates:
- High entropy values for encrypted images
- Uniform histogram distribution
- Strong correlation disruption between adjacent pixels
- Resistance to statistical attacks

## 📚 Research Paper

**Title**: "A Novel Image Encryption using 3D Logistic Map and Improved Chirikov Map"

**Authors**: C. J. Ramakrishna, D. B. K. Reddy, B. V. Bharadwaj, S. Agrawal, G. Hegde

**Published**: 2022 International Conference on Advances in Computing, Communication and Materials (ICACCM)

**DOI**: [10.1109/ICACCM56405.2022.10009076](https://ieeexplore.ieee.org/document/10009076)

## 🏷️ Keywords

`Image Encryption` `Chaotic Maps` `3D Logistic Map` `Chirikov Map` `MATLAB` `Cryptography` `Bit Scrambling`

## 📝 Citation

If you find this algorithm and repository helpful in your research, please cite our original research paper:
```
@INPROCEEDINGS{10009076,
author={Ramakrishna, C. J. and Reddy, D. B. K. and Bharadwaj, B. V. and Agrawal, S. and Hegde, G.},
booktitle={2022 International Conference on Advances in Computing, Communication and Materials (ICACCM)},
title={A Novel Image Encryption using 3D Logistic Map and Improved Chirikov Map},
year={2022},
volume={},
number={},
pages={1-7},
doi={10.1109/ICACCM56405.2022.10009076}
}
```
---

*For detailed mathematical formulations and security analysis, please refer to the research paper.*

