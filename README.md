# machine-learning-project

# EEG-based Emotion Recognition using Windowing Techniques

This project implements an **EEG-based emotion recognition model** that classifies emotions based on the **Valence** and **Arousal** dimensions.  
We use **windowing techniques** to segment EEG signals, extract time- and frequency-domain features, and train multiple machine learning models to evaluate performance.

## 📄 Overview

- **Dataset:** DREAMER dataset – 23 participants, 18 recordings each.
- **Labels:**  
  - **Arousal** – the intensity of emotion (low = calm, high = excited).  
  - **Valence** – the pleasantness of emotion (negative = unpleasant, positive = pleasant).  
- **Feature Extraction:** From each time window, we extract:
  - Mean, standard deviation
  - Power in EEG frequency bands: Delta, Theta, Alpha, Beta, Gamma
- **Window Types Tested:**
  - 5s non-overlapping  
  - 10s non-overlapping  
  - 5s with 2s overlap (stride)  
  - 10s with 2s overlap (stride)
- **Models Used:**
  - **KNN** (K-Nearest Neighbors)
  - **SVM** (Support Vector Machine)
  - **RF** (Random Forest)

## 🧠 Emotion Dimensions

The emotion space is represented using **Valence-Arousal Model**:

| Dimension | Low Value Example | High Value Example |
|-----------|-------------------|--------------------|
| **Valence** | Sad, Angry        | Happy, Relaxed     |
| **Arousal** | Sleepy, Calm      | Excited, Stressed  |

Emotions can be mapped into quadrants using these two dimensions.

## 📂 Project Structure


Each folder contains:
- **hold_out_*** – Preprocessing and hold-out split for the given configuration
- **knn_model_*** – KNN model training and evaluation
- **rf_model_*** – Random Forest model training and evaluation
- **svm_model_*** – SVM model training and evaluation

## 📊 Best Results

![Best Results](<img width="1473" height="968" alt="bestresult" src="https://github.com/user-attachments/assets/9d7812bf-445f-44a0-b79e-e6b52315aadd" />.png)

**Key Insights:**
- **Random Forest (RF)** achieved the highest accuracy in most configurations.
- **KNN** performed competitively, close to RF in several cases.
- **SVM** was weaker without overlap but improved significantly with larger windows and overlap.
- Overlapping windows generally **improved accuracy**, especially for SVM.
- With **stride**, larger window sizes often yielded better performance.
