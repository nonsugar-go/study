# Heap Exploitation

- https://github.com/shellphish/how2heap

## ヒープチャンク

- size == next->prev_size

|解放済(空き)|           | |確保済 (利用中)|        |
|-----------|-----------|-------------|-----------|
|___________|SIZE____AM1| |prev_size__|SIZE____AMP|
|fd_________|bk_________| |data_______|data_______|
|fd_nextsize|bk_nextsize| |data_______|data_______|
|___________|___________| |data_______|data_______|
|___________|___________| |data_______|data_______|
|(prev_size)|(size)     | |data_______|(size)____1|
|~~~~~~~~~~~|~~~~~~~~~~~| |~~~~~~~~~~~|~~~~~~~~~~~|
|<------0x10 byte------>| |<------0x10 byte------>|
