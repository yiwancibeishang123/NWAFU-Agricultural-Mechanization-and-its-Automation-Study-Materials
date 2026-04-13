import tkinter as tk
from tkinter import filedialog
from PIL import Image, ImageDraw, ImageFont, ImageTk
from ultralytics import YOLO


def detect_objects():
    results = model(selected_image_path.get())

    original_image = Image.open(selected_image_path.get())
    draw = ImageDraw.Draw(original_image)

    class_mapping = {0: 'kiwifruit', 1: 'Non'}

    font = ImageFont.truetype("arial.ttf", 15)

    conf, cls_idx = results[0].boxes.data.tolist()[0][-2:]
    boxes = results[0].boxes.xyxy.tolist()
    for box in boxes:
        x1, y1, x2, y2 = box

        draw.rectangle([x1, y1, x2, y2], outline='yellow', width=2)

        label = f'{class_mapping[int(cls_idx)]} {conf:.2f}'
        draw.text((x1, y1), label, fill='blue', font=font)

    original_image = original_image.resize((400, 400))
    tk_image = ImageTk.PhotoImage(original_image)
    selected_image_label.configure(image=tk_image)
    selected_image_label.image = tk_image


def select_image():
    file_path = filedialog.askopenfilename(title="选择一张图片", filetypes=[("图片文件", "*.jpg;*.png;*.jpeg;*.bmp")])
    if file_path:
        selected_image_path.set(file_path)
        # 显示选定的图片
        selected_image = Image.open(file_path)
        selected_image = selected_image.resize((400, 400))
        tk_image = ImageTk.PhotoImage(selected_image)
        selected_image_label.configure(image=tk_image)
        selected_image_label.image = tk_image


root = tk.Tk()
root.title("猕猴桃果实识别系统")
root.geometry("550x600")

selected_image_path = tk.StringVar()

model = YOLO(r'C:\Users\32347\Desktop\ultralytics-8.1.0\runs\detect\train5\weights\best.pt')

select_button = tk.Button(root, text="选择图片", command=select_image, width=15, height=2)
select_button.place(x=80, y=480)

label_name = tk.Label(root, text="机化2201 黄钊伟 2022013106", font=("Arial", 15))  # 设置字体和大小
label_name.pack(pady=20)
label_name.place(x=120, y=20)

detect_button = tk.Button(root, text="检测目标", command=detect_objects, width=15, height=2)
detect_button.place(x=340, y=480)
selected_image_label = tk.Label(root)
selected_image_label.place(x=70, y=60)
image_label = tk.Label(root)
image_label.place(x=500, y=60)
root.mainloop()
