#!/bin/bash

echo -n "Please enter your name: "
read user_name
sleep 1
echo "--------------------------------------------------------------------------"
echo "Dear $user_name please wait as we we prepare the running environment for the app"
sleep 2
main_dir="submission_reminder_${user_name}"

app_dir="$main_dir/app"
modules_dir="$main_dir/modules"
assets_dir="$main_dir/assets"
config_dir="$main_dir/config"

mkdir -p "$main_dir" "$app_dir" "$modules_dir" "$assets_dir" "$config_dir"

cat << EOF > "$config_dir/config.env"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat << EOF > "$app_dir/reminder.sh"
#!/bin/bash

source "\$(pwd)/config/config.env"
if [ ! -f "\$(pwd)/modules/functions.sh" ]; then
    echo "Error: functions.sh not found!"
    exit 1
fi
source "\$(pwd)/modules/functions.sh"

submissions_file="\$(pwd)/assets/submissions.txt"
if [ ! -f "\$submissions_file" ]; then
    echo "Error: submissions file not found!"
    exit 1
fi

echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "\$submissions_file"
EOF
chmod +x "$app_dir/reminder.sh"

cat << EOF > "$modules_dir/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    while IFS=',' read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOF
chmod +x "$modules_dir/functions.sh"

cat << EOF > "$assets_dir/submissions.txt"
Student Name, Assignment, Status
Chinemerem, Shell Navigation, submitted
Chiagoziem, Git, submitted
Julius Kate, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Jean De Dieu Rukara, Shell Navigation, not submitted
Divine Keza, Git, not submitted
Cindy Bwiza, Shell Navigation, not submitted
Mike Mizero, Shell Basics, late submission
Saad Byiringiro, Shell Navigation, not submitted
Aime Cyuzuzo, Git, submitted
Jean Philippe N., Shell Basics, not submitted
EOF

cat << EOF > "$main_dir/startup.sh"
#!/bin/bash
echo 'Starting Submission Reminder App...'
sleep 1
echo "ASSIGNMENT SUBMISSION DETAILS"
echo "---------------------------------"
sleep 2
bash "\$(dirname "\$0")/app/reminder.sh"
EOF
chmod +x "$main_dir/startup.sh"

echo "Hey $user_name You are good to go ! The environment for the app to run is ready."
echo "-------------------------------------------------------------"
sleep 1
echo "Type y (yes) or n (no) if you would like me to open the app for you. If you'd rather navigate manually, use: cd $main_dir && ./startup.sh. Either way, let's get started!"
sleep 1

read -r choice
choice=$(echo "$choice" | xargs)

case "$choice" in
    [yY]|[yY][eE][sS]) 
        if cd "$main_dir"; then
            ./startup.sh
        else
            echo "Error: Failed to navigate to $main_dir."
        fi
        ;;
    *) echo "No worries! You can start the app manually by running: (cd $main_dir) and then ( ./startup.sh)!" ;;
esac

