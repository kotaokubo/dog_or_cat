FROM python:3.9

# ワークディレクトリのセット
WORKDIR /app

# 依存関係のインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install scikit-learn

RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx

# アプリケーションコードのコピー
COPY . .

# アプリケーションの実行
CMD [ "python", "./predict.py" ]
