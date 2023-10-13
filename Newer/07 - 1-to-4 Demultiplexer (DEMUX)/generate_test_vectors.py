import random

def generate_test_vectors(seed):
    random.seed(seed)
    input_data = [random.choice(['0', '1']) for _ in range(16)]
    input_select = [random.choice(['00', '01', '10', '11']) for _ in range(16)]
    expected_results = []

    for data, sel in zip(input_data, input_select):
        if sel == "00":
            expected_results.append(data + '000')
        elif sel == "01":
            expected_results.append('0' + data + '00')
        elif sel == "10":
            expected_results.append('00' + data + '0')
        elif sel == "11":
            expected_results.append('000' + data)
    
    return input_data, input_select, expected_results


if __name__ == "__main__":
    with open("seeds.txt", "r") as seed_file:
        seeds = [line.strip() for line in seed_file]

    all_input_data = []
    all_input_select = []
    all_expected_results = []

    for seed in seeds:
        input_data, input_select, expected_results = generate_test_vectors(seed)
        all_input_data.extend(input_data)
        all_input_select.extend(input_select)
        all_expected_results.extend(expected_results)

    with open("inputs_data.txt", "w") as f:
        for item in all_input_data:
            f.write("%s\n" % item)

    with open("inputs_select.txt", "w") as f:
        for item in all_input_select:
            f.write("%s\n" % item)

    with open("expected_results.txt", "w") as f:
        for item in all_expected_results:
            f.write("%s\n" % item)
