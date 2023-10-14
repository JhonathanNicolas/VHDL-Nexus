import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import firwin, freqz

def generate_fir_filter(taps=64, cutoff=1000, fs=44100):
    """
    Generate FIR filter coefficients using the windowing method.
    
    Parameters:
    - taps: Number of filter coefficients (filter order + 1).
    - cutoff: Cutoff frequency for the low-pass filter.
    - fs: Sampling frequency.
    
    Returns:
    - h: Filter coefficients.
    """
    # Use the firwin function with a Hamming window to design the FIR filter
    h = firwin(taps, cutoff, window="hamming", fs=fs)
    return h

if __name__ == "__main__":
    fs = 44100  # Sampling frequency
    cutoff = 1000  # Desired cutoff frequency
    taps = 64  # Number of filter coefficients
    
    # Generate the FIR filter coefficients
    h = generate_fir_filter(taps, cutoff, fs)
    
    # Calculate and plot the frequency response of the FIR filter
    w, H = freqz(h, worN=8000)
    plt.plot(0.5 * fs * w / np.pi, np.abs(H), 'b')
    plt.title("Frequency Response of the FIR Filter")
    plt.xlabel("Frequency [Hz]")
    plt.ylabel("Magnitude")
    plt.grid()
    plt.show()

    # Optionally: Save the filter coefficients to a file for VHDL implementation
    np.savetxt("fir_coefficients.txt", h)
