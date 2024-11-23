import tkinter as tk
from tkinter import messagebox
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import joblib

# Load the pre-trained model
model = joblib.load('random_forest_model.pkl')

# Define the single feature 'amt'
features = ['amt']

class PredictionApp:
    def __init__(self, master):
        self.master = master
        master.title("Fraud Prediction")

        # Set the window size to 40x40
        master.geometry("400x400")

        # Create the label and entry for the 'amt' feature
        self.label = tk.Label(master, text='Enter Transaction Amount (amt):')
        self.label.pack()

        self.entry = tk.Entry(master)
        self.entry.pack()

        # Create a button to trigger prediction
        self.predict_button = tk.Button(master, text="Predict", command=self.predict)
        self.predict_button.pack()

    def predict(self):
        try:
            # Get the 'amt' value from the input
            amt_value = float(self.entry.get())

            # Reshape input for prediction
            input_array = np.array([amt_value]).reshape(1, -1)

            # Make prediction
            prediction = model.predict(input_array)

            # Show the prediction result
            result = 'Fraud' if prediction[0] == 1 else 'Not Fraud'
            messagebox.showinfo("Prediction Result", f"Fraud Prediction: {result}")

        except ValueError:
            # Handle invalid input (non-numeric)
            messagebox.showerror("Input Error", "Please enter a valid numerical value for the transaction amount.")

if __name__ == "__main__":
    root = tk.Tk()
    app = PredictionApp(root)
    root.mainloop()
