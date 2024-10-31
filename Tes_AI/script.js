// Google Generative AI API Key
import { GoogleGenerativeAI } from "@google/generative-ai";
const apiKey = 'AIzaSyAGMqsGgzkavz4JLx_IDW92OqDybtUxwt0'; // Replace with your actual API key
const apiUrl = `https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=${apiKey}`;
const genAI = new GoogleGenerativeAI(apiKey);
const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

// Send user message to the AI and get response
async function sendMessage() {
    const userInput = document.getElementById("user-input").value;
    const chatLog = document.getElementById("chat-log");

    if (!userInput) {
        alert("Please enter a message.");
        return;
    }

    // Add user message to chat log
    chatLog.innerHTML += `<p><strong>You:</strong> ${userInput}</p>`;
    document.getElementById("user-input").value = ''; // Clear input

    // Show loading indicator
    chatLog.innerHTML += `<p><em>AI is typing...</em></p>`;
    
    // Construct the prompt and send request to Google Generative AI API
    try {
        const response = await fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                prompt: {
                    text: userInput // Send user input as prompt
                },
                temperature: 0.7, // Adjust creativity level
                maxOutputTokens: 150 // Limit response length
            })
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        const aiResponse = data.candidates[0].output;

        // Replace "AI is typing..." with actual AI response
        chatLog.innerHTML = chatLog.innerHTML.replace('<p><em>AI is typing...</em></p>', `<p><strong>AI:</strong> ${aiResponse}</p>`);
    } catch (error) {
        console.error('Error:', error);
        chatLog.innerHTML = chatLog.innerHTML.replace('<p><em>AI is typing...</em></p>', '<p><strong>AI:</strong> Error occurred.</p>');
    }

    // Scroll to the bottom of the chat log
    chatLog.scrollTop = chatLog.scrollHeight;
}

// Placeholder functions for other options
function createImage() { alert("Image creation feature coming soon!"); }
function analyzeData() { alert("Data analysis feature coming soon!"); }
function summarizeText() { alert("Summarization feature coming soon!"); }
function helpMeWrite() { alert("Writing assistance feature coming soon!"); }
function moreOptions() { alert("More options coming soon!"); }
