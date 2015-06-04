function [ y ] = grabacion( t, Fs, Ch )
    recObj = audiorecorder(Fs, 16, Ch);
    recordblocking(recObj, t);
    y = getaudiodata(recObj);
end

