import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt

def generate_fir_filter(num_taps=16, cutoff=1000, fs=48000):
    # Design the FIR filter using the window method
    taps = signal.firwin(num_taps, cutoff, fs=fs)
    
    # Normalize taps to have maximum value close to 32767
    normalized_taps = np.round(taps * (2**15 - 1))
    
    return normalized_taps

def save_taps_to_file(taps, filename):
    with open(filename, 'w') as f:
        for tap in taps:
            # Convert the tap to a 16-bit hexadecimal number
            hex_val = format(int(tap) & 0xFFFF, '04X')
            f.write(hex_val + '\n')

if __name__ == "__main__":
    num_taps = 64
    fs = 48000  # Sampling frequency
    cutoff = 1000  # Desired cutoff frequency

    taps = generate_fir_filter(num_taps, cutoff, fs)
    
    # Plot the frequency response of the filter
    w, H = signal.freqz(taps, worN=8000)
    plt.plot(0.5 * fs * w / np.pi, np.abs(H), 'b')
    plt.title("Frequency Response of the FIR Filter")
    plt.xlabel('Frequency [Hz]')
    plt.ylabel('Gain')
    plt.grid()
    plt.show()

    # Save the taps to a file in hexadecimal format
    save_taps_to_file(taps, "rom_init.data")
