import numpy as np
from pydub import AudioSegment
import matplotlib.pyplot as plt

def plot_spectrum(audio_data, sample_rate, title):
    """
    Plot the frequency spectrum of the audio data.
    """
    # Compute the FFT of the audio data
    spectrum = np.fft.fft(audio_data)
    frequencies = np.fft.fftfreq(len(spectrum), d=1/sample_rate)

    # Only consider the positive frequencies (real)
    plt.plot(frequencies[:len(frequencies)//2], np.abs(spectrum[:len(frequencies)//2]))
    plt.title(title)
    plt.xlabel("Frequency (Hz)")
    plt.ylabel("Amplitude")
    plt.show()

def add_high_frequency_noise(audio_data, sample_rate):
    """
    Adds high-frequency noise above 20kHz to audio data.
    """
    # Generate high-frequency sinusoids (e.g., at 2kHz, 4kHz, 8kHz)
    t = np.arange(len(audio_data))
    noise = np.sin(2 * np.pi * 2000 * t / sample_rate)
    noise += np.sin(2 * np.pi * 4000 * t / sample_rate)
    noise += np.sin(2 * np.pi * 8000 * t / sample_rate)
    # The amplitude of the noise is enhanced for clear demonstration
    noisy_data = audio_data + 1000 * noise

    # Ensure data remains within 16-bit range after adding noise
    noisy_data = np.clip(noisy_data, -32768, 32767)

    return noisy_data.astype(np.int16)

if __name__ == "__main__":
    # Load the MP3 file
    audio = AudioSegment.from_mp3("free_noise_input_file.wav")
    
    # Convert stereo to mono (if stereo)
    audio = audio.set_channels(1)

    # Extract raw data and sample rate
    samples = np.array(audio.get_array_of_samples())
    sample_rate = audio.frame_rate

    # Plot original audio spectrum
    plot_spectrum(samples, sample_rate, "Original Audio Spectrum")

    # Add high-frequency noise
    noisy_samples = add_high_frequency_noise(samples, sample_rate)

    # Plot noisy audio spectrum
    plot_spectrum(noisy_samples, sample_rate, "Noisy Audio Spectrum")

    # Convert back to AudioSegment for exporting
    noisy_audio = AudioSegment(
        noisy_samples.tobytes(),
        frame_rate=audio.frame_rate,
        sample_width=2,  # 16-bit samples
        channels=1
    )

    # Save the noisy audio to a file
    noisy_audio.export("noisy_output.wav", format="wav")
