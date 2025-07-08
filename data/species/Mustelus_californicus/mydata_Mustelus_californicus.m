function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_californicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_californicus'; 
metaData.species_en = 'Gray smooth-hound'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.9); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 9*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(20.9); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'YudiCail1990';   
  temp.am = C2K(20.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 24;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'YudiCail1990';
  comment.Lb = '21-28 cm';
data.Lp = 70;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'YudiCail1990';
data.Lpm = 61; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'YudiCail1990';
data.Li  = 124;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 116; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwi  = 8.56e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00240*Li^3.13, see F3';
data.Wwim  = 6.95e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = 'fishbase';
  comment.Wwim = 'based on 0.00240*Lim^3.13, see F3';

data.Ri  = 3.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(20.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 pups per litter, 1 litter per  yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.045	36.317
0.084	22.270
2.043	75.717
2.080	71.263
3.027	82.570
3.047	74.347
3.066	68.180
4.026	101.413
4.027	98.672
4.027	96.617
4.028	94.218
5.010	108.608
5.010	105.867
5.011	103.812
5.011	101.756
5.012	99.358
5.976	115.460
5.976	112.034
5.977	109.979
5.977	107.923
5.978	103.126
6.977	123.683
6.978	119.914
6.997	113.747
7.981	120.942
8.947	125.396];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YudiCail1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.098	43.169
0.101	29.465
0.101	26.381
0.102	23.640
1.014	32.548
2.011	61.328
2.045	68.522
2.046	63.726
2.062	71.263
3.030	70.236
3.047	72.634
3.063	83.597
3.063	79.486
3.064	77.088
4.029	87.366
4.030	84.625
4.030	82.570
4.031	80.514
5.050	86.681
6.034	93.191];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YudiCail1990';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00240 * (TL in cm)^3.13';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44QZT'; % Cat of Life
metaData.links.id_ITIS = '160235'; % ITIS
metaData.links.id_EoL = '46559991'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_californicus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_californicus'; % ADW
metaData.links.id_Taxo = '106421'; % Taxonomicon
metaData.links.id_WoRMS = '271381'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-californicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_californicus}}';  
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
bibkey = 'YudiCail1990'; type = 'article'; bib = [ ... 
'author = {Katherine G. Yudin and Gregor M. Cailliet}, ' ...
'year = {1990}, ' ...
'title  = {Age and Growth of the Gray Smoothhound, \emph{Mustelus californicus}, and the Brown Smoothhound, \emph{M. henlei}, Sharks from Central {C}alifornia}, ' ...
'journal = {Copeia}, ' ...
'volume = {1990(1)}, ' ...
'pages = {191-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-californicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

