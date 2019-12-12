import json

def main(file_path, out_len):
    with open(file_path, 'r') as f:
        data = json.loads(f.read())
        print(len(data['data']))

        data['data'] = data['data'][:out_len]
    with open(file_path + 'new.json', 'w') as f:
        print(len(data['data']))
        json.dump(data, f)


if __name__ == "__main__":
    main('data/train-v1.1.json', 10)
    main('data/dev-v1.1.json', 2)
