function recoverSignal(noisySound,Fs,noiseFactor)

    promptMessage = sprintf('Do you want to Recover Noisy Sound?');
    titleBarCaption = 'Recover Sound';
    button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No','Yes');
    if (strcmpi(button, 'Yes'))
        if(noiseFactor<0.15 && noiseFactor>0.01)
            recoveredSound = wden(noisySound,'heursure','s','sln',5,'sym4');

            soundsc(recoveredSound,Fs);
            fourierTransform(Fs,recoveredSound,'The Recovered Wave File','The Recovered Wave FFT');

            promptMessage = sprintf('Do you want to Amplify recovered signal?');
            titleBarCaption = 'Amplify Sound';
            button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No','Yes');
            
            if (strcmpi(button, 'Yes'))
                promptMessage = sprintf('How do you want to Amplify recovered signal?');
                titleBarCaption = 'Amplify Sound';
                button = questdlg(promptMessage, titleBarCaption, 'For Normal Person', 'For Hearing Impaired','For Normal Person');
                    if (strcmpi(button, 'For Normal Person'))
                        code=1;
                    else
                        code=2;
                    end
                amplifySignal(code,recoveredSound,Fs);
            end

        else
            
            promptMessage = sprintf('Sorry, Signal cannot be recovered due to excessive distortion by noise');
            titleBarCaption = 'Sorry!';
            errordlg(promptMessage, titleBarCaption);
            
        end
    end
end
