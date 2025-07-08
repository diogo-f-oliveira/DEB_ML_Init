function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_beebei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_beebei'; 
metaData.species_en = 'Southern whitetail major'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
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

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(24.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MeekAcke2001';   
  temp.am = C2K(24.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 2.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 66.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.781	4.205
0.786	5.324
0.786	5.439
0.788	5.902
0.848	5.054
0.910	4.630
1.032	3.242
1.679	5.905
1.744	6.252
1.750	7.486
1.750	7.525
1.806	5.828
1.809	6.445
1.810	6.677
1.810	6.831
1.811	6.985
1.812	7.255
1.814	7.718
1.932	5.405
2.007	8.066
2.958	7.375
3.022	7.491
3.087	7.761
3.089	8.262
3.148	7.182
3.152	7.992
3.849	7.378
3.851	7.725
3.916	8.033
3.916	8.110
3.981	8.342
3.981	8.496
4.046	8.766
4.808	8.422
4.937	8.731
4.995	7.536
5.055	6.649
5.128	8.770
5.252	7.961
5.887	7.654
6.906	7.850
7.035	8.352
7.865	8.895
7.991	8.702
8.882	8.628
9.011	9.168
9.839	9.287
9.904	9.596
10.092	8.941
11.108	8.481
11.939	9.294
12.893	9.027
13.911	9.146
13.913	9.647
14.932	9.766
15.884	9.230
16.841	9.696
16.965	9.002
18.941	9.664];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'Galapagos'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNMT'; % Cat of Life
metaData.links.id_ITIS = '615544'; % ITIS
metaData.links.id_EoL = '46572329'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_beebei'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_beebei'; % ADW
metaData.links.id_Taxo = '593981'; % Taxonomicon
metaData.links.id_WoRMS = '276665'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-beebei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_beebei}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-beebei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
