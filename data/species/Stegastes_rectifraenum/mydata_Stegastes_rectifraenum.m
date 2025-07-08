function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_rectifraenum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_rectifraenum'; 
metaData.species_en = 'Cortez damselfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(23.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(23.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13.5;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 2.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01995*Lp^2.98, see F1';
data.Wwi = 46.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^2.98, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(23.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.856	6.210
0.860	4.543
0.963	7.296
0.964	6.870
0.965	6.366
0.966	5.707
0.968	4.893
0.998	7.800
0.998	7.645
0.998	7.529
0.999	7.219
1.000	6.638
1.030	9.351
1.032	8.615
1.033	8.227
1.036	7.064
1.075	5.902
1.895	11.840
1.897	11.065
1.899	10.367
1.933	11.414
1.934	10.833
1.938	9.166
1.940	8.468
1.971	10.600
1.974	9.476
1.976	8.585
2.013	8.314
2.876	11.501
2.953	9.874
2.986	10.998
2.988	10.145
2.992	8.711
3.021	11.812
3.022	11.308
3.023	10.727
3.060	10.495
3.062	9.565
3.065	8.363
3.897	9.805
3.933	9.612
3.964	11.938
3.966	11.240
4.039	11.047
4.039	10.892
4.041	10.000
4.080	9.071
4.113	10.272
4.912	10.203
4.949	9.777
4.983	11.017
5.020	10.475
6.941	11.734
6.941	11.540
6.977	11.928
7.051	11.425
7.053	10.611
7.957	11.783
7.958	11.434
7.995	11.240
7.995	11.046
8.939	11.056
9.953	12.189
10.027	11.376
11.010	10.262
11.045	10.688];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'Galapagos'};  
temp.tL    = C2K(23.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeekAcke2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_G','tL_P'}; subtitle1 = {'Data from Galapagos, Panama'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNNQ'; % Cat of Life
metaData.links.id_ITIS = '615080'; % ITIS
metaData.links.id_EoL = '46572344'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_rectifraenum'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_rectifraenum'; % ADW
metaData.links.id_Taxo = '46289'; % Taxonomicon
metaData.links.id_WoRMS = '276680'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-rectifraenum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_rectifraenum}}';
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
bibkey = 'MeekAcke2001'; type = 'Article'; bib = [ ... 
'doi = {10.3354/MEPS212223}, ' ...
'author = {M. G. Meekan and J. L. Ackerman and G. M. Wellington}, ' ... 
'year = {2001}, ' ...
'title = {Demography and age structures of coral reef damselfishes in the tropical eastern {P}acific {O}cean}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {212}, ' ...
'pages = {223–232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-rectifraenum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
