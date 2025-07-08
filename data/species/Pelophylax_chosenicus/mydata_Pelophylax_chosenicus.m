function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_chosenicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_chosenicus'; 
metaData.species_en = 'Seoul frog'; 

metaData.ecoCode.climate = {'Dfa', 'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTh'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 11];

%% set data
% zero-variate data

data.tp = 2.5*365; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'CheoPark2007';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'CheoPark2007';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.0;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'CheoPark2007';
data.Lp  = 3.6;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lim*0.7';
data.Lpm  = 2.4;  units.Lpm  = 'cm'; label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'guess';
  comment.Lpm = 'based on Lim*0.7';
data.Li  = 5.18;  units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';   bibkey.Li  = 'CheoPark2007';
data.Lim = 3.42;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL of males';    bibkey.Lim  = 'CheoPark2007';  

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 18.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of females';   bibkey.Wwi = 'CheoPark2007';
data.Wwim = 3.9; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'CheoPark2007';

data.Ri = 1.6e3/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pelophylax_esculentus: 7300*18.2/80';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
2   NaN   2.940
3   NaN   3.554
3   NaN   3.718
3   NaN   3.241
3   NaN   4.030
3   NaN   3.093
4	4.138 3.379
4	4.628 3.498
4	5.415 3.632
4   NaN   3.945
4   NaN   3.126
5	5.623 3.576
5	4.275 3.398
6	5.603 NaN
6	5.918 NaN
6	5.113 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + .8) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CheoPark2007'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males from Cheongwon';

% length-weight
data.LW_f = [... SVL (cm), weight (g)
    4.77 15.03
    5.18 18.37
    5.58 21.22
    5.42 16.60
    5.64 20.35
    4.83 11.20];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'SVL','weight','females'};  
bibkey.LW_f = 'CheoPark2007'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [... SVL (cm), weight (g)
    2.93 1.80
    3.51 3.95
    3.40 4.00
    3.47 4.20
    3.17 3.28
    3.71 4.36
    3.96 5.76
    3.20 3.10];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'SVL','weight','males'};  
bibkey.LW_m = 'CheoPark2007'; 
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lpm = 5 * weights.Lpm;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females,males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '76CJ6'; % Cat of Life
metaData.links.id_ITIS = '775182'; % ITIS
metaData.links.id_EoL = '332992'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_chosenicus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_chosenicus'; % ADW
metaData.links.id_Taxo = '996599'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+chosenicus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_chosenicus}}';
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
bibkey = 'CheoPark2007'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z96-216}, ' ...
'author = {Cheong, Seokwam and Daesik Park and Ha-Cheo Sung and Jung Hyun Lee and Shi-Ryong Park}, ' ... 
'year = {2007}, ' ...
'title = {Skeletochronological age determination and comparative dempgraphic analysis of two populations of the gold-spotted pond frog (\emph{Rana chosenica})}, ' ...
'journal = {J. Ecol. Field Biol.}, ' ...
'volume = {30(1)}, ' ...
'pages = {57-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
