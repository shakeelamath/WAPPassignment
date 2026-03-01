// CosmoQuest Client-Side Validation and Utilities

// Form validation
function validateForm(formId) {
    var form = document.getElementById(formId);
    if (!form) return true;

    var inputs = form.querySelectorAll('input[required], textarea[required], select[required]');
    var isValid = true;

    inputs.forEach(function(input) {
        if (!input.value.trim()) {
            input.classList.add('input-validation-error');
            isValid = false;
        } else {
            input.classList.remove('input-validation-error');
        }
    });

    return isValid;
}

// Email validation
function validateEmail(email) {
    var re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    return re.test(email);
}

// Password strength indicator
function checkPasswordStrength(password) {
    var strength = 0;
    if (password.length >= 8) strength++;
    if (password.match(/[a-z]/)) strength++;
    if (password.match(/[A-Z]/)) strength++;
    if (password.match(/[0-9]/)) strength++;
    if (password.match(/[^a-zA-Z0-9]/)) strength++;

    var strengthText = ['Very Weak', 'Weak', 'Fair', 'Good', 'Strong'];
    var strengthColor = ['#dc2626', '#ef4444', '#f59e0b', '#10b981', '#059669'];

    return {
        score: strength,
        text: strengthText[strength - 1] || 'Very Weak',
        color: strengthColor[strength - 1] || '#dc2626'
    };
}

// Confirm delete action
function confirmDelete(itemName) {
    return confirm('Are you sure you want to delete ' + itemName + '? This action cannot be undone.');
}

// Quiz timer
var quizTimer;
function startQuizTimer(minutes, display) {
    var duration = minutes * 60;
    var timer = duration, mins, secs;

    quizTimer = setInterval(function () {
        mins = parseInt(timer / 60, 10);
        secs = parseInt(timer % 60, 10);

        mins = mins < 10 ? "0" + mins : mins;
        secs = secs < 10 ? "0" + secs : secs;

        display.textContent = mins + ":" + secs;

        if (--timer < 0) {
            clearInterval(quizTimer);
            alert('Time is up! Your quiz will be submitted automatically.');
            // Auto-submit quiz
            document.getElementById('btnSubmitQuiz').click();
        }
    }, 1000);
}

// Character counter for textareas
function updateCharCount(textarea, counterId, maxLength) {
    var counter = document.getElementById(counterId);
    var remaining = maxLength - textarea.value.length;
    counter.textContent = remaining + ' characters remaining';
    
    if (remaining < 0) {
        counter.style.color = '#dc2626';
    } else if (remaining < 50) {
        counter.style.color = '#f59e0b';
    } else {
        counter.style.color = 'var(--moon-silver)';
    }
}

// Smooth scroll to element
function smoothScrollTo(elementId) {
    var element = document.getElementById(elementId);
    if (element) {
        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
}

// Show loading overlay
function showLoading() {
    var overlay = document.createElement('div');
    overlay.id = 'loadingOverlay';
    overlay.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(10,14,39,0.9);display:flex;justify-content:center;align-items:center;z-index:9999;';
    overlay.innerHTML = '<div style="text-align:center;"><div class="loading" style="width:50px;height:50px;border:5px solid rgba(255,255,255,0.3);border-top:5px solid var(--cosmic-gold);"></div><p style="color:var(--cosmic-gold);margin-top:20px;font-size:1.2rem;">Loading...</p></div>';
    document.body.appendChild(overlay);
}

function hideLoading() {
    var overlay = document.getElementById('loadingOverlay');
    if (overlay) {
        overlay.remove();
    }
}

// Auto-hide alerts after 5 seconds
document.addEventListener('DOMContentLoaded', function() {
    var alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(function() {
                alert.remove();
            }, 500);
        }, 5000);
    });

    // Add hover effect to cards
    var cards = document.querySelectorAll('.card');
    cards.forEach(function(card) {
        card.addEventListener('mouseenter', function() {
            this.style.transition = 'all 0.3s ease';
        });
    });
});

// Real-time search filter for tables
function filterTable(inputId, tableId, columnIndex) {
    var input = document.getElementById(inputId);
    var filter = input.value.toUpperCase();
    var table = document.getElementById(tableId);
    var tr = table.getElementsByTagName('tr');

    for (var i = 1; i < tr.length; i++) {
        var td = tr[i].getElementsByTagName('td')[columnIndex];
        if (td) {
            var txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = '';
            } else {
                tr[i].style.display = 'none';
            }
        }
    }
}

// Copy to clipboard
function copyToClipboard(text) {
    navigator.clipboard.writeText(text).then(function() {
        alert('Copied to clipboard!');
    }, function(err) {
        console.error('Could not copy text: ', err);
    });
}

// Format date
function formatDate(date) {
    var options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(date).toLocaleDateString(undefined, options);
}

// Prevent double submission
var formSubmitting = false;
function preventDoubleSubmit(btn) {
    if (formSubmitting) {
        return false;
    }
    formSubmitting = true;
    btn.disabled = true;
    btn.value = 'Processing...';
    showLoading();
    return true;
}
