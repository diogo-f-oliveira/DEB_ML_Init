function [data, auxData, metaData, txtData, weights] = mydata_Sparodon_durbanensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Sparodon_durbanensis'; 
metaData.species_en = 'Musselcracker seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 01];

%% set data
% zero-variate data

data.am = 31*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LessSilv2015';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Lim  = 120;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm of Calotomus_japonicus: pi/6*0.066^3'; 
data.Wwp = 602; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01738*Lp^2.94, see F1';
data.Wwim = 22.5e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.94, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(26.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Diplodus_puntazzo ';

% uni-variate data
% time-length
data.tL_fm = [ ... %  time since birth (yr), length (cm)
    0  5.40 NaN
    1  7.73 NaN
    2 11.80 NaN
    3 14.71 NaN
    4 21.83 27.80
    5 38.07 35.80
    6 36.25 36.33
    7 41.10 41.70
    8 48.95 48.60
    9 54.91 55.11
   10 57.80 57.20
   11 63.76 65.60
   12 68.51 72.18
   13 73.00 73.15
   14 69.86 74.70
   15 76.50 74.05
   16 79.53 67.60
   17 75.70 71.35
   18 82.30 75.00
   19 74.45 NaN
   20 81.50 80.80
   22 95.30 NaN
   23 86.30 86.30
   26 95.90 95.90
   31 87.10 87.10];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0);
units.tL_fm   = {'d','cm'};  label.tL_fm = {'time since birth', 'length'};  
temp.tL_fm = C2K(26.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BuxtClar1991'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lim = 5 * weights.Lim;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data for Lee Stocking, San Blas'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01738*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YVH2'; % Cat of Life
metaData.links.id_ITIS = '647982'; % ITIS
metaData.links.id_EoL = '46580053'; % Ency of Life
metaData.links.id_Wiki = 'Sparodon_durbanensis'; % Wikipedia
metaData.links.id_ADW = 'Sparodon_durbanensis'; % ADW
metaData.links.id_Taxo = '187881'; % Taxonomicon
metaData.links.id_WoRMS = '218627'; % WoRMS
metaData.links.id_fishbase = 'Sparodon-durbanensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished170927 = {\url{http://en.wikipedia.org/wiki/Sparodon_durbanensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BuxtClar1991'; type = 'article'; bib = [ ... 
'doi = {10.2989/02577619109504638}, ' ...
'author = {C. D. Buxton and J. R. Clarke}, ' ... 
'year = {1991}, ' ...
'title = {The biology of the white musselcracker \emph{Sparodon durbanensis} ({P}isces: {S}paridae) on the {E}astern {C}ape coast, {S}outh {A}frica}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {10(1)}, ' ...
'pages = {285-296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sparodon-durbanensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

