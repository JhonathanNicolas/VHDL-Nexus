import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import firwin, freqz

def generate_fir_filter(taps=64, cutoff=1000, fs=44100):
    h = firwin(taps, cutoff, window="hamming", fs=fs)
    return h

def quantize_to_16bits(data, scale_factor=32767):
    data_normalized = data / np.max(np.abs(data))
    quantized_data = np.round(data_normalized * scale_factor).astype(np.int16)
    return quantized_data

def plot_response(fs, h, title="Frequency Response"):
    w, H = freqz(h, worN=8000, fs=fs)
    plt.figure(figsize=(12, 6))
    plt.title(title)
    plt.plot(w, 20 * np.log10(np.abs(H)), 'b')
    plt.ylabel("Amplitude [dB]", color='b')
    plt.xlabel("Frequency [Hz]")
    plt.grid()
    plt.show()

if __name__ == "__main__":
    fs = 44100
    cutoff = 1000
    taps = 64
    
    # Generate the FIR filter coefficients
    h = generate_fir_filter(taps, cutoff, fs)
    plot_response(fs, h, "Original Filter Frequency Response")
    
    # Quantize the coefficients to 16 bits
    h_quantized = quantize_to_16bits(h)
    plot_response(fs, h_quantized, "Quantized Filter Frequency Response")
    
    # Optionally: Save the quantized coefficients to a file
    np.savetxt("quantized_fir_coefficients.txt", h_quantized, fmt="%d")
