import random

def evaluate_results(a, b):
    eq = int(a == b)
    gt = int(a > b)
    lt = int(a < b)
    return eq, gt, lt

def generate_inputs(seed):
    random.seed(seed)
    combinations = [format(i, '04b') for i in range(16)]
    random.shuffle(combinations)
    return combinations

with open('seeds_test.txt', 'r') as seeds_file:
    for seed_line in seeds_file:
        seed = int(seed_line.strip())

        a_combinations = generate_inputs(seed)
        b_combinations = generate_inputs(seed+1)

        with open('input_a.txt', 'a') as f_a, open('input_b.txt', 'a') as f_b, open('EQUAL.txt', 'a') as f_eq, open('A_GREATTER_THAN_B.txt', 'a') as f_gt, open('A_LESS_THAN_B.txt', 'a') as f_lt:

            for a, b in zip(a_combinations, b_combinations):
                f_a.write(a + '\n')
                f_b.write(b + '\n')
                
                a_val = int(a, 2)
                b_val = int(b, 2)
                
                eq, gt, lt = evaluate_results(a_val, b_val)
                f_eq.write(str(eq) + '\n')
                f_gt.write(str(gt) + '\n')
                f_lt.write(str(lt) + '\n')
