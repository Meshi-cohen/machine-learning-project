
s = load('DREAMER.mat');
data = s.DREAMER;
participants = data.Data;
 
output_base = 'DREAMER_CSV';
if ~exist(output_base, 'dir')
    mkdir(output_base);
end

fs = 128;
num_subjects = length(participants);
num_trials = 18;

for subj_idx = 1:num_subjects
    subj_dir = fullfile(output_base, sprintf('subject_%02d', subj_idx));
    if ~exist(subj_dir, 'dir')
        mkdir(subj_dir);
    end

    eeg_cells = participants{subj_idx}.EEG.stimuli;    
    valence = participants{subj_idx}.ScoreValence;
    arousal = participants{subj_idx}.ScoreArousal;

    for trial_idx = 1:num_trials
        eeg_trial = eeg_cells{trial_idx};               
        if size(eeg_trial, 1) == 14
            eeg_trial = eeg_trial';
        end

        num_samples = size(eeg_trial, 1);

        val_col = repmat(double(valence(trial_idx)), num_samples, 1);
        arousal_col = repmat(double(arousal(trial_idx)), num_samples, 1);

        combined = [eeg_trial, val_col, arousal_col];
        [~, nCols] = size(combined);
        trial_table = array2table(combined);
        channel_names = arrayfun(@(c) sprintf('ch%d', c), 1:(nCols - 2), 'UniformOutput', false);
        trial_table.Properties.VariableNames = [channel_names, {'valence', 'arousal'}];

        filename = fullfile(subj_dir, sprintf('trial_%02d.csv', trial_idx));
        writetable(trial_table, filename);

    
        fprintf('Saved : subject %02d, trial %02d\n', subj_idx, trial_idx);
    end
end
