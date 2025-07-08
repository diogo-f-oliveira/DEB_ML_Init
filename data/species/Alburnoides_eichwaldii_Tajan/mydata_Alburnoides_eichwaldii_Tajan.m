  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_eichwaldii_Tajan

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_eichwaldii_Tajan'; 
metaData.species_en = 'Caspian Spirlin'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour-Poodeh'};        
metaData.date_subm = [2022 01 24];                           
metaData.email    = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Gorgan University of Agricultural Sciences and Natural Resources'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2022 01 29]; 

%% set data
% zero-variate data
data.ah = 3;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'guess'; 
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'guess on the basis of Alburnoides_bipunctatus data with ah = 3 ';
data.ab = 10;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess on the basis of Rutilus rutilus, BeekEmme2007';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'EsmaRahm2012';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'EsmaRahm2012';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'KeivNasr2016';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;    units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'fishbase'; 
data.Lp = 7.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'EsmaRahm2012'; 
data.Lpm = 6.5;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'EsmaRahm2012'; 
data.Li = 17;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'KeivNasr2016';

data.Wwb = 3.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BeekEmme2007';
  comment.Wwb = 'Based on egg diameter of 1.8 mm: 4/3*pi*0.09^3';

data.Ri = 6500/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';          bibkey.Ri = 'EsmaRahm2012';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.5 5.25
1 7.46
2 9.15
3 11.19];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 148/135; % convert fork to total length, base on photo
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EsmaRahm2012';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.5 1.89
1 5.08
2 9.85
3 16.68];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EsmaRahm2012';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
5.396 1.47
5.431 1.96
5.46 1.59
5.571 1.84
5.6	2.14
5.7	2.58
5.707 1.83
5.714 2.56
5.715 2.24
5.794 2.58
5.84 2.06
5.898 3.96
5.915 2.82
5.921 2.48
5.977 2.75
6.047 2.37
6.112 2.83
6.112 2.57
6.121 2.68
6.154 3.09
6.161 2.77
6.177 2.75
6.195 2.87
6.206 3.2
6.218 3.01
6.23 5.15
6.237 4.3
6.253 2.87
6.268 3.05
6.284 2.6
6.357 2.8
6.365 3.45
6.371 4.01
6.412 2.71
6.429 3.18
6.442 2.7
6.527 3.8
6.567 3.05
6.569 3.61
6.573 3.33
6.581 2.79
6.627 3.06
6.655 3.56
6.659 3.58
6.666 3.74
6.667 3.1
6.677 3.45
6.681 4.06
6.7 3.94
6.73 6.37
6.744 3.1
6.762 3.92
6.788 3.91
6.796 3.41
6.85 4.39
6.889 3.45
6.926 4.84
6.927 3.9
6.931 3.76
6.941 3.95
7.021 4.68
7.026 4.17
7.04 4.18
7.053 3.93
7.07 5.11
7.071 4
7.118 4.14
7.146 4.7
7.164 4.83
7.185 4.23
7.188 3.5
7.221 4.57
7.225 4.11
7.254 5.02
7.264 6.37
7.264 4.87
7.288 4.9
7.293 4.22
7.296 3.99
7.347 4.57
7.356 4.34
7.4 4.47
7.405 4.09
7.429 5.36
7.444 5.59
7.444 5.48
7.4 4.45
7.485 4.68
7.495 4.63
7.507 4.86
7.535 5.53
7.585 5.14
7.59 4.43
7.627 6.22
7.631 6.08
7.641 5.32
7.655 5.72
7.709 5.59
7.751 6.44
7.76 5.61
7.77 4.75
7.776 5.98
7.788 5.6
7.82 5.96
7.844 5.67
7.859 5.62
7.863 5.88
7.867 5.08
7.872 5.5
7.9	5.52
7.907 5.97
7.917 5.96
7.93 7.03
7.939 5.92
7.946 6.23
7.952 5.53
7.984 6.46
8.004 7.18
8.012 5.8
8.017 6.21
8.02 6.74
8.059 5.8
8.062 6.08
8.063 5.97
8.066 6.43
8.1 6.11
8.108 7.14
8.136 6.31
8.165 7.81
8.183 6.43
8.191 7.9
8.192 6.4
8.199 6.43
8.202 5.83
8.21 6.48
8.222 6.47
8.228 7.54
8.228 7.09
8.228 6.95
8.237 7.32
8.259 6.99
8.27 7.35
8.273 6.33
8.276 8.31
8.295 7.07
8.311 8.09
8.321 7.41
8.328 7.37
8.332 6.9
8.338 7.11
8.342 5.45
8.343 7.8
8.346 7.66
8.358 6.15
8.376 6.7
8.381 7.06
8.4 7.01
8.401 6.85
8.404 7.35
8.406 7.81
8.425 7.41
8.452 7.01
8.454 7.5
8.463 7.03
8.479 6.36
8.48 7.29
8.482 6.44
8.583 7.04
8.587 7.52
8.596 5.93
8.598 9.08
8.601 8.1
8.61 8.76
8.649 7.92
8.654 8.38
8.665 7.85
8.666 8.08
8.676 8.34
8.7 8.5
8.704 7.19
8.712 8.46
8.729 9.4
8.759 9.03
8.768 7.94
8.771 7.46
8.776 7.66
8.781 7.58
8.797 7.58
8.81 8
8.828 8.38
8.848 9.48
8.851 8.89
8.857 8.59
8.858 8.19
8.877 10.08
8.896 9.13
8.907 8.16
8.91 8.36
8.932 9.56
8.935 8.76
8.938 8.87
8.941 7.19
8.951 8.6
8.958 10.03
9 9.74
9.019 8.84
9.034 9.43
9.035 8.3
9.036 8.53
9.041 7.92
9.042 9.18
9.08 9.97
9.093 9.3
9.109 10.23
9.128 8.49
9.129 10.23
9.138 9.93
9.138 8.65
9.185 10.62
9.2	8.89
9.2	10.84
9.214 10.34
9.3	11.51
9.315 11.28
9.318 9.6
9.321 10.51
9.337 9.37
9.379 9.61
9.381 10.27
9.409 8.88
9.422 10.33
9.474 10.64
9.494 9.85
9.5 10.58
9.5 11.6
9.501 9.17
9.543 11.2
9.568 9.67
9.568 11.45
9.57 10.88
9.583 10.73
9.61 9.04
9.618 14.97
9.634 10.7
9.693 12.56
9.702 12.34
9.708 11.55
9.73 12.1
9.743 10.94
9.75 11.67
9.76 10.58
9.777 11.72
9.804 12.81
9.807 11.51
9.808 12.29
9.808 10.71
9.811 12.54
9.82 11.53
9.843 11.53
9.85 11.58
9.909 12.2
9.932 12.05
9.955 11.37
9.993 12.48
10 13.1
10.021 10.89
10.045 12.28
10.052 14.34
10.094 13.83
10.116 12.56
10.117 13.26
10.124 12.7
10.142 11.52
10.15 14.59
10.179 14.96
10.194 13.79
10.217 12.86
10.23 13.91
10.232 12.3
10.239 12.76
10.266 12.36
10.288 16.2
10.352 12.41
10.364 14.33
10.378 13.11
10.39 14.16
10.408 13.39
10.47 14.77
10.498 11.24
10.591 12.47
10.631 15.42
10.853 17.37
10.986 18.4
11.191 19.55
11.617 24.14];
data.LW(:,1) = data.LW(:,1) * 148/135; % convert fork to total length, based on photo
units.LW = {'d', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'EsmaRahm2012';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '66875'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '14015831'; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_eichwaldii'; % Wikipedia
metaData.links.id_ADW = 'Alburnoides_eichwaldii'; % ADW
metaData.links.id_Taxo = '1682598'; % Taxonomicon
metaData.links.id_WoRMS = '1013089'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-eichwaldii'; % fishbase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeivNasr2016'; type = 'Book'; bib = [ ...  
'author = {Keivani, Y. and Nasri, M. and Abbasi, K. and Abdoli, A.}, ' ...
'year = {2016}, ' ...
'title  = {Atlas of inland water fishes of Iran}, ' ...
'publisher = {Iranian Department of Environment}, ' ...
'pages = {186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EsmaRahm2012'; type = 'phdthesis'; bib = [ ...  
'author = {Esmaeilpour-Poodeh, S. and Rahmani, H.}, ' ...
'year = {2012}, ' ...
'title  = {A survey on feeding habits of Caspian Spirlin (\emph{Alburnoides eichwaldii}) in Tajan River, North of Iran}, ' ...
'school = {Sari Agricultural Sciences and Natural Resources University, Iran}, ' ...
'pages = {170}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeekEmme2007'; type = 'Techreport'; bib = [ ...  
'author = {J. Beekman and W. A. M. van Emmerik}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument blankvoorn \emph{Rutilus rutilus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {3}, '...
'howpublished = {\url{http://www.sportvisserijnederland.nl/files/kennisdocument-gestippelde-alver_4550.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Alburnoides-eichwaldii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];