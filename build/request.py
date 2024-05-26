import os
import threading
import time
import requests

url = os.environ["URL"]
expected_result = os.environ["EXPECTED_RESULT"]


def request_inference(i):
    start_time = time.time()

    response = requests.post(
        f"http://{url}/predict", files={"file": open("./image.jpg", "rb")}
    )
    predicted_class = response.json().get("predicted_class")

    if str(predicted_class) == expected_result:
        print(f"Request {i}: {time.time() - start_time} ms")
    else:
        print(f"Request {i}: Fail ({predicted_class})")


threads = []

for i in range(100):
    threads.append(threading.Thread(target=request_inference, args=(i,)))

total_start_time = time.time()

for i in range(100):
    threads[i].start()

for i in range(100):
    threads[i].join()

print(f"Total: {time.time() - total_start_time} ms")
