# generate_test_vectors.py

import random

def generate_test_vectors(seed_file="seeds.txt"):
    # Lists to hold the generated test vectors
    input_select = []
    input_data = []
    expected_results = []

    # Load seeds from file
    with open(seed_file, "r") as f:
        seeds = [int(line.strip()) for line in f]

    # Loop through all seeds
    for seed in seeds:
        random.seed(seed)  # Set the random seed for reproducibility

        for _ in range(16):  # Generate 16 sets for each seed
            selector = random.randint(0, 3)  # 00, 01, 10, 11
            data = random.randint(0, 15)  # Possible 4-bit data inputs (0000 to 1111)

            input_select.append(bin(selector)[2:].zfill(2))
            input_data.append(bin(data)[2:].zfill(4))
            selected_bit = (data >> (3 - selector)) & 1  # Extract the selected bit
            expected_results.append(bin(selected_bit)[2:].zfill(4))  # The selected bit is made 4 bits long for consistency.

    # Write to files
    with open("inputs_select.txt", "w") as f:
        for item in input_select:
            f.write("%s\n" % item)

    with open("inputs_data.txt", "w") as f:
        for item in input_data:
            f.write("%s\n" % item)

    with open("expected_results.txt", "w") as f:
        for item in expected_results:
            f.write("%s\n" % item)

    print("Test vectors generated based on seeds successfully!")

if __name__ == "__main__":
    generate_test_vectors()
