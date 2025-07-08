function [data, auxData, metaData, txtData, weights] = mydata_Furgaleus_macki
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Furgaleus_macki'; 
metaData.species_en = 'Whiskery shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2  = {'Bas Kooijman'};        
metaData.date_mod_2    = [2024 10 25];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 8*30.5; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7-9 mnth';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'SimpChid2000';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 22.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'Wiki';
  comment.Lb = 'TL 20-25 cm';
data.Lp = 136;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'SimpChid2000';
  comment.Lp = 'based on tp 4.5 yr and tL data';
data.Lpm = 126; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'SimpChid2000';
  comment.Lpm = 'based on tp 4.5 yr and tL data';
data.Li  = 160;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi  = 20e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00417*Li^3.07, see F3; max reported weight 12.9 kg';

data.Ri  = 18/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-24 pups per litter, 1 litter per 2 yr';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.438	60.912
1.542	51.088
2.490	66.316
2.490	71.228
2.491	75.158
2.493	87.930
4.492	108.070
4.533	95.298
4.533	98.737
5.484	135.088
5.502	114.456
5.503	118.877
5.521	102.175
5.543	105.123
5.544	110.526
6.489	106.105
6.489	109.544
6.490	113.965
6.490	117.404
6.491	120.842
7.477	107.088
7.477	110.035
7.477	112.982
7.478	116.912
7.499	119.860
7.521	125.754
8.487	115.930
8.487	118.877
8.488	122.316
8.488	125.263
8.506	107.579
8.507	112.000
9.494	107.579
9.495	111.509
9.495	114.456
9.496	121.333
10.482	111.509
10.483	115.439
10.526	119.860
10.527	127.719];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/0.88; % convert FL to TL
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(22.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SimpChid2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.438	84.296
2.459	65.070
3.447	111.901
3.447	108.451
3.468	100.070
4.392	100.070
4.392	105.000
4.392	108.451
4.434	111.408
5.443	112.394
5.443	115.845
5.464	107.958
6.389	119.296
6.389	116.338
6.389	110.915
6.494	124.718
7.398	113.380
7.419	116.338
7.419	119.789
7.419	123.732
7.419	125.211
7.440	97.113
7.440	104.507
8.427	121.268
8.427	116.831
8.427	112.887
8.448	124.225
8.469	129.648
9.394	118.310
9.394	122.254
9.394	125.211
9.415	109.437
9.415	129.155
10.403	124.718
10.403	120.775
10.445	108.944
11.370	100.070
11.412	125.704];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/0.88; % convert FL to TL
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(22.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SimpChid2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.Wwi = 10 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'ab is ignorned, because tL data suggest 6 rather than 10 mnth, but all temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'aplacental viviparous, histotrophy is likely';
metaData.bibkey.F1 = {'fishbase','Wiki'}; 
F2 = 'demersal; depth range 0 - 200 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00417 * (TL in cm)^3.07';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'length-length from photo: FL = 0.88*TL';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '6K4PG'; % Cat of Life
metaData.links.id_ITIS = '160535'; % ITIS
metaData.links.id_EoL = '46559971'; % Ency of Life
metaData.links.id_Wiki = 'Furgaleus_macki'; % Wikipedia
metaData.links.id_ADW = 'Furgaleus_macki'; % ADW
metaData.links.id_Taxo = '106414'; % Taxonomicon
metaData.links.id_WoRMS = '280805'; % WoRMS
metaData.links.id_fishbase = 'Furgaleus-macki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Furgaleus_macki}}';  
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
bibkey = 'SimpChid2000'; type = 'article'; bib = [ ... 
'author = {Colin A. Simpfendorfera and Justin Chidlow and Rory McAuley and Philip Unsworth}, ' ...
'year = {2000}, ' ...
'title  = {Age and growth of the whiskery shark, \emph{Furgaleus macki}, from southwestern {A}ustralia}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {58}, ' ...
'pages = {335-343}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Furgaleus-macki.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

