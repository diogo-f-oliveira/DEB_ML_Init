function [data, auxData, metaData, txtData, weights] = mydata_Branchinecta_gigas
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Branchinectidae';
metaData.species    = 'Branchinecta_gigas'; 
metaData.species_en = 'Giant fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; }; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 17]; 

%% set data
% zero-variate data

data.tp = 30;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Dabo1975';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 60;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Dabo1975';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.1; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Dabo1975';
data.Lp  = 4.75;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Dabo1975';
data.Li  = 18;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  
data.Wdi  = 2.6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Dabo1975';
  comment.Wdi = 'based on F1 for Li';

data.Ri  = 630/27;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Dabo1975';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '630 eggs in 27 d at 6 cm ultimate length';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (cm)
0.000	0.085
3.717	0.127
10.289	0.354
16.466	1.798
20.183	1.940
22.255	3.512
30.376	4.630
37.470	5.522
44.639	5.947
50.558	5.579
58.960	6.669];
units.tL_f   = {'d', 'cm'}; label.tL_f = {'time since birth', 'length', 'females'};  
temp.tL_f = C2K(14); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'Dabo1975'; comment.tL_f = 'females from Fleeinghorse Lake in 1972';
%
data.tL_m = [ ... % time since birth (d), length (cm)
0.000	0.123
4.138	0.192
9.961	0.345
17.558	2.026
21.949	3.058
24.394	3.340
30.183	4.243
36.903	4.736
44.389	4.633
50.342	4.701
57.827	4.599];
units.tL_m   = {'d', 'cm'}; label.tL_m = {'time since birth', 'length', 'males'};  
temp.tL_m = C2K(14); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'Dabo1975'; comment.tL_m = 'males from Fleeinghorse Lake in 1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 10;weights.tL_f(end) = 0;
weights.tL_m = weights.tL_m * 10;
weights.Lb = weights.Lb * 5;
weights.Li = weights.Li * 10;

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
D1 = 'males are assumed to differ from females by {p_Am} only'; 
D2 = 'temperature (in C) in tL data is assumed as T(t) = spline1(t,[0 3; 5 5; 12 20; 60 25])';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight for males W (in mug) = 0.108*(length in mm)^3.27';
metaData.bibkey.F1 = 'Dabo1975'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'N6GD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '338982'; % Ency of Life
metaData.links.id_Wiki = 'Branchinecta_gigas'; % Wikipedia
metaData.links.id_ADW = 'Branchinecta_gigas'; % ADW
metaData.links.id_Taxo = '76178'; % Taxonomicon
metaData.links.id_WoRMS = '1150183'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branchinecta_gigas}}';
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
bibkey = 'Dabo1975'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1936144}, ' ...
'author = {Graham R. Daborn}, ' ... 
'year = {1975}, ' ...
'title = {Life History and Energy Relations of the Giant Fairy Shrimp \emph{Branchinecta gigas} {L}ynch 1937 ({C}rustacea: {A}nostraca)}, ' ...
'journal = {Ecology}, ' ...
'volume = {56(5)}, ' ...
'pages = {1025–1039}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
